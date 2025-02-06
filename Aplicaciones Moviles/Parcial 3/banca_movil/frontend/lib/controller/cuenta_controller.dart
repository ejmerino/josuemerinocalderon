import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/cuenta.dart';

class CuentaController {
  static const String _url = 'http://localhost:8080/cuentas/';

  Future<Cuenta> obtenerCuenta(String numeroCuenta) async {
    final response = await http.get(Uri.parse('$_url$numeroCuenta'));

    if (response.statusCode == 200) {
      return Cuenta.fromJson(json.decode(response.body));
    } else {
      throw Exception('No se pudo obtener la cuenta');
    }
  }
}
