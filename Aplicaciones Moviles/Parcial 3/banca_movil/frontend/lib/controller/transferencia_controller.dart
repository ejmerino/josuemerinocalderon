import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/ApiConfig.dart';

class TransferenciaController {
  Future<void> realizarTransferencia(
      String emisorNumeroCuenta, String numeroCuentaDestino, double monto, String motivo) async {
    final url = Uri.parse('${ApiConfig.baseUrl}/transferencias/realizar');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'numeroCuentaEmisor': emisorNumeroCuenta,
      'numeroCuentaDestino': numeroCuentaDestino,
      'monto': monto,
      'motivo': motivo,
    });

    print("Cuerpo de la solicitud (TransferenciaController): $body");

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode != 201) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Error al realizar la transferencia: ${response.body}');
    }
  }
}