package com.espe.clientrmi;

import com.espe.serverrmi.IHelloService;

import java.rmi.Naming;

public class Main {
    public static void main(String[] args) {
        try {
            // Busca el servicio remoto en el registro RMI
            IHelloService helloService = (IHelloService) Naming.lookup("rmi://localhost/HelloService");

            // Invoca el metodo remoto
            String response = helloService.sayHello("Jos");
            System.out.println("\nRespuesta del servidor: " + response);
        } catch (Exception e) {
            System.err.println("Error al conectar con el servidor RMI:");
            e.printStackTrace();
        }
    }
}
