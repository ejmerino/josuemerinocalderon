import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Paginas/Randomico.dart';

void main(){

  runApp(const MyApp());


}

class MyApp extends StatelessWidget{
  const MyApp();
  //const

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Generar números randómicos",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ), //ThemeData
      home: NumerosRandomicos(),
    ); //MaterialApp
  }
}