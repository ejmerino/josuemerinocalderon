import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/verdura_model.dart';

class VerdurasController {
  final String baseUrl = "http://10.0.2.2:3000/verduras";  // Cambia esta URL a la de tu servidor

  // Obtener todas las verduras
  Future<List<Verdura>> fetchVerduras() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Verdura.fromJson(json)).toList();
    } else {
      throw Exception("Error al cargar las verduras");
    }
  }

  // Agregar una nueva verdura
  Future<void> addVerdura(Verdura nuevaVerdura) async {
    final response = await http.put(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(nuevaVerdura.toJson()),
    );

    if (response.statusCode == 200) {
      print("Verdura añadida con éxito");
    } else {
      throw Exception("Error al añadir la verdura");
    }
  }

  // Actualizar una verdura
  Future<void> updateVerdura(int codigo, Verdura updatedVerdura) async {
    final response = await http.put(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(updatedVerdura.toJson()),
    );

    if (response.statusCode == 200) {
      print("Verdura actualizada con éxito");
    } else {
      throw Exception("Error al actualizar la verdura");
    }
  }

  // Eliminar una verdura
  Future<void> deleteVerdura(int codigo) async {
    final response = await http.delete(
      Uri.parse("$baseUrl/$codigo"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      print("Verdura eliminada con éxito");
    } else {
      throw Exception("Error al eliminar la verdura");
    }
  }
}
