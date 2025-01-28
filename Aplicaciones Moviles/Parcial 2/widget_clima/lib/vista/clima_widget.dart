import 'package:flutter/material.dart';
class ClimaWidget extends StatelessWidget{

  final String ciudad;
  final double temperatura;
  final String descripcion;


  ClimaWidget({ required this.ciudad,
                required this.temperatura,
                required this.descripcion});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        width: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.lightBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft
          )
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(ciudad,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white
            ),
            ),
            SizedBox(height: 20,),
            Icon(Icons.sunny,
            size: 50,
            color: Colors.yellow,),

            SizedBox(height: 20,),

            Text(
              '${temperatura.toStringAsFixed(1)} °C',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.white
                  ),
            ),
            SizedBox(height: 20,),

            Text(descripcion,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}