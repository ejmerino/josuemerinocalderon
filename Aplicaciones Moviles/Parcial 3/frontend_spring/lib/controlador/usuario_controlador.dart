import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modelo/usuario_modelo.dart';

class UsuarioControlador {
  final String apiUrl = 'http://192.168.100.124:9090/usuarios'; // Cambia según tu servidor

  // Obtener todos los usuarios
  Future<List<Usuario>> obtenerUsuarios() async {
    final respuesta = await http.get(Uri.parse(apiUrl));
    if (respuesta.statusCode == 200) {
      List<dynamic> datos = json.decode(respuesta.body);
      return datos.map((json) => Usuario.fromJson(json)).toList();
    } else {
      throw Exception('Error al obtener usuarios');
    }
  }

  // Buscar usuario por ID
  Future<Usuario?> buscarUsuarioPorId(int id) async {
    final respuesta = await http.get(Uri.parse('$apiUrl/$id'));
    if (respuesta.statusCode == 200) {
      return Usuario.fromJson(json.decode(respuesta.body));
    } else if (respuesta.statusCode == 404) {
      return null; // Usuario no encontrado
    } else {
      throw Exception('Error al buscar usuario');
    }
  }

  // Agregar usuario
  Future<Usuario> agregarUsuario(Usuario usuario) async {
    final respuesta = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(usuario.toJson()),
    );
    if (respuesta.statusCode == 200) {
      return Usuario.fromJson(json.decode(respuesta.body));
    } else {
      throw Exception('Error al agregar usuario');
    }
  }

  // Editar usuario
  Future<Usuario> editarUsuario(int id, Usuario usuario) async {
    final respuesta = await http.put(
      Uri.parse('$apiUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(usuario.toJson()),
    );
    if (respuesta.statusCode == 200) {
      return Usuario.fromJson(json.decode(respuesta.body));
    } else {
      throw Exception('Error al editar usuario');
    }
  }

  // Eliminar usuario
  Future<void> eliminarUsuario(int id) async {
    final respuesta = await http.delete(Uri.parse('$apiUrl/$id'));
    if (respuesta.statusCode != 204) {
      throw Exception('Error al eliminar usuario');
    }
  }
}

