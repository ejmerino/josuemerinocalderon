import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../config/ApiConfig.dart';
import 'login_view.dart';

class EditarPerfilView extends StatefulWidget {
  @override
  _EditarPerfilViewState createState() => _EditarPerfilViewState();
}

class _EditarPerfilViewState extends State<EditarPerfilView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _initialEmail;
  String? _initialUsername;

  @override
  void initState() {
    super.initState();
    _cargarDatosUsuario();
  }

  Future<void> _cargarDatosUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    final numeroCuenta = prefs.getString('numeroCuenta');

    if (numeroCuenta != null) {
      try {
        final response = await http.get(Uri.parse('${ApiConfig.baseUrl}/usuarios/cuenta/$numeroCuenta'));
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          setState(() {
            _initialEmail = data['email'] ?? '';
            _initialUsername = data['username'] ?? '';
            _emailController.text = _initialEmail!;
            _usernameController.text = _initialUsername!;
          });
        } else {
          print('Error al cargar datos del usuario: ${response.statusCode}');
        }
      } catch (e) {
        print('Error de conexión: $e');
      }
    } else {
      print('No se encontró el número de cuenta en SharedPreferences');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Editar perfil', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF1A237E),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Correo electrónico',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.email, color: Colors.blueAccent),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingresa tu correo electrónico';
                      }
                      if (!value.contains('@')) {
                        return 'Por favor, ingresa un correo electrónico válido';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Nombre de usuario',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.person, color: Colors.blueAccent),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingresa tu nombre de usuario';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingresa tu contraseña';
                      }
                      if (value.length < 6) {
                        return 'La contraseña debe tener al menos 6 caracteres';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirmar contraseña',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, confirma tu contraseña';
                      }
                      if (value != _passwordController.text) {
                        return 'Las contraseñas no coinciden';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final prefs = await SharedPreferences.getInstance();
                        final numeroCuenta = prefs.getString('numeroCuenta');

                        if (numeroCuenta == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error: No se encontró el número de cuenta del usuario')),
                          );
                          return;
                        }

                        final url = Uri.parse('${ApiConfig.baseUrl}/usuarios/editar');
                        final headers = {'Content-Type': 'application/json'};
                        final body = json.encode({
                          'numeroCuenta': numeroCuenta,
                          'email': _emailController.text,
                          'username': _usernameController.text,
                          'password': _passwordController.text,
                        });

                        try {
                          final response = await http.put(url, headers: headers, body: body);

                          if (response.statusCode == 200) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Perfil actualizado con éxito. Por favor, reinicia sesión.')),
                            );

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginView()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error al actualizar el perfil: ${response.body}')),
                            );
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error de conexión: $e')),
                          );
                        }
                      }
                    },
                    child: Text('Guardar cambios', style: TextStyle(fontSize: 18, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}