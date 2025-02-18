class Tarjeta {
  Long? id;
  String numero;
  String mesExpiracion;
  String anioExpiracion;
  String cvv;
  bool estado;
  int usuarioId;

  Tarjeta({
    this.id,
    required this.numero,
    required this.mesExpiracion,
    required this.anioExpiracion,
    required this.cvv,
    required this.estado,
    required this.usuarioId,
  });

  factory Tarjeta.fromJson(Map<String, dynamic> json) {
    return Tarjeta(
      id: json['id'] != null ? Long.from(json['id']) : null,
      numero: json['numero'],
      mesExpiracion: json['mesExpiracion'],
      anioExpiracion: json['anioExpiracion'],
      cvv: json['cvv'],
      estado: json['estado'],
      usuarioId: json['usuario']['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'numero': numero,
      'mesExpiracion': mesExpiracion,
      'anioExpiracion': anioExpiracion,
      'cvv': cvv,
      'estado': estado,
      'usuario': {'id': usuarioId}
    };
  }
}

class Long {
  final int value;

  Long(this.value);

  factory Long.from(dynamic data) {
    if (data is int) {
      return Long(data);
    } else if (data is String) {
      try {
        return Long(int.parse(data));
      } catch (e) {
        throw FormatException("Cannot parse '$data' to an integer: $e");
      }
    } else {
      throw ArgumentError("Expected an int or String, but got ${data.runtimeType}");
    }
  }

  @override
  String toString() {
    return value.toString();
  }
}