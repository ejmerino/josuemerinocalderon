import 'package:flutter/material.dart';
import '../modelo/usuario_modelo.dart';
import '../controlador/usuario_controlador.dart';

class AgregarUsuario extends StatelessWidget {
  final VoidCallback refrescarLista;
  final UsuarioControlador _controlador = UsuarioControlador();

  AgregarUsuario({required this.refrescarLista});

  @override
  Widget build(BuildContext context) {
    final nombreController = TextEditingController();
    final emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Usuario'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final nuevoUsuario = Usuario(
                  id: 0,
                  nombre: nombreController.text,
                  email: emailController.text,
                );
                await _controlador.agregarUsuario(nuevoUsuario);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Usuario agregado con éxito')),
                );
                refrescarLista();
                Navigator.pop(context);
              },
              child: Text('Agregar'),
            ),
          ],
        ),
      ),
    );
  }
}
