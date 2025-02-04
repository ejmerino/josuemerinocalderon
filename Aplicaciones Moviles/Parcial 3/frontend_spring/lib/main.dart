import 'package:flutter/material.dart';
import 'vista/usuarios_vista.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD Usuarios',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: UsuariosVista(), // Vista principal
    );
  }
}
