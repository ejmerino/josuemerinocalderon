import 'package:flutter/material.dart';
import '../controller/cuenta_controller.dart';
import '../controller/tarjeta_controller.dart';
import '../model/cuenta.dart';
import '../model/tarjeta.dart';

class CuentaView extends StatefulWidget {
  final String numeroCuenta;
  final double saldo;

  CuentaView({required this.numeroCuenta, required this.saldo});

  @override
  _CuentaViewState createState() => _CuentaViewState();
}

class _CuentaViewState extends State<CuentaView> {
  late CuentaController _cuentaController;
  late TarjetaController _tarjetaController;
  late Cuenta _cuenta;
  late List<Tarjeta> _tarjetas;

  @override
  void initState() {
    super.initState();
    _cuentaController = CuentaController();
    _tarjetaController = TarjetaController();
    _tarjetas = [];
    _loadCuenta();
    _loadTarjetas();
  }

  void _loadCuenta() async {
    try {
      final cuenta = await _cuentaController.obtenerCuenta(widget.numeroCuenta);
      setState(() {
        _cuenta = cuenta;
      });
    } catch (e) {
      // Manejar error si no se puede cargar la cuenta
    }
  }

  void _loadTarjetas() async {
    try {
      final tarjetas = await _tarjetaController.obtenerTarjetas(1);  // Cambiar con el ID del usuario
      setState(() {
        _tarjetas = tarjetas;
      });
    } catch (e) {
      // Manejar error si no se pueden cargar las tarjetas
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cuenta de ${widget.numeroCuenta}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Saldo: \$${widget.saldo.toStringAsFixed(2)}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/transferir');
              },
              child: Text('Realizar Transferencia'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/crearTarjeta');
              },
              child: Text('Crear Tarjeta'),
            ),
            SizedBox(height: 20),
            Text('Tarjetas vinculadas:'),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _tarjetas.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text('Tarjeta ${_tarjetas[index].numero}'),
                  subtitle: Text(_tarjetas[index].tipo),
                  trailing: Icon(
                    _tarjetas[index].congelada ? Icons.lock : Icons.lock_open,
                    color: _tarjetas[index].congelada ? Colors.red : Colors.green,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
