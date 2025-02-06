class Cuenta {
  final String numeroCuenta;
  final double saldo;

  Cuenta({
    required this.numeroCuenta,
    required this.saldo,
  });

  factory Cuenta.fromJson(Map<String, dynamic> json) {
    return Cuenta(
      numeroCuenta: json['numeroCuenta'],
      saldo: json['saldo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'numeroCuenta': numeroCuenta,
      'saldo': saldo,
    };
  }
}
