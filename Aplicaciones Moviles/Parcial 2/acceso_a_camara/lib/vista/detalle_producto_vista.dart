import 'package:flutter/foundation.dart'; // Para detectar si estamos en web
import 'package:flutter/material.dart';
import '../modelo/producto_modelo.dart';
import 'dart:io';

class DetalleProductoVista extends StatelessWidget {
  final Producto producto;

  DetalleProductoVista({required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(producto.nombre),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kIsWeb
                ? Image.network(
              producto.rutaImagen,
              width: double.infinity,
              fit: BoxFit.cover,
            )
                : Image.file(
              File(producto.rutaImagen),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              producto.nombre,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              producto.detalle,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
