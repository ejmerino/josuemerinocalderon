import java.util.Random;
import java.util.HashSet;
import java.util.Set;

public class LecturaArbolesBinarios {

    public static class Nodo {
        int dato;
        Nodo izquierda;
        Nodo derecha;

        public Nodo(int dato) {
            this.dato = dato;
            this.izquierda = null;
            this.derecha = null;
        }
    }

    static class ArbolBinario {
        Nodo raiz;

        public ArbolBinario() {
            raiz = null;
        }

        public synchronized void insertar(int dato) {
            raiz = insertarRec(raiz, dato);
        }

        private Nodo insertarRec(Nodo nodo, int dato) {
            if (nodo == null) {
                return new Nodo(dato);
            }

            if (dato < nodo.dato) {
                nodo.izquierda = insertarRec(nodo.izquierda, dato);
            } else if (dato > nodo.dato) {
                nodo.derecha = insertarRec(nodo.derecha, dato);
            }

            return nodo;
        }

        public void recorridoInorden(Nodo nodo) {
            if (nodo != null) {
                recorridoInorden(nodo.izquierda);
                System.out.print(nodo.dato + " ");
                recorridoInorden(nodo.derecha);
            }
        }

        public void recorridoPreorden(Nodo nodo) {
            if (nodo != null) {
                System.out.print(nodo.dato + " ");
                recorridoPreorden(nodo.izquierda);
                recorridoPreorden(nodo.derecha);
            }
        }

        public void recorridoPosorden(Nodo nodo) {
            if (nodo != null) {
                recorridoPosorden(nodo.izquierda);
                recorridoPosorden(nodo.derecha);
                System.out.print(nodo.dato + " ");
            }
        }
    }

    public static class GenerarNumeros extends Thread {
        private ArbolBinario arbol;
        private Set<Integer> numerosGenerados;
        private Random random;

        GenerarNumeros(String nombreHilo, ArbolBinario arbol, Set<Integer> numerosGenerados) {
            super(nombreHilo);
            this.arbol = arbol;
            this.numerosGenerados = numerosGenerados;
            this.random = new Random();
        }

        @Override
        public void run() {
            while (numerosGenerados.size() < 10) {
                int randomNumber = random.nextInt(100); // Cambia el rango según tus necesidades
                synchronized (numerosGenerados) {
                    if (!numerosGenerados.contains(randomNumber)) {
                        numerosGenerados.add(randomNumber);
                        arbol.insertar(randomNumber);
                        System.out.println(getName() + " inserto: " + randomNumber);
                    }
                }
            }
        }
    }

    public static class RecorrerArbol extends Thread {
        private ArbolBinario arbol;

        RecorrerArbol(String nombreHilo, ArbolBinario arbol) {
            super(nombreHilo);
            this.arbol = arbol;
        }

        @Override
        public void run() {
            System.out.println("\nRecorrido Preorden del arbol:");
            arbol.recorridoPreorden(arbol.raiz);

            System.out.println("\nRecorrido Inorden del arbol:");
            arbol.recorridoInorden(arbol.raiz);

            System.out.println("\nRecorrido Posorden del arbol:");
            arbol.recorridoPosorden(arbol.raiz);
        }
    }

    public static void main(String[] args) {
        ArbolBinario arbol = new ArbolBinario();
        Set<Integer> numerosGenerados = new HashSet<>();

        Thread hiloGenerador = new GenerarNumeros("Generador", arbol, numerosGenerados);
        Thread hiloRecorrido = new RecorrerArbol("Recorrido", arbol);

        hiloGenerador.start();
        
        try {
            hiloGenerador.join(); // Espera a que el hilo generador termine
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        hiloRecorrido.start();
        
        try {
            hiloRecorrido.join(); // Espera a que el hilo de recorrido termine
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}

