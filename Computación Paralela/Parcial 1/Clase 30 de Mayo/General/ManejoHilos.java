
/**
 *
 * @author ednan
 */
public class ManejoHilos{

    /**
     *
     */
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
        new MiHilo("Justin").start();
        new MiHilo("Juan").start();
    }
