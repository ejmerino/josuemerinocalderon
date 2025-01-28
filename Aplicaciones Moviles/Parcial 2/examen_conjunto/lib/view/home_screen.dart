import 'package:flutter/material.dart';
import '../controller/verduras_controller.dart';
import '../model/verdura_model.dart';
import 'verdura_form.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final VerdurasController controller = VerdurasController();
  late Future<List<Verdura>> verduras;

  @override
  void initState() {
    super.initState();
    verduras = controller.fetchVerduras();
  }

  void _refreshList() {
    setState(() {
      verduras = controller.fetchVerduras();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Verduras', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: FutureBuilder<List<Verdura>>(
        future: verduras,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print("Error: ${snapshot.error}");
            return Center(child: Text('Error al cargar datos'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay verduras disponibles'));
          }

          final List<Verdura> listaVerduras = snapshot.data!;
          return ListView.builder(
            itemCount: listaVerduras.length,
            itemBuilder: (context, index) {
              final verdura = listaVerduras[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: Colors.lightGreen[50],
                elevation: 4,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text(verdura.codigo.toString(), style: TextStyle(color: Colors.white)),
                  ),
                  title: Text(verdura.descripcion, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  subtitle: Text('Precio: \$${verdura.precio.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => VerduraForm(
                                verdura: verdura,
                                onSave: (updatedVerdura) {
                                  setState(() {
                                    controller.updateVerdura(verdura.codigo, updatedVerdura);
                                    _refreshList();
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            controller.deleteVerdura(verdura.codigo);
                            _refreshList();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => VerduraForm(
                onSave: (nuevaVerdura) {
                  setState(() {
                    controller.addVerdura(nuevaVerdura);
                    _refreshList();
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
