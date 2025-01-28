import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class NumerosRandomicos extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => NumerosRandomicosState();
  
}

class NumerosRandomicosState extends State<NumerosRandomicos>{
  //codificacion
  int _numeroAleatorio = 0;
  //funcion
  void _numeroRandomico(){
    setState(() {
      _numeroAleatorio = Random().nextInt(201) ;
    });
  }
  //diseño
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Numero Generado: $_numeroAleatorio',
            style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20.0,),

            Text('Calcular Porcentaje 30%: ${(_numeroAleatorio*0.30).toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _numeroRandomico,
        tooltip: 'Generar',
        child: Icon(Icons.refresh),
    ),
    );
  }
}