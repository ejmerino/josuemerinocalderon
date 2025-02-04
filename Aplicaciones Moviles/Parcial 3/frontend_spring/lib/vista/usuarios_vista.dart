import 'package:flutter/material.dart';
import '../modelo/usuario_modelo.dart';
import '../controlador/usuario_controlador.dart';
import 'agregar_usuario.dart';
import 'modificar_usuario.dart';
import 'eliminar_usuario.dart';

class UsuariosVista extends StatefulWidget {
  @override
  _UsuariosVistaState createState() => _UsuariosVistaState();
}

class _UsuariosVistaState extends State<UsuariosVista> {
  final UsuarioControlador _controlador = UsuarioControlador();
  late Future<List<Usuario>> _usuariosFuture;

  @override
  void initState() {
    super.initState();
    _usuariosFuture = _controlador.obtenerUsuarios();
  }

  void _refrescarLista() {
    setState(() {
      _usuariosFuture = _controlador.obtenerUsuarios();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Usuarios'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refrescarLista,
          ),
        ],
      ),
      body: FutureBuilder<List<Usuario>>(
        future: _usuariosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final usuarios = snapshot.data!;
            return ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (context, index) {
                final usuario = usuarios[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    title: Text(usuario.nombre),
                    subtitle: Text(usuario.email),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ModificarUsuario(usuario: usuario, refrescarLista: _refrescarLista),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => EliminarUsuario.mostrarDialogo(
                            context: context,
                            usuario: usuario,
                            refrescarLista: _refrescarLista,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No hay usuarios disponibles'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AgregarUsuario(refrescarLista: _refrescarLista),
          ),
        ),
      ),
    );
  }
}
