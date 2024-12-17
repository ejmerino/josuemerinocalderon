import java.util.concurrent.Semaphore;

public class Subproceso extends Thread {
    private int tiempo; // en segundos
    private int aporte; // en porcentaje
    private Semaphore semaforo;
    javax.swing.JProgressBar barraProgreso;
    javax.swing.JLabel label;
    public int aporteTotal;
    
    

    
    public Subproceso( int tiempo, int aporte, Semaphore semaforo, javax.swing.JProgressBar barraProgreso, javax.swing.JLabel label, int aporteTotal) {
        this.tiempo = tiempo;
        this.aporte = aporte;   
        this.semaforo = semaforo;
        this.barraProgreso = barraProgreso;
        this.label = label;
        this.aporteTotal = aporteTotal;
    }
    
    @Override
    public void run() {
        try {
            
                semaforo.acquire();
                for (int i = 0; i <= 100; i++) {
                    barraProgreso.setValue(i);
                    label.setText(i+"%");
                    aporteTotal +=i;
                    Thread.sleep(tiempo * 50);
                }
                semaforo.release();
            
            
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
    
    public int getAporte() {
        return aporte;
    }
    
    public int getAporteTotal() {
        return aporteTotal;
    }
}