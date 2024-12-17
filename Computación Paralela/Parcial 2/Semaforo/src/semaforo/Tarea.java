/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package semaforo;

import java.util.concurrent.Semaphore;

public class Tarea extends Thread{
    
    private final int id;
    Semaphore semaforo = new Semaphore(1);
    Contador contador = new Contador();
    
    Tarea(int id, Semaphore semaforo){
        this.id = id;
        this.semaforo = semaforo;
    }
    
    @Override
    public void run(){
        System.out.println("Hilo "+id+" esperando para entrar en la sección crítica ");
        try{
            semaforo.acquire();
            System.out.println("Hilo "+id+" ha entrado en la sección crítica ");
            for(int i = 0; i<10; i++){
                contador.incrementar();
            }
            Thread.sleep(1000);
            System.out.println("Hilo "+id+ " Saliendo de la sección crítica ");
        }catch(InterruptedException e){
            Thread.currentThread().interrupt();
            System.out.println("Hilo "+id+" interrumpido");
        } finally{
            semaforo.release();
        }
        
        
    }    
}
