import 'package:flutter/material.dart';
import '../controllers/datos_controller.dart';
import '../models/datos_model.dart';

class VistaDatos extends StatelessWidget {

  final ControladorDatos controlador = ControladorDatos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Datos de la Api"),
      ),
      body: FutureBuilder<List<Datos>>(
        future: controlador.obtenerDatos(),
        builder: (context, snapshot) {
          // Verificamos el estado de la conexión
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(), // Indicador de carga mientras se obtienen los datos
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error al cargar los datos: ${snapshot.error}"), // Muestra error si ocurre
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text("No se encontraron datos"), // Mensaje si no hay datos
            );
          } else {
            // Cuando los datos son recibidos con éxito
            List<Datos> datos = snapshot.data!;
            return ListView.builder(
              itemCount: datos.length, // Número de elementos en la lista
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    title: Text(datos[index].nombre), // Mostrar el nombre
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Correo: ${datos[index].correo}"), // Mostrar el correo
                        Text("Cuerpo: ${datos[index].cuerpo}"), // Mostrar el cuerpo
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
