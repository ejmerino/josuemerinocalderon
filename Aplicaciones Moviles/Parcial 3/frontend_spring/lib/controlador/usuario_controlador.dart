import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modelo/usuario_modelo.dart';

class UsuarioControlador{
  final String apiUrl = 'http://localhost:8080/api/usuarios';

  //Obtener todos
Future<List<Usuario>> obtenerUsuarios() async{
  final respuesta = await http.get(Uri.parse(apiUrl));
  //codigo de estado
  if(respuesta.statusCode ==200){
    List<dynamic> datos = json.decode(respuesta.body);
    return datos.map((json) => Usuario.fromJson(json)).toList();
  } else{
    throw Exception('Error al obtener los usuarios');
  }

}
  //buscar por ID
  //agregar usuario
  Future<Usuario> agregarUsuario(Usuario usuario) async {
  final respuesta = await http.post(Uri.parse(apiUrl),
    headers :{'Content-Type':'aplication/json'},
    body: jsonEncode(usuario.toJson)
  );

    //codigo de estado
    if(respuesta.statusCode ==200){
      return Usuario.fromJson(json.decode(respuesta.body));
    } else{
      throw Exception('Error al agregar un usuario');
    }

  }

  //editar usuario
}