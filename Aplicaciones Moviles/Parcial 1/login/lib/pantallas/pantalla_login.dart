import 'package:flutter/material.dart';
import 'package:login/pantallas/pantalla_bienvenida.dart';
import '../logica/logica_login.dart';

class PantallaLogin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => PantallaLoginState();

  //PantallaLogin({super.key})
}

class PantallaLoginState extends State<PantallaLogin> {

  //Declarar Objetos Visuales
  final TextEditingController controladorUsuario = TextEditingController();
  final TextEditingController controladorContrasena = TextEditingController();
  //Instanciar la clase
  final LogicaLogin logicaLogin = LogicaLogin();
  //mensaje
  String mensajeError = '';

  void iniciarSesion(){
    final usuario =controladorUsuario.text;
    final contrasena =controladorContrasena.text;
    if(logicaLogin.verificarCredenciales(usuario, contrasena)){
      //Navigate push
      Navigator.push(context,
        MaterialPageRoute(
            builder: (context)=> PantallaBienvenida(usuario:usuario)
        ),
      );
    } else {
      setState(() {
        mensajeError='Usuario o contraseña incorrecta';
      });
    }
  }

  //**Diseño**

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2C5364), Color(0xFF2C5364), Color(0xFF2C5417)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size:50.0,color: Colors.grey),
                  ),
                  SizedBox(height: 20,),
                  //campo de usuario
                  TextField(
                    controller: controladorUsuario,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.white),
                      hintText: 'Usuario',
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )
                    ),
                    style: TextStyle(color:Colors.green),
                  ),
                  SizedBox(height: 20), // Espaciado entre usuario y contraseña
                  // Campo de contraseña
                  TextField(
                    controller: controladorContrasena,
                    obscureText: true, // Para ocultar la contraseña
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                      hintText: 'Contraseña',
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.green),
                  ),
                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: iniciarSesion,
                    child: Text('Iniciar sesión'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  // Mostrar mensaje de error si es necesario
                  if (mensajeError.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        mensajeError,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ),
                ],
              ),
          ),
        ),
      ),
    );
  }
  
}