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
  bool _isLoading = false; // Para mostrar un indicador de carga

  Future<void> _mostrarDialogo(String mensaje, bool exito) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(
            exito ? '¡Éxito!' : 'Error',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(mensaje, style: TextStyle(fontSize: 16)),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
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
    setState(() {
      _isLoading = true; // Mostrar el indicador de carga
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int usuarioId = prefs.getInt('usuarioId') ?? 0;

    if (usuarioId == 0) {
      _mostrarDialogo('Error: usuarioId no encontrado', false);
      setState(() {
        _isLoading = false; // Ocultar el indicador de carga
      });
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
    } finally {
      setState(() {
        _isLoading = false; // Ocultar el indicador de carga
      });
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
        padding: EdgeInsets.all(24), // Aumentar el padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Estirar los elementos horizontalmente
          children: [
            Text(
              '¿Qué tipo de tarjeta deseas solicitar?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500), // Tamaño de fuente más grande y peso más ligero
              textAlign: TextAlign.center, // Centrar el texto
            ),
            SizedBox(height: 32), // Espacio más grande
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    RadioListTile<String>(
                      title: Text('Tarjeta de Débito', style: TextStyle(fontSize: 17)),
                      value: 'debito',
                      groupValue: _tipoTarjeta,
                      onChanged: (value) {
                        setState(() {
                          _tipoTarjeta = value!;
                        });
                      },
                      activeColor: Color(0xFF1A237E), // Color del radio activo
                      controlAffinity: ListTileControlAffinity.platform, // Ubicación del radio
                    ),
                    RadioListTile<String>(
                      title: Text('Tarjeta de Crédito', style: TextStyle(fontSize: 17)),
                      value: 'credito',
                      groupValue: _tipoTarjeta,
                      onChanged: (value) {
                        setState(() {
                          _tipoTarjeta = value!;
                        });
                      },
                      activeColor: Color(0xFF1A237E), // Color del radio activo
                      controlAffinity: ListTileControlAffinity.platform, // Ubicación del radio
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _isLoading ? null : _solicitarTarjeta, // Deshabilitar si está cargando
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1A237E),
                padding: EdgeInsets.symmetric(vertical: 16), // Aumentar el padding vertical
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: _isLoading
                  ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
                  : Text('Solicitar Tarjeta'),
            ),
          ],
        ),
      ),
    );
  }
}