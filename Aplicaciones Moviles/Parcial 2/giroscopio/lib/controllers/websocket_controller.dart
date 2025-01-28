import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketController {
  WebSocketChannel? _channel;

  // Conectar al WebSocket
  void connect(String url) {
    _channel = WebSocketChannel.connect(Uri.parse(url));
  }

  // Enviar mensaje
  void sendMessage(String message) {
    if (_channel != null) {
      _channel!.sink.add(message);
    }
  }

  // Escuchar mensajes del WebSocket
  Stream<String> get messages => _channel!.stream.map((message) => message.toString());

  // Cerrar la conexión
  void disconnect() {
    _channel?.sink.close();
  }
}
