import 'package:flutter/material.dart';
import 'package:frontend/config/ApiConfig.dart';
import 'package:frontend/view/transferir_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'tarjeta_view.dart';
import 'login_view.dart';

class CuentaView extends StatefulWidget {
  @override
  _CuentaViewState createState() => _CuentaViewState();
}

class _CuentaViewState extends State<CuentaView> {
  String nombre = '';
  String apellido = '';
  String numeroCuenta = '';
  double saldoDisponible = 0.0;
  List<dynamic> transacciones = [];
  bool mostrandoEnviadas = true;

  @override
  void initState() {
    super.initState();
    _cargarDatosUsuario();
    obtenerHistorialTransacciones();
  }

  Future<void> _cargarDatosUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nombre = prefs.getString('nombre') ?? 'Nombre';
      apellido = prefs.getString('apellido') ?? 'Apellido';
      numeroCuenta = prefs.getString('numeroCuenta') ?? '0000';
      saldoDisponible = double.parse(prefs.getString('saldoDisponible') ?? '0.0');
      print("Datos cargados desde SharedPreferences: numeroCuenta=$numeroCuenta, nombre=$nombre, apellido=$apellido, saldoDisponible=$saldoDisponible"); // Debug
    });
  }

  Future<void> obtenerHistorialTransacciones() async {
    final String url = '${ApiConfig.baseUrl}/transferencias';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      setState(() {
        transacciones = data;
      });
    }
  }

  Future<int> obtenerUsuarioId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('id') ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> transaccionesFiltradas = transacciones.where((t) {
      return mostrandoEnviadas
          ? t['emisor']['numeroCuenta'] == numeroCuenta
          : t['beneficiario']['numeroCuenta'] == numeroCuenta;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Cuenta de $nombre $apellido", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF1A237E),
        leading: IconButton(
          icon: Icon(Icons.logout, color: Colors.white),
          onPressed: () async {
            // Limpiar datos de SharedPreferences al cerrar sesión
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.remove('nombre');
            await prefs.remove('apellido');
            await prefs.remove('numeroCuenta');
            await prefs.remove('saldoDisponible');

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginView()),
                  (route) => false,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '¡Bienvenido/a, $nombre $apellido!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Color(0xFF1A237E)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Número de cuenta: $numeroCuenta',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text('Tu saldo es:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
              Text('\$$saldoDisponible',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800, color: Colors.green)),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TransferirView()));
                },
                child: Text('Realizar Transferencia', style: TextStyle(fontSize: 18, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 55),
                  backgroundColor: Color(0xFF1A237E),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  int usuarioId = await obtenerUsuarioId();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TarjetaView(usuarioId: usuarioId)));
                },
                child: Text('Tarjetas', style: TextStyle(fontSize: 18, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 55),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(height: 40),
              Text('Historial de Transacciones',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1A237E))),
              SizedBox(height: 10),
              ToggleButtons(
                borderRadius: BorderRadius.circular(12),
                selectedColor: Colors.white,
                fillColor: Color(0xFF1A237E),
                color: Colors.black87,
                constraints: BoxConstraints(minWidth: 120, minHeight: 40),
                isSelected: [mostrandoEnviadas, !mostrandoEnviadas],
                onPressed: (index) {
                  setState(() {
                    mostrandoEnviadas = index == 0;
                  });
                },
                children: [
                  Text("Realizadas", style: TextStyle(fontSize: 16)),
                  Text("Recibidas", style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 10),
              transaccionesFiltradas.isEmpty
                  ? Text('No hay transacciones recientes', style: TextStyle(fontSize: 16, color: Colors.black54))
                  : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: transaccionesFiltradas.length,
                itemBuilder: (context, index) {
                  var transaccion = transaccionesFiltradas[index];
                  bool esEnviada = transaccion['emisor']['numeroCuenta'] == numeroCuenta;

                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(12),
                      title: Text(
                        esEnviada
                            ? 'Para: ${transaccion['beneficiario']['nombre']} ${transaccion['beneficiario']['apellido']}'
                            : 'De: ${transaccion['emisor']['nombre']} ${transaccion['emisor']['apellido']}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cuenta: ${esEnviada ? transaccion['numeroCuentaDestino'] : transaccion['emisor']['numeroCuenta']}',
                          ),
                          Text('Monto: \$${transaccion['monto']}'),
                          Text('Motivo: ${transaccion['motivo'] ?? 'No especificado'}'),
                        ],
                      ),
                      trailing: Icon(
                        Icons.monetization_on,
                        color: esEnviada ? Colors.green : Colors.blue,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFF4F4F4),
    );
  }
}