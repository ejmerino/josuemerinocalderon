class Verdura {
  int codigo;
  String descripcion;
  double precio;

  Verdura({required this.codigo, required this.descripcion, required this.precio});

  factory Verdura.fromJson(Map<String, dynamic> json) {
    return Verdura(
      codigo: json['codigo'],
      descripcion: json['descripcion'],
      precio: json['precio'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codigo': codigo,
      'descripcion': descripcion,
      'precio': precio,
    };
  }
}
