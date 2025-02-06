import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/cuenta.dart';
import '../config/ApiConfig.dart'; // Aquí tomamos la IP desde ApiConfig

class CuentaController {
  final String _baseUrl = ApiConfig.baseUrl; // Usamos la IP configurada

  Future<Cuenta> obtenerCuenta(String numeroCuenta) async {
    final response = await http.get(Uri.parse('$_baseUrl/usuarios/cuenta/$numeroCuenta'));

    if (response.statusCode == 200) {
      return Cuenta.fromJson(json.decode(response.body));
    } else {
      throw Exception('No se pudo obtener la cuenta');
    }
  }
}
