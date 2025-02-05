import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
        title: Text(
          'Agregar Usuario',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 10,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Nuevo Usuario',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ).animate().fade(duration: 500.ms).slideY(begin: -0.3, curve: Curves.easeOut),
                SizedBox(height: 20),

                Hero(
                  tag: 'usuario-nuevo',
                  child: Material(
                    type: MaterialType.transparency,
                    child: TextField(
                      controller: nombreController,
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(Icons.person, color: Colors.deepPurple),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.email, color: Colors.deepPurple),
                  ),
                  keyboardType: TextInputType.emailAddress,
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
                      SnackBar(
                        content: Text('Usuario agregado con éxito', style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.green,
                      ),
                    );
                    refrescarLista();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Agregar', style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ],
            ),
          ),
        ).animate().fade(duration: 400.ms).slideY(begin: 0.2, curve: Curves.easeOut),
      ),
    );
  }
}
