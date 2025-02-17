import 'package:flutter/material.dart';
import 'package:frontend/view/registro_view.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config/Session.dart'; // Importa la variable global
import '../config/ApiConfig.dart';
import './cuenta_view.dart';  // Asegúrate de que la importación sea correcta

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
        //emisorId = data['id'];

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CuentaView(
              nombre: nombre,
              apellido: apellido,
              numeroCuenta: numeroCuenta,
              saldoDisponible: saldoDisponible,
            ),
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
        backgroundColor: Color(0xFF1A237E), // Azul oscuro para el AppBar
        elevation: 0,
        automaticallyImplyLeading: false, // Quitar la flecha hacia atrás
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
            //Text("¿Olvidaste tu contraseña?", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
            //SizedBox(height: 20),
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
