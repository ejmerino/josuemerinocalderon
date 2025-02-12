import 'package:flutter/material.dart';
import 'package:frontend/view/transferir_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/user_controller.dart';
import 'login_view.dart';
import 'tarjeta_view.dart';

class CuentaView extends StatelessWidget {
  final String nombre;
  final String apellido;
  final String numeroCuenta;
  final double saldoDisponible;

  // Constructor que recibe los datos necesarios
  CuentaView({
    required this.nombre,
    required this.apellido,
    required this.numeroCuenta,
    required this.saldoDisponible,
  });

  Future<int> obtenerUsuarioId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('id') ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cuenta de $nombre $apellido", style: TextStyle(color: Colors.white)), // Color blanco para el texto
        backgroundColor: Color(0xFF1A237E), // Azul oscuro para el AppBar
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.logout, color: Colors.white), // Icono de cerrar sesión
          onPressed: () {
            // Lógica de cierre de sesión, navega al LoginView usando Navigator.push
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView())); // Usamos Navigator.push para ir a LoginView
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Centrado del texto
            children: [
              // Bienvenida
              Text(
                '¡Bienvenido/a, $nombre $apellido!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A237E), // Azul fuerte
                ),
                textAlign: TextAlign.center, // Centrado del texto
              ),
              SizedBox(height: 16),

              // Número de cuenta
              Text(
                'Número de cuenta: $numeroCuenta',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center, // Centrado del texto
              ),
              SizedBox(height: 20),

              // Saldo disponible
              Text(
                'Tu saldo es:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center, // Centrado del texto
              ),
              Text(
                '\$${saldoDisponible.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: Colors.green, // Verde para el saldo
                ),
                textAlign: TextAlign.center, // Centrado del texto
              ),
              SizedBox(height: 40),

              // Botones de acción con un diseño más atractivo
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransferirView()),
                  );
                },
                child: Text('Realizar Transferencia'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 55),
                  backgroundColor: Color(0xFF1A237E), // Azul fuerte
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  textStyle: TextStyle(fontSize: 18, color: Colors.white), // Color de texto blanco
                ),
              ),
              SizedBox(height: 20),


              ElevatedButton(
                onPressed: () async {
                  int usuarioId = await obtenerUsuarioId();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TarjetaView(usuarioId: usuarioId),
                    ),
                  );
                },
                child: Text(
                  'Tarjetas',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 55),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              )


            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFF4F4F4), // Fondo suave para el cuerpo
    );
  }
}
