/**
 *
 * @author Josué Merino Calderón
 */

import java.util.Random;

public class SumaVector {
    private int[] array;
    private int n;

    public SumaVector(int n) {
        this.n = n;
        this.array = new int[n];
    }

    public void llenarArreglo() {
        Random r = new Random();
        for (int i = 0; i < array.length; i++) {
            array[i] = r.nextInt(100) + 1;
        }
    }

    public long sumarElementos() {
        long suma = 0;
        for (int i = 0; i < array.length; i++) {
            suma += array[i];
        }
        return suma;
    }
}



