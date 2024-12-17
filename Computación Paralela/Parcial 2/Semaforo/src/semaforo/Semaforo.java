/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package semaforo;

import java.util.concurrent.Semaphore;

/**
 *
 * @author ednan
 */
public class Semaforo {
    public static void main(String[] args){  
        Contador contador = new Contador();
        Semaphore semaforo = new Semaphore(1);


        Tarea h1 = new Tarea(1, semaforo);
        Tarea h2 = new Tarea(2, semaforo);
        Tarea h3 = new Tarea(3, semaforo);
        Tarea h4 = new Tarea(4, semaforo);   
        Tarea h5 = new Tarea(5, semaforo);   
        h1.start();
        h2.start();
        h3.start();
        h4.start();
        h5.start();        
        
        try{
            h1.join();
            h2.join();
            h3.join();
            h4.join();
            h5.join();
        } catch(InterruptedException e){
            Thread.currentThread().interrupt();
        }
        
        System.out.println("Todos los hilos han terminado");
        System.out.println("Todos los hilos han terminado");
    }
}
