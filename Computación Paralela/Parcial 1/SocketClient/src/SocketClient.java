import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.Socket;
import java.util.Scanner;


public class SocketClient {

    private int puerto;
    private String ip;
    
    public SocketClient(String ip, int puerto){
        this.ip = ip;
        this.puerto = puerto;
    }
    
    public void startClient(String solicitud) {
        try {
            Socket cliente = new Socket(ip, puerto);
            DataOutputStream salida = new DataOutputStream(cliente.getOutputStream());
            DataInputStream entrada = new DataInputStream(cliente.getInputStream());
            
            // Enviar la solicitud al servidor
            salida.writeUTF(solicitud);
            
            // Leer la respuesta del servidor
            System.out.println("Respuesta del servidor: " + entrada.readUTF());
            
            salida.close();
            entrada.close();
            cliente.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        Scanner scr = new Scanner(System.in);
        String input = "";
        SocketClient cliente = new SocketClient("10.40.32.39", 10000);

        do {
            System.out.println("Ingrese una opción (descuentos/productos/salir): ");
            input = scr.next();

            if (input.equals("descuentos")) {
                cliente.startClient("descuentos");
            } else if (input.equals("productos")) {
                cliente.startClient("productos");
            } else if(input.equals("salir")){
                cliente.startClient("salir");
            } else if (!input.equals("salir")) {
                System.out.println("Opción no válida. Intente de nuevo.");
            }
        } while (!input.equals("salir"));

        scr.close();
    }
}
