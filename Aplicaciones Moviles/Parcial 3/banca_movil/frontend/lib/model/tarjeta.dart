class Tarjeta {
  final String numero;
  final String tipo;
  final bool congelada;

  Tarjeta({
    required this.numero,
    required this.tipo,
    required this.congelada,
  });

  factory Tarjeta.fromJson(Map<String, dynamic> json) {
    return Tarjeta(
      numero: json['numero'],
      tipo: json['tipo'],
      congelada: json['congelada'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'numero': numero,
      'tipo': tipo,
      'congelada': congelada,
    };
  }
}
