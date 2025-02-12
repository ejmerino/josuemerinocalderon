import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../controller/transferencia_controller.dart';
import '../config/ApiConfig.dart';

class TransferirView extends StatefulWidget {
  @override
  _TransferirViewState createState() => _TransferirViewState();
}

class _TransferirViewState extends State<TransferirView> {
  final TextEditingController _numeroCuentaController = TextEditingController();
  final TextEditingController _montoController = TextEditingController();
  final TransferenciaController _transferenciaController = TransferenciaController();

  String? _nombreTitular;
  bool _cuentaExiste = false;
  bool _verificando = false;

  Future<void> _verificarCuenta() async {
    setState(() {
      _verificando = true;
    });
    final numeroCuenta = _numeroCuentaController.text.trim();
    if (numeroCuenta.isEmpty) return;

    final response = await http.get(
      Uri.parse('${ApiConfig.baseUrl}/usuarios/cuenta/$numeroCuenta'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _cuentaExiste = true;
        _nombreTitular = "La cuenta pertenece a: ${data['nombre']} ${data['apellido']}";
      });
    } else {
      setState(() {
        _cuentaExiste = false;
        _nombreTitular = 'Cuenta no encontrada';
      });
    }

    setState(() {
      _verificando = false;
    });
  }

  void _realizarTransferencia() async {
    if (!_cuentaExiste) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verifica la cuenta antes de transferir')),
      );
      return;
    }

    try {
      await _transferenciaController.realizarTransferencia(
        _numeroCuentaController.text,
        double.parse(_montoController.text),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Transferencia realizada con éxito')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error en la transferencia: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Realizar Transferencia')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _numeroCuentaController,
                            decoration: InputDecoration(labelText: 'Número de Cuenta Destino'),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: _verificando ? null : _verificarCuenta,
                          child: _verificando
                              ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                              : Text('Verificar'),
                        ),
                      ],
                    ),
                    if (_nombreTitular != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          _nombreTitular!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: _cuentaExiste ? Colors.green : Colors.red,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _montoController,
              decoration: InputDecoration(labelText: 'Monto'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _realizarTransferencia,
              child: Text('Realizar Transferencia'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Color(0xFF1A237E),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                textStyle: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
