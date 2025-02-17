import 'package:flutter/material.dart';
import 'package:frontend/view/registro_view.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/ApiConfig.dart';
import './cuenta_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String errorMessage = '';
  bool isLoading = false;

  Future<void> login() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    final String username = _usernameController.text;
    final String password = _passwordController.text;

    try {
      final response = await http.post(
        Uri.parse("${ApiConfig.baseUrl}/auth/login"),
        body: json.encode({'username': username, 'password': password}),
        headers: {"Content-Type": "application/json"},
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final String nombre = data['nombre'];
        final String apellido = data['apellido'];
        final String numeroCuenta = data['numeroCuenta'];
        final double saldoDisponible = data['saldoDisponible'];

        // Guardar datos en SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('numeroCuenta', numeroCuenta);
        await prefs.setString('nombre', nombre);
        await prefs.setString('apellido', apellido);
        await prefs.setString('saldoDisponible', saldoDisponible.toString());

        print("Datos del usuario: nombre=$nombre, numeroCuenta=$numeroCuenta, saldoDisponible=$saldoDisponible"); // Debug

        Navigator.pushReplacement( // Use pushReplacement to avoid going back to login
          context,
          MaterialPageRoute(
            builder: (context) => CuentaView(),
          ),
        );
      } else {
        setState(() {
          errorMessage = 'Usuario o contraseña incorrectos';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error de conexión: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Iniciar sesión", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF1A237E),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Bienvenido a tu Banca Móvil",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            SizedBox(height: 40),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Usuario',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[100],
                prefixIcon: Icon(Icons.person, color: Colors.blueAccent),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[100],
                prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: isLoading ? null : login,
              child: isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('Iniciar sesión', style: TextStyle(fontSize: 18, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            if (errorMessage.isNotEmpty) ...[
              SizedBox(height: 20),
              Text(errorMessage, style: TextStyle(color: Colors.red, fontSize: 16)),
            ],
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegistroView()),
              ),
              child: Text("Crear cuenta", style: TextStyle(fontSize: 18, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.greenAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}