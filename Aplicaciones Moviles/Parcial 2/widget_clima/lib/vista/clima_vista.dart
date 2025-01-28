import 'package:flutter/material.dart';
import '../controlador/clima_controlador.dart';
import '../modelo/clima_modelo.dart';
import 'clima_widget.dart';

class ClimaVista extends StatefulWidget {
  @override
  ClimaVistaState createState() => ClimaVistaState();
}

class ClimaVistaState extends State<ClimaVista> {
  final TextEditingController ciudadC = TextEditingController();
  final ClimaControlador climaC = ClimaControlador();

  ClimaModelo? climaModelo;

  // Función para obtener el clima y actualizar el estado
  void obtenerYActualizarClima() async {
    final ciudad = ciudadC.text.trim();
    if (ciudad.isNotEmpty) {
      final clima = await climaC.obtenerClima(ciudad);
      setState(() {
        climaModelo = clima;
      });
    } else {
      setState(() {
        climaModelo = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clima"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Caja de texto para ingresar la ciudad
            TextField(
              controller: ciudadC,
              decoration: InputDecoration(
                labelText: "Ingresa la ciudad",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Botón para ver el clima
            ElevatedButton(
              onPressed: obtenerYActualizarClima,
              child: Text("Ver clima"),
            ),
            SizedBox(height: 20),
            // Mostrar el clima si se obtuvo correctamente
            if (climaModelo != null)
              ClimaWidget(
                ciudad: climaModelo!.ciudad,
                temperatura: climaModelo!.temperatura,
                descripcion: climaModelo!.descripcion,
              ),
            // Mostrar mensaje si no se pudo obtener el clima
            if (climaModelo == null)
              Text(
                "No se pudo obtener el clima.",
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
