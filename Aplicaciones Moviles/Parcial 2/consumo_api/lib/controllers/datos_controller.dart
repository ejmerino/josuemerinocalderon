import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/datos_model.dart';


class ControladorDatos{
  final String _urlBase = 'https://jsonplaceholder.typicode.com/comments';
  Future<List<Datos>> obtenerDatos() async{
    final respuesta = await http.get(Uri.parse(_urlBase));

    if(respuesta.statusCode == 200) {
      final List<dynamic> datos = json.decode(respuesta.body);
      return datos.map((json)=>Datos.fromJson(json)).toList();

    } else {
      throw Exception("Error al cargar datos");
    }

  }
}