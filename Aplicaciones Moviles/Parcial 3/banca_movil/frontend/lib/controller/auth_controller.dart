import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/usuario.dart';

class AuthController {
  static const String apiurl = 'http://192.168.100.124:8080/usuarios/registrar';  // URL de tu backend

  Future<Usuario> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://192.168.100.124:8080/auth/login'), // Agregar ruta para login
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      return Usuario.fromJson(json.decode(response.body));
    } else {
      throw Exception('Usuario o contraseña incorrectos');
    }
  }

  Future<Usuario> registrarUsuario(Usuario usuario) async {
    final response = await http.post(
      Uri.parse(apiurl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(usuario.toJson()),
    );

    if (response.statusCode == 200) {
      return Usuario.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al registrar usuario');
    }
  }
}
