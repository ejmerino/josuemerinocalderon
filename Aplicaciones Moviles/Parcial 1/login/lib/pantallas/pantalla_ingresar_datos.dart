import 'package:flutter/material.dart';
import '../logica/calcular_edad.dart';


class IngresarDatosPage extends StatelessWidget{
  //declarar los objetos visuales
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _anioController = TextEditingController();
  final TextEditingController _mesController = TextEditingController();
  final TextEditingController _diaController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Ingresar Datos'),
      backgroundColor: Colors.blue,
    ),
     body: Padding(
         padding: EdgeInsets.all(20.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           TextFormField(
             controller: _nombreController,
             decoration: InputDecoration(
               labelText: 'Nombre',
               icon: Icon(Icons.person),
             ),
           ),
           SizedBox(height: 20,),
           Row(
             children: [
               Expanded(
                   child: TextFormField(
                     controller: _anioController,
                     keyboardType: TextInputType.number,
                     decoration: InputDecoration(
                       labelText: 'Año de Nacimiento',
                       icon: Icon(Icons.calendar_today)
                     ),
                   )
               ),
               SizedBox(height: 20,),
               Expanded(
                   child: TextFormField(
                     controller: _mesController,
                     keyboardType: TextInputType.number,
                     decoration: InputDecoration(
                         labelText: 'Mes de Nacimiento',
                         icon: Icon(Icons.calendar_today)
                     ),
                   )
               ),
               SizedBox(height: 20,),
               Expanded(
                   child: TextFormField(
                     controller: _diaController,
                     keyboardType: TextInputType.number,
                     decoration: InputDecoration(
                         labelText: 'Dia de Nacimiento',
                         icon: Icon(Icons.calendar_today)
                     ),
                   )
               ),
             ],
           ),
           SizedBox(height: 20.0,),
           ElevatedButton(onPressed: (){
             String nombre = _nombreController.text.trim();
             int anio = int.tryParse(_anioController.text.trim()) ?? 0;
             int mes = int.tryParse(_mesController.text.trim()) ?? 0;
             int dia = int.tryParse(_diaController.text.trim()) ?? 0;

             Navigator.push(
                 context,
                 MaterialPageRoute(
                 builder: (context)=> CalcularEdadPage(
                   nombre:nombre,
                   anioNacimimento:anio,
                   mesNacimiento:mes,
                   diaNacimiento:dia,
                 )
                 )
             );
           },
             style: ElevatedButton.styleFrom(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10)
               )
             ),
             child: Text('Guardar Datos'),
           )

         ],
       ),
     ),
    );
}
}
