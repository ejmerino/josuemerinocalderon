package com.espe.serverrmi;

import java.rmi.Naming;
import java.rmi.registry.LocateRegistry;

public class ServerRMI {
    public static void main(String[] args){
        try{
            //Inicia el registro RMI en el puerto 1099
            LocateRegistry.createRegistry(1099);
            IHelloService helloService = new HelloServiceImpl();

            Naming.rebind("HelloService", helloService);

            System.out.println("\nServidor listo y escuchando en HelloService");
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}