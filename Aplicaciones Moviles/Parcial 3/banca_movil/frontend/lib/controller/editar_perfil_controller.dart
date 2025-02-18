import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../config/ApiConfig.dart';

class EditarPerfilController {
  Future<void> editarPerfil(String email, String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final numeroCuenta = prefs.getString('numeroCuenta'); // Obtener el número de cuenta

    if (numeroCuenta == null) {
      throw Exception('No se encontró el número de cuenta del usuario');
    }

    final url = Uri.parse('${ApiConfig.baseUrl}/usuarios/editar'); // Ajusta la URL
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'numeroCuenta': numeroCuenta, // Enviar el número de cuenta
      'email': email,
      'username': username,
      'password': password,
    });

    final response = await http.put(url, headers: headers, body: body);

    if (response.statusCode != 200) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Error al editar el perfil: ${response.body}');
    }
  }
}