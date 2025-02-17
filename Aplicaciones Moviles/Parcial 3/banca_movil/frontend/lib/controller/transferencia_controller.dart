import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/ApiConfig.dart'; // Importar ApiConfig

class TransferenciaController {
  final String apiUrl = '${ApiConfig.baseUrl}/transferencias/realizar'; // Usar URL centralizada

  Future<void> realizarTransferencia(int emisorId, String numeroCuentaDestino, double monto, String motivo) async {
    final url = Uri.parse('$apiUrl?emisorId=$emisorId&numeroCuentaDestino=$numeroCuentaDestino&monto=$monto&motivo=$motivo');

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      print('Transferencia realizada con éxito');
    } else {
      throw Exception('Error en la transferencia: ${response.body}');
    }
  }
}
