/*Realizar un programa secuancial en java que realice la suma de los elementos 
de un vector (Clase SumaVector) y la suma de los cuadrados de los elementos del 
Vector)Clase SumaVetorCuadrado(). El tamaño del vector es de 200000 y el llenado 
es aleatorio. Medir el tiempo de ejecución con el método nanoTime()de la clase System
(System.nanoTIme() cuyo valor es devuelto como long*/

/**
 *
 * @author Josué Merino Calderón
 */
public class Examen_Secuencial {
    public static void main(String[] args) {
        int n = 200000;       
        
        SumaVector sumaVector = new SumaVector(n);
        sumaVector.llenarArreglo();
        
        SumaVectorCuadrado sumaVectorCuadrado = new SumaVectorCuadrado(n);
        sumaVectorCuadrado.llenarArreglo();
        long inicioSuma = System.nanoTime();
        long resultadoSuma = sumaVector.sumarElementos();
        long finSuma = System.nanoTime();
        long tiempoSuma = finSuma - inicioSuma;     
        long inicioCuadrado = System.nanoTime();
        long resultadoCuadrado = sumaVectorCuadrado.sumarCuadrados();
        long finCuadrado = System.nanoTime();
        long tiempoCuadrado = finCuadrado - inicioCuadrado;
        long tiempoFinal = tiempoCuadrado + tiempoSuma;
        
        System.out.println("Suma: " + resultadoSuma);
        System.out.println("Tiempo de ejecucion: " + tiempoSuma + " nanosegundos");
        System.out.println("Suma de cuadrados: " + resultadoCuadrado);
        System.out.println("Tiempo de ejecucion: " + tiempoCuadrado + " nanosegundos");
        System.out.println("Tiempo Total: "+ tiempoFinal + " nanosegundos");
    }
}