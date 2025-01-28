import 'package:flutter/material.dart';
import '../controller/coche_controller.dart';
import 'detalles_coche.dart';

class VistaCoches extends StatefulWidget{
  @override  
    State<StatefulWidget> createState()=> VistaCochesState();
}

class VistaCochesState extends State<VistaCoches>{
  
  final CocheController _controller = CocheController();  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejemplo Gridview"),
        backgroundColor: Colors.cyan,
      ),
      
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: _controller.coches.length,
          itemBuilder: (context,index){
            final item = _controller.coches[index];

            return GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=> DetallesCoche(coche:item),
                    ),
                );
              },
              //pegar codigo
                child: Card(
            color: Colors.cyan,
            elevation: 3.0,

            child: Container(
            padding: EdgeInsets.fromLTRB(15,0,15,0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            item.image,
            Divider(color: Colors.white),
            Text('${item.modelo}',
            style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20),
            ),
            Text('${item.marca}',
            style: TextStyle(color: Colors.white),
            ),
            ],
            ),
            ),
            ),

            );


          }
      ),
    );
  }  
}