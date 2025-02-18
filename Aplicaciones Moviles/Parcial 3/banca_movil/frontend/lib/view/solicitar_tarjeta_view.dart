// solicitar_tarjeta_view.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../config/ApiConfig.dart';

class SolicitarTarjetaView extends StatefulWidget {
  final Function onTarjetaSolicitada;

  SolicitarTarjetaView({required this.onTarjetaSolicitada});

  @override
  _SolicitarTarjetaViewState createState() => _SolicitarTarjetaViewState();
}

class _SolicitarTarjetaViewState extends State<SolicitarTarjetaView> {
  String _tipoTarjeta = 'debito';

  Future<void> _mostrarDialogo(String mensaje, bool exito) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(exito ? 'Éxito' : 'Error'),
          content: Text(mensaje),
          actions: <Widget>[
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
                if (exito) {
                  Navigator.pop(context); // Regresa a la vista anterior solo si fue exitoso
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _solicitarTarjeta() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int usuarioId = prefs.getInt('usuarioId') ?? 0;

    if (usuarioId == 0) {
      _mostrarDialogo('Error: usuarioId no encontrado', false);
      return;
    }

    final String url = '${ApiConfig.baseUrl}/tarjetas/agregar';

    final Map<String, dynamic> payload = {
      'usuarioId': usuarioId,
      'tipo': _tipoTarjeta,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(payload),
      );

      if (response.statusCode == 200) {
        print('Tarjeta solicitada con éxito');
        _mostrarDialogo('¡Tarjeta solicitada con éxito!', true);
        widget.onTarjetaSolicitada();

      } else {
        print('Error al solicitar la tarjeta: ${response.statusCode}');
        print('Response body: ${response.body}');
        _mostrarDialogo('Error al solicitar la tarjeta: ${response.body}', false);
      }
    } catch (e) {
      print('Error de conexión: $e');
      _mostrarDialogo('Error de conexión: $e', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solicitar Tarjeta', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF1A237E),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Selecciona el tipo de tarjeta:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Radio<String>(
                      value: 'debito',
                      groupValue: _tipoTarjeta,
                      onChanged: (value) {
                        setState(() {
                          _tipoTarjeta = value!;
                        });
                      },
                    ),
                    Text('Débito'),
                  ],
                ),
                SizedBox(width: 40),
                Column(
                  children: [
                    Radio<String>(
                      value: 'credito',
                      groupValue: _tipoTarjeta,
                      onChanged: (value) {
                        setState(() {
                          _tipoTarjeta = value!;
                        });
                      },
                    ),
                    Text('Crédito'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _solicitarTarjeta,
              child: Text('Solicitar Tarjeta', style: TextStyle(color: Colors.white, fontSize: 16)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1A237E),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}