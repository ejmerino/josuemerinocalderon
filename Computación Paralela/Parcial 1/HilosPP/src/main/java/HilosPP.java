/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

/**
 *
 * @author ednan
 */
import java.util.Random;
public class HilosPP {
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
    
    public static class ArbolBinario {
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


    
    public static class MiHilo extends Thread{
        private ArbolBinario arbol;

        MiHilo(ArbolBinario arbol, int order){
            super("Hilo " + order);
            this.arbol = arbol;
        }

        @Override
        public void run(){
            if(getName().equals("Hilo 1")){
                arbol.recorridoInorden(arbol.raiz);
            }else if(getName().equals("Hilo 2")){
                arbol.recorridoPreorden(arbol.raiz);
            }else if(getName().equals("Hilo 3")){
                arbol.recorridoPosorden(arbol.raiz);
            }
        }
    }

    public static void main(String[] args){
        ArbolBinario arbol = new ArbolBinario();
        Random random = new Random();
        
        for(int i=0; i<2; i++){
            for(int j=0; j<10; j++){
                arbol.insertar(random.nextInt(100));
            }

            long startTime = System.nanoTime();
            new MiHilo(arbol, 1).start();
            new MiHilo(arbol, 2).start();
            new MiHilo(arbol, 3).start(); 
            while(Thread.activeCount() > 1){}
            long endTime = System.nanoTime();
            System.out.println("\nTiempo de ejecución: " + (endTime - startTime) + " nanosegundos");
            arbol.eliminarArbol(arbol.raiz);
        }       
       }
    }
}
