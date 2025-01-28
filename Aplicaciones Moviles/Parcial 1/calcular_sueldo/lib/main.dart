import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cálculo de Sueldo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SalaryCalculator(),
    );
  }
}

class SalaryCalculator extends StatefulWidget {
  @override
  _SalaryCalculatorState createState() => _SalaryCalculatorState();
}

class _SalaryCalculatorState extends State<SalaryCalculator> {
  final _sueldoBaseController = TextEditingController();
  final _ventasController = TextEditingController();
  String _resultado = "";

  // Función para calcular el sueldo total
  void _calcularSueldo() {
    double? sueldoBase = double.tryParse(_sueldoBaseController.text);
    double? ventas = double.tryParse(_ventasController.text);

    if (sueldoBase == null || ventas == null || ventas < 0) {
      setState(() {
        _resultado = "Datos inválidos. Verifique los valores ingresados.";
      });
      return;
    }

    double comision;
    if (ventas < 4000000) {
      comision = 0;
    } else if (ventas >= 4000000 && ventas < 10000000) {
      comision = ventas * 0.03;
    } else {
      comision = ventas * 0.07;
    }

    double sueldoTotal = sueldoBase + comision;
    setState(() {
      _resultado = "El sueldo mensual del vendedor es: \$${sueldoTotal.toStringAsFixed(2)}";
    });
  }

  @override
  void dispose() {
    _sueldoBaseController.dispose();
    _ventasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cálculo de Sueldo Mensual'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _sueldoBaseController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Sueldo Base',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _ventasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ventas del Mes',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calcularSueldo,
              child: Text('Calcular Sueldo Mensual'),
            ),
            SizedBox(height: 16.0),
            Text(
              _resultado,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
