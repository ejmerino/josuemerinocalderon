import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple, Colors.purpleAccent],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Modificar Usuario',
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: nombreController,
                        decoration: InputDecoration(
                          labelText: 'Nombre',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(Icons.person, color: Colors.deepPurple),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(Icons.email, color: Colors.deepPurple),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 25),
                      ElevatedButton(
                        onPressed: () async {
                          final usuarioActualizado = Usuario(
                            id: usuario.id,
                            nombre: nombreController.text,
                            email: emailController.text,
                          );
                          await _controlador.editarUsuario(usuario.id, usuarioActualizado);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Usuario editado con éxito', style: TextStyle(color: Colors.white)),
                              backgroundColor: Colors.blue,
                            ),
                          );
                          refrescarLista();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                        ),
                        child: Text(
                          'Guardar',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
