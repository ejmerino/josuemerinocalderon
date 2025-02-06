import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cuenta de $nombre $apellido"),
        backgroundColor: Color(0xFF1A237E), // Azul oscuro para el AppBar
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              // Lógica de cierre de sesión, puede navegar al LoginView o limpiar la sesión
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bienvenida
              Text(
                '¡Bienvenido/a, $nombre $apellido!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A237E), // Azul fuerte
                ),
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
              ),
              Text(
                '\$${saldoDisponible.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: Colors.green, // Verde para el saldo
                ),
              ),
              SizedBox(height: 40),

              // Botones de acción con un diseño más atractivo
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/transferir'),
                child: Text('Realizar Transferencia'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 55), backgroundColor: Color(0xFF1A237E), // Azul fuerte
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/crearTarjeta'),
                child: Text('Tarjetas'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 55), backgroundColor: Colors.teal, // Teal para crear tarjeta
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),

            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFF4F4F4), // Fondo suave para el cuerpo
    );
  }
}
