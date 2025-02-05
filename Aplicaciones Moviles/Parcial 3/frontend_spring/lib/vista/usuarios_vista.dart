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
        title: Text('Gestión de Usuarios', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 10,
        shadowColor: Colors.black54,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: _refrescarLista,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FutureBuilder<List<Usuario>>(
          future: _usuariosFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(color: Colors.deepPurpleAccent));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.black)));
            } else if (snapshot.hasData) {
              final usuarios = snapshot.data!;
              return ListView.builder(
                itemCount: usuarios.length,
                itemBuilder: (context, index) {
                  final usuario = usuarios[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.white.withOpacity(0.9),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(20),
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey.shade400,
                          child: Text(usuario.nombre[0].toUpperCase(),
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                        ),
                        title: Text(usuario.nombre, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                        subtitle: Text(usuario.email, style: TextStyle(color: Colors.grey.shade700)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blueAccent),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ModificarUsuario(
                                      usuario: usuario, refrescarLista: _refrescarLista),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.redAccent),
                              onPressed: () => EliminarUsuario.mostrarDialogo(
                                context: context,
                                usuario: usuario,
                                refrescarLista: _refrescarLista,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: Text('No hay usuarios disponibles', style: TextStyle(color: Colors.black)));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AgregarUsuario(refrescarLista: _refrescarLista),
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        child: Icon(Icons.add, size: 30, color: Colors.white),
        elevation: 6,
      ),
    );
  }
}
