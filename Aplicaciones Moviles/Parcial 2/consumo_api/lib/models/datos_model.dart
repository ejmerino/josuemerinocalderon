class Datos{
  final int id;
  final String nombre;
  final String correo;
  final String cuerpo;

  Datos({required this.id,
    required this.nombre,
    required this.correo,
    required this.cuerpo});


  factory Datos.fromJson(Map<String, dynamic> json){return Datos(
    id: json['id'],
    nombre: json['name'],
    correo: json['email'],
    cuerpo: json['body']);
  }
}