import 'package:flutter/material.dart';
import '../modelo/operaciones_modelo.dart';
import '../controlador/operaciones_controlador.dart';

class OperacionVista extends StatefulWidget {
  final String titulo;
  final String tipoOperacion;

  // Constructor
  OperacionVista({required this.titulo, required this.tipoOperacion});

  @override
  OperacionVistaState createState() => OperacionVistaState();
}

class OperacionVistaState extends State<OperacionVista> {
  final TextEditingController numero1c = TextEditingController();
  final TextEditingController numero2c = TextEditingController();

  // Instancia del controlador
  final OperacionesControlador operacionC = OperacionesControlador();

  String _resultado = '';

  // Método para calcular el resultado de la operación
  void calcular() {
    final String textoNumero1 = numero1c.text.trim();
    final String textoNumero2 = numero2c.text.trim();

    if (textoNumero1.isEmpty) {
      setState(() {
        _resultado = 'Por favor, ingrese el primer número.';
      });
      return;
    }

    final double numero1 = double.tryParse(textoNumero1) ?? 0;
    final double numero2 = widget.tipoOperacion == 'raiz cuadrada'
        ? 0
        : (double.tryParse(textoNumero2) ?? 0);

    final operacion = OperacionesModelo(numero1: numero1, numero2: numero2);
    final resultado = operacionC.realizarOperacion(operacion, widget.tipoOperacion);

    setState(() {
      _resultado = resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo de texto para el primer número
            TextField(
              controller: numero1c,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Ingrese el primer número",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Campo de texto para el segundo número (opcional para raíz cuadrada)
            if (widget.tipoOperacion != 'raiz cuadrada')
              TextField(
                controller: numero2c,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Ingrese el segundo número",
                  border: OutlineInputBorder(),
                ),
              ),
            if (widget.tipoOperacion != 'raiz cuadrada') SizedBox(height: 20),
            // Botón para calcular
            ElevatedButton(
              onPressed: calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                'Calcular',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            // Resultado
            Text(
              _resultado,
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
