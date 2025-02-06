import 'package:flutter/material.dart';
import '../controller/auth_controller.dart';
import '../model/usuario.dart';

class RegistroView extends StatefulWidget {
  @override
  _RegistroViewState createState() => _RegistroViewState();
}

class _RegistroViewState extends State<RegistroView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthController _authController = AuthController();

  void _registrarUsuario() async {
    final usuario = Usuario(
      id: 0,  // Será asignado por el backend
      username: _usernameController.text,
      password: _passwordController.text,
      numeroCuenta: '',
      saldoDisponible: 0.0,
    );

    try {
      final newUser = await _authController.registrarUsuario(usuario);
      // Redirigir a la pantalla de login
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Error'),
          content: Text('Error al registrar usuario'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text('Cerrar'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Banca Móvil - Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            ElevatedButton(
              onPressed: _registrarUsuario,
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
