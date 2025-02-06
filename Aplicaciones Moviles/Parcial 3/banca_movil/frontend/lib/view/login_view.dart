import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Para decodificar la respuesta JSON
import './cuenta_view.dart'; // Importa la vista CuentaView
import './registro_view.dart'; // Importa la vista RegistroView (debes crear esta vista)

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String errorMessage = '';
  bool isLoading = false; // Variable para mostrar el loader

  Future<void> login() async {
    setState(() {
      isLoading = true; // Activar el loader mientras se hace la petición
      errorMessage = ''; // Limpiar cualquier mensaje anterior
    });

    final String username = _usernameController.text;
    final String password = _passwordController.text;

    try {
      final response = await http.post(
        Uri.parse('http://192.168.100.124:8080/auth/login'), // URL del endpoint
        body: json.encode({'username': username, 'password': password}),
        headers: {"Content-Type": "application/json"},
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Si el login es exitoso, obtenemos el número de cuenta y saldo
        final data = json.decode(response.body); // Suponiendo que el backend devuelve un JSON con esos datos
        final numeroCuenta = data['numeroCuenta'];
        final saldo = data['saldo'];

        // Navegar a la CuentaView y pasar los datos
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CuentaView(
              numeroCuenta: numeroCuenta,
              saldo: saldo,
            ),
          ),
        );
      } else {
        // Si el login falla
        setState(() {
          errorMessage = 'Usuario o contraseña incorrectos';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error de conexión: $e'; // Mostrar error si hay problemas de red
      });
    } finally {
      setState(() {
        isLoading = false; // Detener el loader
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco para un diseño limpio
      appBar: AppBar(
        title: Text("Iniciar sesión"),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Título de la app
              Text(
                "Bienvenido a tu Banca Móvil",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 40),

              // Caja de texto para el username
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Ingresa tu nombre de usuario',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                  prefixIcon: Icon(Icons.person, color: Colors.blueAccent),
                ),
                style: TextStyle(color: Colors.blueAccent),
              ),
              SizedBox(height: 16),

              // Caja de texto para la contraseña
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Ingresa tu contraseña',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                  prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
                ),
                style: TextStyle(color: Colors.blueAccent),
              ),
              SizedBox(height: 24),

              // Botón de login
              ElevatedButton(
                onPressed: isLoading ? null : login, // Desactivar el botón mientras se carga
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.white) // Mostrar spinner mientras carga
                    : Text('Iniciar sesión', style: TextStyle(fontSize: 18, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 5,
                ),
              ),

              // Mensaje de error
              if (errorMessage.isNotEmpty) ...[
                SizedBox(height: 20),
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ],

              SizedBox(height: 40),

              // Pie de página con un mensaje
              Text(
                "¿Olvidaste tu contraseña?",
                style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Botón de crear cuenta
              ElevatedButton(
                onPressed: () {
                  // Aquí agregamos la navegación a la pantalla de registro
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistroView(),
                    ),
                  );
                },
                child: Text("Crear cuenta", style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
