import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../modelo/producto_modelo.dart';

class ProductoControlador{

  final List<Producto> _productos = [];

  //metodo para agregar un producto
void agregarProducto(Producto producto){
  _productos.add(producto);
  guardarProductosEnAlmacenamiento();
}
//listar / ver todos los elementos

  List<Producto> obtenerProductos(){
  return _productos;
  }
//metodo para eliminar
  void eliminarProducto(Producto producto){
    _productos.remove(producto);
    guardarProductosEnAlmacenamiento();
  }

//metodo para guardar
Future<void> guardarProductosEnAlmacenamiento() async {
  final prefs = await SharedPreferences.getInstance();
  final productosJson = jsonEncode(_productos.map((producto) =>{
    'rutaImage':producto.rutaImagen,
    'nombre':producto.nombre,
    'detalle':producto.detalle
  })
  .toList());
  await prefs.setString('productos',productosJson);
}

//metodo para cargar desde el almacenamiento local

  Future<void> cargarProductosEnAlmacenamiento() async {
    final prefs = await SharedPreferences.getInstance();
    final productosJson = prefs.getString('productos');

      if(productosJson != null){
        final List<dynamic> productosMap=jsonDecode(productosJson);
        _productos.clear();
        _productos.addAll(productosMap.map((producto) => Producto(
          rutaImagen: producto['rutaImagen'],
          nombre: producto['nombre'],
          detalle: producto['detalle'],
        )));
      }
  }

}