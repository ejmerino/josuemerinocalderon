import 'package:flutter/material.dart';
import '../models/coche.dart';

class DetallesCoche extends StatelessWidget{
  final Coche coche;


  DetallesCoche( {required this.coche});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${coche.modelo}'),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            coche.image,
            SizedBox(height: 20,),
            Text('Marca: ${coche.marca}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

            SizedBox(height: 20,),
            Text('Modelo: ${coche.modelo}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),),
          ],
        ),
      ),
    );
  }
  
}