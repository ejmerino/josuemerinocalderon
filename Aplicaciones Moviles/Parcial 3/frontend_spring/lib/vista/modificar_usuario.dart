import 'package:flutter/material.dart';
import '../modelo/usuario_modelo.dart';
import '../controlador/usuario_controlador.dart';

class ModificarUsuario extends StatelessWidget {
  final Usuario usuario;
  final VoidCallback refrescarLista;
  final UsuarioControlador _controlador = UsuarioControlador();

  ModificarUsuario({required this.usuario, required this.refrescarLista});

  @override
  Widget build(BuildContext context) {
    final nombreController = TextEditingController(text: usuario.nombre);
    final emailController = TextEditingController(text: usuario.email);

    return Scaffold(
      appBar: AppBar(
        title: Text('Modificar Usuario'),
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
                final usuarioActualizado = Usuario(
                  id: usuario.id,
                  nombre: nombreController.text,
                  email: emailController.text,
                );
                await _controlador.editarUsuario(usuario.id, usuarioActualizado);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Usuario editado con éxito')),
                );
                refrescarLista();
                Navigator.pop(context);
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
