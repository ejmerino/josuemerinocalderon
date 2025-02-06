import 'package:flutter/material.dart';
import '../controller/transferencia_controller.dart';

class TransferirView extends StatefulWidget {
  @override
  _TransferirViewState createState() => _TransferirViewState();
}

class _TransferirViewState extends State<TransferirView> {
  final TextEditingController _numeroCuentaController = TextEditingController();
  final TextEditingController _montoController = TextEditingController();

  final TransferenciaController _transferenciaController = TransferenciaController();

  void _realizarTransferencia() async {
    try {
      final response = await _transferenciaController.realizarTransferencia(
        _numeroCuentaController.text,
        double.parse(_montoController.text),
      );
      // Mostrar mensaje de éxito o redirigir
    } catch (e) {
      // Manejar error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Realizar Transferencia')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _numeroCuentaController,
              decoration: InputDecoration(labelText: 'Número de Cuenta Destino'),
            ),
            TextField(
              controller: _montoController,
              decoration: InputDecoration(labelText: 'Monto'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: _realizarTransferencia,
              child: Text('Realizar Transferencia'),
            ),
          ],
        ),
      ),
    );
  }
}
