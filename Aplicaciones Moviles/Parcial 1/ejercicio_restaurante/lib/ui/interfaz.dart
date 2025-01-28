import 'package:flutter/material.dart';
import '../logica/banquete.dart';

class BanquetePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BanquetePageState();
}

class BanquetePageState extends State<BanquetePage> {
  final TextEditingController _numeroPersonasController =
  TextEditingController();
  final TextEditingController _factorialController = TextEditingController();

  // Variables para mostrar los resultados
  String _resultadoCosto = '';
  String _resultadoFactorial = '';

  // Instancia de la clase
  final Banquete _banquete = Banquete();

  // Método para calcular el costo
  void _calcularCosto() {
    final numeroDePersonas = int.tryParse(_numeroPersonasController.text);

    // Validación
    if (numeroDePersonas == null || numeroDePersonas <= 0) {
      setState(() {
        _resultadoCosto = 'Ingresar un número válido';
      });
    } else {
      // Cálculo del costo total
      final costoTotal = _banquete.calcularCostoTotal(numeroDePersonas);

      setState(() {
        _resultadoCosto =
        'El Costo Total para $numeroDePersonas personas es: \$${costoTotal.toStringAsFixed(2)}';
      });
    }
  }

  // Método para calcular el factorial
  void _calcularFactorial() {
    final numero = int.tryParse(_factorialController.text);

    // Validación
    if (numero == null || numero < 0) {
      setState(() {
        _resultadoFactorial = 'Ingresar un número válido (≥ 0)';
      });
    } else {
      // Cálculo del factorial
      final factorial = _banquete.calcularFactorial(numero);

      setState(() {
        _resultadoFactorial =
        'El factorial de $numero es: ${factorial.toStringAsFixed(0)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cotización y Factorial'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _numeroPersonasController,
              decoration: InputDecoration(
                labelText: 'Número de Personas',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _calcularCosto,
              child: Text('Calcular costo'),
            ),
            SizedBox(height: 20.0),
            Text(
              _resultadoCosto,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Divider(height: 40.0, thickness: 2.0),
            TextField(
              controller: _factorialController,
              decoration: InputDecoration(
                labelText: 'Número para Factorial',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _calcularFactorial,
              child: Text('Calcular factorial'),
            ),
            SizedBox(height: 20.0),
            Text(
              _resultadoFactorial,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
