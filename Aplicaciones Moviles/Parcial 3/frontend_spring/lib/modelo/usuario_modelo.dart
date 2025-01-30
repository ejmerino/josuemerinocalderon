import 'package:flutter/foundation.dart';

class Usuario{
  final int id;
  final String nombre;
  final String email;

  //Método de fábirca
  Usuario({required this.id, required this.nombre, required this.email});
  factory Usuario.fromJson(Map<String, dynamic> json){
    return Usuario(
        id: json['id'],
        nombre:json['nombre'],
        email:json['email']
    );
  }

  //Metodo para convertir objeto a json
  //Convierte un objeto Usuario en un mapa de JSON
  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'email': email,
    };
  }


}
