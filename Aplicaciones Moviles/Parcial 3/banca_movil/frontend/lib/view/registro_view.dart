import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistroView extends StatefulWidget {
  @override
  _RegistroViewState createState() => _RegistroViewState();
}

class _RegistroViewState extends State<RegistroView> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;
  String errorMessage = '';
  String cedulaError = '';
  String emailError = '';
  String passwordError = '';

  // Función para validar los datos de entrada
  void validarDatos() {
    final cedula = _cedulaController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    setState(() {
      cedulaError = '';
      emailError = '';
      passwordError = '';
    });

    if (_nombreController.text.isEmpty || _apellidoController.text.isEmpty || cedula.isEmpty || email.isEmpty || _usernameController.text.isEmpty || password.isEmpty) {
      setState(() {
        errorMessage = 'Todos los campos son obligatorios.';
      });
    } else {
      setState(() {
        errorMessage = ''; // Limpiar error general
      });
    }

    if (cedula.isNotEmpty && cedula.length != 10) {
      setState(() {
        cedulaError = 'La cédula debe tener 10 dígitos.';
      });
    }

    if (email.isNotEmpty && (!email.contains('@') || !email.contains('.'))) {
      setState(() {
        emailError = 'Por favor ingresa un correo electrónico válido.';
      });
    }

    if (password.isNotEmpty && password.length < 6) {
      setState(() {
        passwordError = 'La contraseña debe tener al menos 6 caracteres.';
      });
    }
  }

  // Función para registrar al usuario
  Future<void> registrarUsuario() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    if (_nombreController.text.isEmpty || _apellidoController.text.isEmpty || _cedulaController.text.isEmpty || _emailController.text.isEmpty || _usernameController.text.isEmpty || _passwordController.text.isEmpty || cedulaError.isNotEmpty || emailError.isNotEmpty || passwordError.isNotEmpty) {
      setState(() {
        isLoading = false; // Detener el loader si hay error
      });
      return;
    }

    final usuario = {
      'nombre': _nombreController.text,
      'apellido': _apellidoController.text,
      'cedula': _cedulaController.text,
      'email': _emailController.text,
      'username': _usernameController.text,
      'password': _passwordController.text,
    };

    try {
      final response = await http.post(
        Uri.parse('http://192.168.100.124:8080/usuarios/registrar'), // URL del endpoint
        body: json.encode(usuario),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        // Si la creación es exitosa, mostramos un mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Usuario registrado exitosamente")));
        Navigator.pop(context); // Regresamos a la pantalla de login
      } else {
        setState(() {
          errorMessage = 'Hubo un error al registrar el usuario. Inténtalo nuevamente.';
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
      appBar: AppBar(
        title: Text("Registro de Usuario"),
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
                "Regístrate en tu Banca Móvil",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 40),

              // Caja de texto para el nombre
              TextField(
                controller: _nombreController,
                onChanged: (_) => validarDatos(),
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Ingresa tu nombre',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                  prefixIcon: Icon(Icons.person, color: Colors.blueAccent),
                ),
                style: TextStyle(color: Colors.blueAccent),
              ),
              SizedBox(height: 16),

              // Caja de texto para el apellido
              TextField(
                controller: _apellidoController,
                onChanged: (_) => validarDatos(),
                decoration: InputDecoration(
                  labelText: 'Apellido',
                  hintText: 'Ingresa tu apellido',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                  prefixIcon: Icon(Icons.person, color: Colors.blueAccent),
                ),
                style: TextStyle(color: Colors.blueAccent),
              ),
              SizedBox(height: 16),

              // Caja de texto para la cédula
              TextField(
                controller: _cedulaController,
                onChanged: (_) => validarDatos(),
                decoration: InputDecoration(
                  labelText: 'Cédula',
                  hintText: 'Ingresa tu número de cédula',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                  prefixIcon: Icon(Icons.credit_card, color: Colors.blueAccent),
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.blueAccent),
              ),
              if (cedulaError.isNotEmpty) ...[
                SizedBox(height: 5),
                Text(cedulaError, style: TextStyle(color: Colors.red, fontSize: 14)),
              ],
              SizedBox(height: 16),

              // Caja de texto para el email
              TextField(
                controller: _emailController,
                onChanged: (_) => validarDatos(),
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Ingresa tu correo electrónico',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                  prefixIcon: Icon(Icons.email, color: Colors.blueAccent),
                ),
                style: TextStyle(color: Colors.blueAccent),
              ),
              if (emailError.isNotEmpty) ...[
                SizedBox(height: 5),
                Text(emailError, style: TextStyle(color: Colors.red, fontSize: 14)),
              ],
              SizedBox(height: 16),

              // Caja de texto para el username
              TextField(
                controller: _usernameController,
                onChanged: (_) => validarDatos(),
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Ingresa un nombre de usuario',
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
                onChanged: (_) => validarDatos(),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  hintText: 'Ingresa tu contraseña',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                  prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
                ),
                style: TextStyle(color: Colors.blueAccent),
              ),
              if (passwordError.isNotEmpty) ...[
                SizedBox(height: 5),
                Text(passwordError, style: TextStyle(color: Colors.red, fontSize: 14)),
              ],
              SizedBox(height: 24),

              // Botón de registro
              ElevatedButton(
                onPressed: isLoading ? null : registrarUsuario, // Desactivar el botón mientras se carga
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.white) // Mostrar spinner mientras carga
                    : Text('Registrarse', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 5,
                ),
              ),

              // Mensaje de error general
              if (errorMessage.isNotEmpty) ...[
                SizedBox(height: 20),
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
