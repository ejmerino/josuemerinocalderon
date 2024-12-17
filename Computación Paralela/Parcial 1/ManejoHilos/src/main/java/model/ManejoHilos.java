/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
public class ManejoHilos{
    public static class MiHilo extends Thread{
        MiHilo(String nombreHilo){
            super(nombreHilo);
        }
    
        @Override
        public void run(){
            for(int i=0; i<10; i++){
                System.out.println( i + " - " + getName());
            }
            System.out.println("Hilo terminado");
        }
    }

    public static void main(String[] args){
        new MiHilo("Josue").start();
        new MiHilo("Juan").start();
    }
}
