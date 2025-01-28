import 'dart:math'; // Importar para usar sqrt
import '../modelo/operaciones_modelo.dart';

class OperacionesControlador {
  // Método para realizar las operaciones
  String realizarOperacion(OperacionesModelo operacion, String tipoOperacion) {
    double resultado;

    switch (tipoOperacion) {
      case 'suma':
        resultado = operacion.numero1 + operacion.numero2;
        break;
      case 'resta':
        resultado = operacion.numero1 - operacion.numero2;
        break;
      case 'multiplicacion':
        resultado = operacion.numero1 * operacion.numero2;
        break;
      case 'division':
        if (operacion.numero2 != 0) {
          resultado = operacion.numero1 / operacion.numero2;
        } else {
          return "Error: No se puede dividir por 0.";
        }
        break;
      case 'raiz cuadrada':
        if (operacion.numero1 >= 0) {
          resultado = sqrt(operacion.numero1);
        } else {
          return "Error: No se puede calcular la raíz cuadrada de un número negativo.";
        }
        break;
      default:
        return 'Operación no válida';
    }

    return 'Resultado: ${resultado.toStringAsFixed(2)}';
  }
}
