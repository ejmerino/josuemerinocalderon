// services/persona_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/modelo_persona.dart';

class PersonaService {
  final String baseUrl = "http://10.40.24.49:5000/api/personas"; // Usa tu IP

  // Obtener todas las personas
  Future<List<Persona>> obtenerPersonas() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((personaJson) => Persona.fromJson(personaJson)).toList();
      } else {
        throw Exception("Error al cargar personas");
      }
    } catch (e) {
      throw Exception("Error al obtener personas: $e");
    }
  }

  // Crear una persona
  Future<void> crearPersona(Persona persona) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(persona.toJson()),
      );
      if (response.statusCode != 201) {
        throw Exception("Error al crear persona");
      }
    } catch (e) {
      throw Exception("Error al crear persona: $e");
    }
  }

  // Actualizar una persona
  Future<void> actualizarPersona(String id, Persona persona) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(persona.toJson()),
      );
      if (response.statusCode != 200) {
        throw Exception("Error al actualizar persona");
      }
    } catch (e) {
      throw Exception("Error al actualizar persona: $e");
    }
  }

  // Eliminar una persona
  Future<void> eliminarPersona(String id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/$id'));
      if (response.statusCode != 200) {
        throw Exception("Error al eliminar persona");
      }
    } catch (e) {
      throw Exception("Error al eliminar persona: $e");
    }
  }
}
