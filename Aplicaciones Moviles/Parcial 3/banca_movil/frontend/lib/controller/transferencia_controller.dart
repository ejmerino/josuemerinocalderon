import 'dart:convert';
import 'package:http/http.dart' as http;

class TransferenciaController {
  final String apiUrl = 'http://localhost:8080/transferencias/realizar'; // Cambiar con la URL del backend

  Future<void> realizarTransferencia(String numeroCuentaDestino, double monto, String motivo) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'emisorId': '1', // Esto debe ser el ID del usuario autenticado
        'numeroCuentaDestino': numeroCuentaDestino,
        'monto': monto.toString(),
        'motivo': motivo.toString(),
      },
    );

    if (response.statusCode == 200) {
      // Transferencia exitosa
      print('Transferencia realizada');
    } else {
      // Error en la transferencia
      throw Exception('Error al realizar la transferencia');
    }
  }
}
