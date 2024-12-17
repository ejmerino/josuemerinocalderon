/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package semaforo;

/**
 *
 * @author ednan
 */
public class Contador {
    public static int contador = 0;
    
    public void incrementar(){
        contador ++;
    }
    
    public int obtenerValor(){
        return contador;
    }
}
