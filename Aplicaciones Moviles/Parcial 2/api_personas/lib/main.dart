import 'package:flutter/material.dart';
import 'view/vista_persona.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API REST Contactos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VistaPersona(),
    );
  }
}
