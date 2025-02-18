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

    validarDatos(); // Validar datos antes de registrar

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
      backgroundColor: Color(0xFFE3F2FD), // Fondo más claro
      appBar: AppBar(
        title: Text("Registro de Usuario", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF1A237E), // Color principal
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.person_add, // Ícono para el registro
                size: 72,
                color: Color(0xFF1A237E),
              ),
              SizedBox(height: 32),
              Text(
                "Regístrate en tu Banca Móvil",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A237E),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: _nombreController,
                onChanged: (_) => validarDatos(),
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Ingresa tu nombre',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.person, color: Color(0xFF1A237E)),
                  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _apellidoController,
                onChanged: (_) => validarDatos(),
                decoration: InputDecoration(
                  labelText: 'Apellido',
                  hintText: 'Ingresa tu apellido',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.person, color: Color(0xFF1A237E)),
                  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _cedulaController,
                onChanged: (_) => validarDatos(),
                decoration: InputDecoration(
                  labelText: 'Cédula',
                  hintText: 'Ingresa tu número de cédula',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.credit_card, color: Color(0xFF1A237E)),
                  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  errorText: cedulaError.isNotEmpty ? cedulaError : null, // Mostrar error directamente
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                onChanged: (_) => validarDatos(),
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Ingresa tu correo electrónico',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.email, color: Color(0xFF1A237E)),
                  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  errorText: emailError.isNotEmpty ? emailError : null,
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _usernameController,
                onChanged: (_) => validarDatos(),
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Ingresa un nombre de usuario',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.person, color: Color(0xFF1A237E)),
                  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                onChanged: (_) => validarDatos(),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  hintText: 'Ingresa tu contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF1A237E)),
                  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  errorText: passwordError.isNotEmpty ? passwordError : null,
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: isLoading ? null : registrarUsuario,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: isLoading
                      ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                      : Text('Registrarse', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A237E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              if (errorMessage.isNotEmpty) ...[
                SizedBox(height: 20),
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}