/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package espe.servidor;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

/**
 *
 * @author ednan
 */
public class Servidor {
    
    private int puerto;
    
    public Servidor(int puerto){
        try {
            ServerSocket servidor = new ServerSocket(puerto);
            System.out.println("SERVER INICIADO - Esperando conexiones de clientes...");
            
            for(int i=1; i <= 3; i++){
                Socket cliente  = servidor.accept();
                System.out.println("Se conectó el cliente "+1);

                DataOutputStream salida = new DataOutputStream(cliente.getOutputStream());
                salida.writeUTF("Hola cliente "+i);
                salida.close();
                cliente.close();
            }
           
    
        servidor.close();
        System.out.println("SERVER TERMINADO");
        
        } catch (IOException e){
            e.printStackTrace();
    }
        
    }

    public static void main(String[] args) {
        new Servidor(10000);
    }
}
