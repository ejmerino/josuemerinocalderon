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

public class Suma extends Thread {
    private int[] array;
    private int n;
    private long resultado;

    public Suma(int n) {
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
            resultado += array[i];
        }
        System.out.println("Hilo Suma Terminado");
    }
    
    public long sumarElementos() {
        long suma = 0;
        for (int i = 0; i < array.length; i++) {
            suma += array[i];
        }
        return suma;
    }

    public long getResultado() {
        return resultado;
    }
}