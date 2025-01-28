import 'package:flutter/material.dart';
import 'operaciones_vista.dart';

class HomeVista extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menús'),
        backgroundColor: Colors.green,
      ),
      //Diseño menu lateral
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("Josué Merino"),
                accountEmail: Text("ejmerino@espe.edu.ec"),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50, color: Colors.green),
                ),
              decoration: BoxDecoration(color: Colors.grey),
            ),

            //ListTitle
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Suma'),
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => OperacionVista(
                        titulo: 'Suma',
                        tipoOperacion: 'suma',
                    )));
              },
            ),
            ListTile(
              leading: Icon(Icons.remove),
              title: Text('Resta'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OperacionVista(
                      titulo: 'Resta',
                      tipoOperacion: 'resta',
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.clear),
              title: Text('Multiplicación'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OperacionVista(
                      titulo: 'Multiplicación',
                      tipoOperacion: 'multiplicacion',
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.horizontal_rule),
              title: Text('División'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OperacionVista(
                      titulo: 'División',
                      tipoOperacion: 'division',
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.square),
              title: Text('Raiz Cuadrada'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OperacionVista(
                      titulo: 'Raiz Cuadrada',
                      tipoOperacion: 'raiz cuadrada',
                    ),
                  ),
                );
              },
            ),

          ],
        ),
      ),
      body: Center(
        child: Text('Selecciona una opcion'),
      ),
    );
  }
}