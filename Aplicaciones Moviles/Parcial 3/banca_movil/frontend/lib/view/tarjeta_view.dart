import 'package:flutter/material.dart';
import '../controller/tarjeta_controller.dart';
import '../model/tarjeta.dart';

class TarjetaView extends StatefulWidget {
  final int usuarioId;

  TarjetaView({required this.usuarioId});

  @override
  _TarjetaViewState createState() => _TarjetaViewState();
}

class _TarjetaViewState extends State<TarjetaView> {
  late TarjetaController _tarjetaController;
  late List<Tarjeta> _tarjetas;

  @override
  void initState() {
    super.initState();
    _tarjetaController = TarjetaController();
    _tarjetas = [];
    _loadTarjetas();
  }

  void _loadTarjetas() async {
    try {
      final tarjetas = await _tarjetaController.obtenerTarjetas(widget.usuarioId);
      setState(() {
        _tarjetas = tarjetas;
      });
    } catch (e) {
      // Manejar error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tarjetas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _tarjetas.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text('Tarjeta ${_tarjetas[index].numero}'),
              subtitle: Text(_tarjetas[index].tipo),
              trailing: Icon(
                _tarjetas[index].congelada ? Icons.lock : Icons.lock_open,
                color: _tarjetas[index].congelada ? Colors.red : Colors.green,
              ),
              onTap: () {
                // Acción al tocar la tarjeta (por ejemplo, congelarla)
              },
            );
          },
        ),
      ),
    );
  }
}
