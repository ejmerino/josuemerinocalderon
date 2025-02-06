import 'package:flutter/material.dart';
import './view/login_view.dart';
import './view/registro_view.dart';
import './view/cuenta_view.dart';
import './view/transferir_view.dart';
import './view/tarjeta_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banca Móvil',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginView(), // Pantalla de login
    );
  }
}