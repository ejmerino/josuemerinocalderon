/**
 *
 * @author Josué Merino Calderón
 */
import java.util.Random;

public class SumaVectorCuadrado {
    private int[] array;
    private int n;

    public SumaVectorCuadrado(int n) {
        this.n = n;
        this.array = new int[n];
    }

    public void llenarArreglo() {
        Random r = new Random();
        for (int i = 0; i < array.length; i++) {
            array[i] = r.nextInt(100) + 1;
        }
    }

    public long sumarCuadrados() {
        long suma = 0;
        for (int i = 0; i < array.length; i++) {
            suma += (long) array[i] * array[i];
        }
        return suma;
    }
}

