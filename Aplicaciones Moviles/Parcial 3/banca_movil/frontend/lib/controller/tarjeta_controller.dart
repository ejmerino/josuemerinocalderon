import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/tarjeta.dart';

class TarjetaController {
  static const String _url = 'http://localhost:8080/tarjetas/';

  Future<List<Tarjeta>> obtenerTarjetas(int usuarioId) async {
    final response = await http.get(Uri.parse('$_url/usuario/$usuarioId'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((e) => Tarjeta.fromJson(e)).toList();
    } else {
      throw Exception('Error al obtener tarjetas');
    }
  }

  // Modifica este método para que no espere un objeto Tarjeta completo
  // Sino solo los datos necesarios para crear la tarjeta (usuarioId, tipo)
  Future<Tarjeta> agregarTarjeta(int usuarioId, String tipo) async {
    final response = await http.post(
      Uri.parse('$_url/agregar'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'usuarioId': usuarioId,
        'tipo': tipo,
      }),
    );

    if (response.statusCode == 200) {
      return Tarjeta.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al agregar tarjeta');
    }
  }
}