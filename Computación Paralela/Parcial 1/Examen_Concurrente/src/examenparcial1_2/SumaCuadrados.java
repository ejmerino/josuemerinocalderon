/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package examenparcial1_2;

/**
 *
 * @author Josué Merino Calderón
 */
import java.util.Random;

public class SumaCuadrados extends Thread {
    private int[] array;
    private int n;
    private long resultado;

    public SumaCuadrados(int n) {
        this.n = n;
        this.array = new int[n];
    }

    public void llenarArreglo() {
        Random r = new Random();
        for (int i = 0; i < array.length; i++) {
            array[i] = r.nextInt(100) + 1;
        }
    }

    @Override
    public void run() {
        resultado = 0;
        for (int i = 0; i < array.length; i++) {
            resultado += (long) array[i] * array[i];
        }
        System.out.println("Hilo Suma Cuadrados Terminado");
    }
    
    public long sumarCuadrados() {
        long suma = 0;
        for (int i = 0; i < array.length; i++) {
            suma += (long) array[i] * array[i];
        }
        return suma;
    }
    
    public long getResultado() {
        return resultado;
    }
}
