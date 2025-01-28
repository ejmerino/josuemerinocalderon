import 'dart:math';

class Banquete{

  //metodo para calcular el costo total
  double calcularCostoTotal(int numeroPersonas){
    double costoPorPersona;
    if(numeroPersonas<=200){
      costoPorPersona=95.0;
    }
    else if(numeroPersonas<=300){
      costoPorPersona=85.0;
    } else{
      costoPorPersona=75.0;
    }
    //Determinar el costo por persona
    return costoPorPersona*numeroPersonas;
  }

  double calcularFactorial(int numero){
    if (numero < 0) {
      throw ArgumentError("El número debe ser no negativo.");
    }

    double factorial = 1;
    for (int i = 1; i <= numero; i++) {
      factorial *= i;
    }
    return factorial;
  }
}