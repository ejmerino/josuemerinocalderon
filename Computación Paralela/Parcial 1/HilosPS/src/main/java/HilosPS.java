/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

/**
 *
 * @author ednan
 */

import java.util.Random;
public class HilosPS {   

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

    public void insertar(int dato) {
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

    public void eliminarArbol(Nodo nodo) {
        if (nodo == null) {
            return;
        }

        eliminarArbol(nodo.izquierda);
        eliminarArbol(nodo.derecha);

        nodo.izquierda = null;
        nodo.derecha = null;
    }

    public static void main(String[] args) {
        ArbolBinario arbol = new ArbolBinario();
        Random random = new Random();


        for(int j=0; j<10; j++  ){
            for (int i = 0; i < 10; i++) {
                int randomNumber = random.nextInt(100);
                arbol.insertar(randomNumber);
            }

            long startTime = System.nanoTime();
            System.out.println("\nRecorrido Preorden del árbol:");
            arbol.recorridoPreorden(arbol.raiz);

            System.out.println("\nRecorrido Inorden del árbol:");
            arbol.recorridoInorden(arbol.raiz);

            System.out.println("\nRecorrido Posorden del árbol:");
            arbol.recorridoPosorden(arbol.raiz);
            long endTime = System.nanoTime();
            System.out.println("\nTiempo de ejecución: " + (endTime - startTime) + " nanosegundos");
            arbol.eliminarArbol(arbol.raiz);
        }
    }
}

}