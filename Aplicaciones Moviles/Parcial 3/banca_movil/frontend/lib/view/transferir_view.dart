import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../controller/transferencia_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/ApiConfig.dart';
import 'cuenta_view.dart';

class TransferirView extends StatefulWidget {
  @override
  _TransferirViewState createState() => _TransferirViewState();
}

class _TransferirViewState extends State<TransferirView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _numeroCuentaController = TextEditingController();
  final TextEditingController _montoController = TextEditingController();
  final TextEditingController _motivoController = TextEditingController();
  final TransferenciaController _transferenciaController = TransferenciaController();

  String? _nombreTitular;
  bool _cuentaExiste = false;
  bool _verificando = false;
  String? emisorNumeroCuenta;

  @override
  void initState() {
    super.initState();
    _cargarNumeroCuentaEmisor();
  }

  Future<void> _cargarNumeroCuentaEmisor() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      emisorNumeroCuenta = prefs.getString('numeroCuenta');
      print("Numero de cuenta del emisor cargado: $emisorNumeroCuenta");
    });
  }

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
    if (_formKey.currentState!.validate()) {
      if (!_cuentaExiste) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Verifica la cuenta antes de transferir')),
        );
        return;
      }

      if (emisorNumeroCuenta == null || emisorNumeroCuenta!.isEmpty) {
        print("ERROR: emisorNumeroCuenta es nulo o vacío!");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: No se pudo obtener el número de cuenta del emisor')),
        );
        return;
      }

      if (_numeroCuentaController.text == emisorNumeroCuenta) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No puedes realizar una transferencia a tu misma cuenta')),
        );
        return;
      }

      final monto = double.parse(_montoController.text);

      print("Enviando transferencia con emisorNumeroCuenta: $emisorNumeroCuenta, numeroCuentaDestino: ${_numeroCuentaController.text}, monto: $monto, motivo: ${_motivoController.text}");
      try {
        await _transferenciaController.realizarTransferencia(
          emisorNumeroCuenta!,
          _numeroCuentaController.text,
          monto,
          _motivoController.text,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Transferencia realizada con éxito')),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CuentaView()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error en la transferencia: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Realizar Transferencia', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF1A237E),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _numeroCuentaController,
                    decoration: InputDecoration(
                      labelText: 'Número de Cuenta Destino',
                      hintText: 'Ingresa el número de cuenta',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.account_balance, color: Colors.blueAccent),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingresa el número de cuenta';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  ElevatedButton.icon(
                    onPressed: _verificando ? null : _verificarCuenta,
                    icon: _verificando
                        ? CircularProgressIndicator(strokeWidth: 2, color: Colors.white)
                        : Icon(Icons.check_circle_outline, color: Colors.white),
                    label: Text(_verificando ? 'Verificando...' : 'Verificar', style: TextStyle(fontSize: 16, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1A237E),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
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
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _montoController,
                    decoration: InputDecoration(
                      labelText: 'Monto',
                      hintText: 'Ingresa el monto a transferir',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.monetization_on, color: Colors.green),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingresa el monto';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Por favor, ingresa un número válido';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _motivoController,
                    decoration: InputDecoration(
                      labelText: 'Motivo (opcional)',
                      hintText: 'Ingresa un motivo para la transferencia',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.description, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _realizarTransferencia,
                    child: Text('Realizar Transferencia', style: TextStyle(fontSize: 18, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Color(0xFF1A237E),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}