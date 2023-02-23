/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package numerosromanos;

/**
 *
 * @author JOSUE
 */
public class Transformar {

    public static String NumeroToRomano (double n){
        /*if(n==1){
            return "I";
        } else if (n==2){
            return "II";
        } else if (n==3){
            return "III";
        }*/
        String res;
        res = "";
        for(int i = 0; i < n; i++){
            res+="I";
            //return res;
        }
        return res;
        
        
    }
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
    }
    
    
    
}
