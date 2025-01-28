import 'package:flutter/foundation.dart'; // Para detectar si estamos en web
import 'package:flutter/material.dart';
import 'dart:io'; // Para manejar archivos locales (solo móviles)
import 'package:image_picker/image_picker.dart';
import '../controlador/producto_controlador.dart';
import '../modelo/producto_modelo.dart';
import 'detalle_producto_vista.dart';

class PantallaPrincipal extends StatefulWidget {
  @override
  _PantallaPrincipalState createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  final ProductoControlador _controlador = ProductoControlador();
  final ImagePicker _selectorDeImagenes = ImagePicker();

  @override
  void initState() {
    super.initState();
    _controlador.cargarProductosEnAlmacenamiento();
  }

  Future<void> agregarProducto() async {
    final archivoSeleccionado = await _selectorDeImagenes.pickImage(
      source: ImageSource.camera,
    );

    if (archivoSeleccionado != null) {
      final controladorNombre = TextEditingController();
      final controladorDetalle = TextEditingController();

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Agregar Producto"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: controladorNombre,
                  decoration: InputDecoration(labelText: "Nombre del producto"),
                ),
                TextField(
                  controller: controladorDetalle,
                  decoration: InputDecoration(labelText: "Detalle del producto"),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  final nuevoProducto = Producto(
                    rutaImagen: archivoSeleccionado.path,
                    nombre: controladorNombre.text,
                    detalle: controladorDetalle.text,
                  );

                  _controlador.agregarProducto(nuevoProducto);
                  setState(() {});
                  Navigator.of(context).pop();
                },
                child: Text("Guardar"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final productos = _controlador.obtenerProductos();

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Productos"),
        backgroundColor: Colors.deepPurple,
      ),
      body: productos.isEmpty
          ? Center(child: Text("No hay productos guardados."))
          : ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, indice) {
          final producto = productos[indice];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: kIsWeb
                  ? Image.network(
                producto.rutaImagen,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              )
                  : Image.file(
                File(producto.rutaImagen),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
              title: Text(producto.nombre),
              subtitle: Text(producto.detalle),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    _controlador.eliminarProducto(producto);
                  });
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetalleProductoVista(producto: producto),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: agregarProducto,
        child: Icon(Icons.camera_alt), // Ícono de cámara
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
