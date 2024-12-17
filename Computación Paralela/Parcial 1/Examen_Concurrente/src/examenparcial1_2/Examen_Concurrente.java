/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package examenparcial1_2;

/**
*
*  @author Josué Merino Calderón

*/
public class Examen_Concurrente {
    public static void main(String[] args) {
        int n = 200000;
        Suma suma = new Suma(n);
        SumaCuadrados sumaCuadrados = new SumaCuadrados(n);
        suma.llenarArreglo();
        sumaCuadrados.llenarArreglo();

        Thread hiloSuma = new Thread(suma);
        Thread hiloSumaCuadrados = new Thread(sumaCuadrados);       
        
        hiloSuma.start();
        hiloSumaCuadrados.start();        
        
        long inicioSuma = System.nanoTime();        
        long resultadoSuma = suma.sumarElementos();
        long finSuma = System.nanoTime();
        long tiempoSuma = finSuma - inicioSuma;       
        long inicioCuadrados = System.nanoTime();
        long resultadoSumaCuadrados = sumaCuadrados.sumarCuadrados();
        long finCuadrados = System.nanoTime();
        long tiempoCuadrados = finCuadrados - inicioCuadrados;
        long tiempoFinal = tiempoCuadrados+tiempoSuma;
        
        System.out.println("Suma: " + resultadoSuma);
        System.out.println("Tiempo: " + tiempoSuma + " nanosegundos");
        System.out.println("Suma Cuadrados: " + resultadoSumaCuadrados);
        System.out.println("Tiempo: " + tiempoCuadrados + " nanosegundos");
        System.out.println("Tiempo Total: " + tiempoFinal + " nanosegundos");
    }
}


