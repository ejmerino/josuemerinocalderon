import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modelo/clima_modelo.dart';

class ClimaControlador{
  final String apikey = '6ba0cd4fd13d42f36e513e213423c82f';
  final String apiUrl = 'https://api.openweathermap.org/data/2.5/weather';
  
  Future<ClimaModelo?> obtenerClima(String ciudad) async{
    final url = Uri.parse('$apiUrl?q=$ciudad&units=metric&appid=$apikey&lang=es');
    try{
      final respuesta = await http.get(url);
      if(respuesta.statusCode == 200){
        final json = jsonDecode(respuesta.body);
        return ClimaModelo.fromJson(json);
      } else{
        print('Error en obtener respuesta: ${respuesta.statusCode}');
      }
    }
    catch (e){
      print('Error: $e');
    }

    return null;
  }
}