import 'package:flutter/material.dart';
import '../modelo/usuario_modelo.dart';
import '../controlador/usuario_controlador.dart';

class AgregarUsuario extends StatelessWidget{
  
  final UsuarioControlador controlador = UsuarioControlador();
  final VoidCallback refrescarLista;

  //constructor
  AgregarUsuario({required this.refrescarLista});

  @override
  Widget build(BuildContext context) {
    final nombreControlador = TextEditingController();
    final emailControlador = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Usuario'),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(),
              TextField(),

              ElevatedButton(
                  onPressed: () async{
                    final nuevoUsuario = Usuario(
                        id: 0,
                        nombre: nombreControlador.text,
                        email: emailControlador.text,
                    );
                    //Llamar funcion
                    await controlador.agregarUsuario(nuevoUsuario);
                    //Mostrar el mensaje
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Usuario Agregado de forma correcta'))
                    );

                    //Actualizar Lista
                    refrescarLista();
                    Navigator.pop(context);
                  }
              )
            ],
        ),
      ),
    );
  }
  
}