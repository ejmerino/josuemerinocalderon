import 'package:flutter/material.dart';
import '../controllers/gyroscope_controller.dart';
import '../controllers/websocket_controller.dart';

class ControlView extends StatefulWidget {
  @override
  _ControlViewState createState() => _ControlViewState();
}

class _ControlViewState extends State<ControlView> {
  final GyroscopeController _gyroController = GyroscopeController();
  final WebSocketController _webSocketController = WebSocketController();
  String _command = "Esperando comando...";

  @override
  void initState() {
    super.initState();
    // Conectar con el servidor WebSocket (ajusta la URL a la dirección de tu servidor)
    _webSocketController.connect("ws://<ip_del_computador>:<puerto>");

    // Escuchar mensajes del WebSocket
    _webSocketController.messages.listen((message) {
      setState(() {
        _command = message;
      });
    });

    // Escuchar el giroscopio
    _gyroController.getGyroscopeData().listen((data) {
      // Aquí es donde asociamos los movimientos del giroscopio con comandos específicos
      if (data.x > 1) {
        _webSocketController.sendMessage("Abrir página web");
      } else if (data.y > 1) {
        _webSocketController.sendMessage("Reproducir música");
      }
      // Agregar más condiciones según sea necesario para otros comandos
    });
  }

  @override
  void dispose() {
    super.dispose();
    _webSocketController.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Control del Computador")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Comando enviado: $_command"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _webSocketController.sendMessage("Abrir página web");
              },
              child: Text("Enviar comando: Abrir Página Web"),
            ),
          ],
        ),
      ),
    );
  }
}
