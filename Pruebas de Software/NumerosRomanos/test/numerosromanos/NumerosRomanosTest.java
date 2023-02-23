/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package numerosromanos;

import org.junit.Test;
import static org.junit.Assert.*;
        
/**
 *
 * @author JOSUE
 */
public class NumerosRomanosTest {

    @Test
    public void NumeroToRomano() {
        assertEquals("I",Transformar.NumeroToRomano(1));
    }
    
    @Test
    public void NumeroToRomano2() {
        assertEquals("II",Transformar.NumeroToRomano(2));
    }
    
    @Test
    public void NumeroToRomano3() {
        assertEquals("III",Transformar.NumeroToRomano(3));
    }
    
}
