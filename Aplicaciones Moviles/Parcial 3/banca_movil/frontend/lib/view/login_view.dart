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
        final int usuarioId = data['id']; // Obtén el ID del usuario

        // Guardar datos en SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('numeroCuenta', numeroCuenta);
        await prefs.setString('nombre', nombre);
        await prefs.setString('apellido', apellido);
        await prefs.setString('saldoDisponible', saldoDisponible.toString());
        await prefs.setInt('usuarioId', usuarioId); // Guarda el usuarioId

        print("Datos del usuario: nombre=$nombre, numeroCuenta=$numeroCuenta, saldoDisponible=$saldoDisponible, usuarioId=$usuarioId"); // Debug

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
      backgroundColor: Color(0xFFE3F2FD), // Fondo más claro
      body: Center( // Centrar el contenido
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32), // Aumentar el padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Alinear verticalmente en el centro
            crossAxisAlignment: CrossAxisAlignment.stretch, // Estirar los elementos horizontalmente
            children: [
              // Icono de la aplicación
              Icon(
                Icons.account_balance, // Icono de banco (reemplaza con el que prefieras)
                size: 72, // Aumentar el tamaño del icono
                color: Color(0xFF1A237E), // Color principal
              ),
              SizedBox(height: 32),
              Text(
                "Bienvenido a tu Banca Móvil",
                style: TextStyle(
                  fontSize: 28, // Aumentar el tamaño del texto
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A237E), // Color principal
                ),
                textAlign: TextAlign.center, // Centrar el texto
              ),
              SizedBox(height: 40),
              // Campo de texto para el usuario
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12), // Bordes redondeados
                  ),
                  filled: true,
                  fillColor: Colors.white, // Fondo blanco
                  prefixIcon: Icon(Icons.person, color: Color(0xFF1A237E)),
                  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20), // Aumentar el padding
                ),
              ),
              SizedBox(height: 20),
              // Campo de texto para la contraseña
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12), // Bordes redondeados
                  ),
                  filled: true,
                  fillColor: Colors.white, // Fondo blanco
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF1A237E)),
                  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20), // Aumentar el padding
                ),
              ),
              SizedBox(height: 24),
              // Botón de inicio de sesión
              ElevatedButton(
                onPressed: isLoading ? null : login,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16), // Aumentar el padding
                  child: isLoading
                      ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                      : Text('Iniciar sesión', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A237E), // Color principal
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // Bordes redondeados
                  padding: EdgeInsets.symmetric(vertical: 14),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              // Mensaje de error
              if (errorMessage.isNotEmpty) ...[
                SizedBox(height: 20),
                Text(errorMessage, style: TextStyle(color: Colors.red, fontSize: 16), textAlign: TextAlign.center),
              ],
              SizedBox(height: 32),
              // Botón para crear cuenta
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistroView()),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14), // Aumentar el padding
                  child: Text("¿No tienes cuenta? Crear cuenta", style: TextStyle(fontSize: 16, color: Color(0xFF1A237E))),
                ),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}