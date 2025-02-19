import 'package:flutter/material.dart';
import 'package:frontend/config/ApiConfig.dart';
import 'package:frontend/view/transferir_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'tarjeta_view.dart';
import 'login_view.dart';
import 'editar_perfil_view.dart';
import 'package:url_launcher/url_launcher.dart';

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
  bool _ordenAscendente = false;

  @override
  void initState() {
    super.initState();
    _cargarDatosUsuario();
    obtenerHistorialTransacciones();
  }

  Future<void> _cargarDatosUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    final numeroCuentaLocal = prefs.getString('numeroCuenta');

    if (numeroCuentaLocal != null) {
      try {
        final response = await http.get(Uri.parse('${ApiConfig.baseUrl}/usuarios/cuenta/$numeroCuentaLocal'));

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          setState(() {
            nombre = data['nombre'] ?? '';
            apellido = data['apellido'] ?? '';
            numeroCuenta = data['numeroCuenta'] ?? '';
            saldoDisponible = data['saldoDisponible']?.toDouble() ?? 0.0;

            prefs.setString('nombre', nombre);
            prefs.setString('apellido', apellido);
            prefs.setString('saldoDisponible', saldoDisponible.toString());
            print("Datos del usuario recargados desde el backend: nombre=$nombre, numeroCuenta=$numeroCuenta, saldoDisponible=$saldoDisponible");

          });
        } else {
          print('Error al cargar datos del usuario desde el backend: ${response.statusCode}');
        }
      } catch (e) {
        print('Error de conexión al cargar datos del usuario: $e');
      }
    } else {
      print('No se encontró el número de cuenta en SharedPreferences');
    }
  }

  Future<void> obtenerHistorialTransacciones() async {
    final String url = '${ApiConfig.baseUrl}/transferencias';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      setState(() {
        transacciones = data;
        _ordenarTransacciones();
      });
    }
  }

  void _ordenarTransacciones() {
    setState(() {
      if (_ordenAscendente) {
        transacciones = List.from(transacciones.reversed);
      } else {
        transacciones = List.from(transacciones.reversed);
      }
    });
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  String _formatNumber(double number) {
    return number.toStringAsFixed(2); // Trunca a 2 decimales
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> transaccionesFiltradas = transacciones.where((t) {
      return mostrandoEnviadas
          ? t['emisor']['numeroCuenta'] == numeroCuenta
          : t['beneficiario']['numeroCuenta'] == numeroCuenta;
    }).toList();

    return Scaffold(
      backgroundColor: Color(0xFFE3F2FD),
      appBar: AppBar(
        title: Text("Cuenta de $nombre $apellido", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF1A237E),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xFF1A237E),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.account_circle, size: 48, color: Colors.white),
                        SizedBox(height: 8),
                        Text(
                          '$nombre $apellido',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          numeroCuenta,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.edit, color: Color(0xFF1A237E)),
                    title: Text('Editar perfil', style: TextStyle(color: Colors.black87)),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditarPerfilView()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.redAccent),
                    title: Text('Cerrar sesión', style: TextStyle(color: Colors.black87)),
                    onTap: () async {
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
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.location_on, color: Colors.grey[600]),
                        onPressed: () => _launchURL('https://maps.app.goo.gl/TvQzWP9pWpBt5oPg8'),
                      ),
                      Text(
                        'Ubicación',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.phone, color: Colors.grey[600]),
                        onPressed: () => _launchURL('tel:0987800233'),
                      ),
                      Text(
                        'Contacto',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                '¡Bienvenido/a,\n$nombre $apellido!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Color(0xFF1A237E)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Text(
                'Número de cuenta: $numeroCuenta',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              // Contenedor estilizado para el saldo
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Tu saldo es:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                    Text(
                      '\$${_formatNumber(saldoDisponible)}',
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800, color: Colors.green),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TransferirView()));
                },
                child: Text('Realizar Transferencia', style: TextStyle(fontSize: 18, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 55),
                  backgroundColor: Color(0xFF1A237E),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TarjetaView()),
                  );
                },
                child: Text('Administrar Tarjetas', style: TextStyle(fontSize: 18, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 55),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Historial de Transacciones',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1A237E))),
                  IconButton(
                    icon: Icon(_ordenAscendente ? Icons.arrow_downward : Icons.arrow_upward, color: Color(0xFF1A237E)),
                    onPressed: () {
                      setState(() {
                        _ordenAscendente = !_ordenAscendente;
                        _ordenarTransacciones();
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              ToggleButtons(
                borderRadius: BorderRadius.circular(15),
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
                  Text("Enviadas", style: TextStyle(fontSize: 16)),
                  Text("Recibidas", style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 20),
              transaccionesFiltradas.isEmpty
                  ? Text('No hay transacciones recientes', style: TextStyle(fontSize: 16, color: Colors.black54))
                  : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: transaccionesFiltradas.length,
                itemBuilder: (context, index) {
                  var transaccion = transaccionesFiltradas[index];
                  bool esEnviada = transaccion['emisor']['numeroCuenta'] == numeroCuenta;

                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      leading: Icon(
                        Icons.monetization_on,
                        color: esEnviada ? Colors.redAccent : Colors.greenAccent,
                        size: 30, // Aumentar el tamaño del icono
                      ),
                      title: Text(
                        esEnviada
                            ? 'Para: ${transaccion['beneficiario']['nombre']} ${transaccion['beneficiario']['apellido']}'
                            : 'De: ${transaccion['emisor']['nombre']} ${transaccion['emisor']['apellido']}',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17), // Ajustar estilo
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cuenta: ${esEnviada ? transaccion['numeroCuentaDestino'] : transaccion['emisor']['numeroCuenta']}',
                            style: TextStyle(fontSize: 15, color: Colors.black54), // Ajustar estilo
                          ),
                          Text(
                            'Monto: \$${_formatNumber(transaccion['monto'])}',
                            style: TextStyle(fontSize: 15, color: Colors.black54), // Ajustar estilo
                          ),
                          Text(
                            'Motivo: ${transaccion['motivo'] ?? 'No especificado'}',
                            style: TextStyle(fontSize: 15, color: Colors.black54), // Ajustar estilo
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}