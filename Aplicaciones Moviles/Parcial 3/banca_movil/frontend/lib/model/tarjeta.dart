class Tarjeta {
  final int id;
  final int usuarioId;
  final String numero;
  final String mesExpiracion;
  final String anioExpiracion;
  final String cvv;
  final bool estado;
  final String marca;

  Tarjeta({
    required this.id,
    required this.usuarioId,
    required this.numero,
    required this.mesExpiracion,
    required this.anioExpiracion,
    required this.cvv,
    required this.estado,
    required this.marca,
  });

  factory Tarjeta.fromJson(Map<String, dynamic> json) {
    return Tarjeta(
      id: json['id'],
      usuarioId: json['usuario']['id'],
      numero: json['numero'],
      mesExpiracion: json['mesExpiracion'],
      anioExpiracion: json['anioExpiracion'],
      cvv: json['cvv'],
      estado: json['estado'],
      marca: json['marca'],
    );
  }

  // Método toJson para convertir el objeto Tarjeta a un Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'numero': numero,
      'mesExpiracion': mesExpiracion,
      'anioExpiracion': anioExpiracion,
      'cvv': cvv,
      'estado': estado,
      'marca': marca,
    };
  }
}