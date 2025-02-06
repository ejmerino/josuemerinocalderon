class Usuario {
  final int id;
  final String username;
  final String password;
  final String numeroCuenta;
  final double saldoDisponible;

  Usuario({
    required this.id,
    required this.username,
    required this.password,
    required this.numeroCuenta,
    required this.saldoDisponible,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      numeroCuenta: json['numeroCuenta'],
      saldoDisponible: json['saldoDisponible'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'numeroCuenta': numeroCuenta,
      'saldoDisponible': saldoDisponible,
    };
  }
}
