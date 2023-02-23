/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package numerodecedula;

import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author JOSUE
 */
public class NumeroDeCedulaTest {

    @Test
    public void TestCedula1() {
        assertEquals(true,NumeroDeCedula.validarCedula("1718972597"));
    }
    
    @Test
    public void TestCedula2(){
        assertEquals(false,NumeroDeCedula.validarCedula("ABDC"));
    }
    
    @Test
    public void TestCedula3(){
        assertEquals(true,NumeroDeCedula.validarCedula("0602495269"));
    }
    
    @Test
    public void TestCedula4(){
        assertEquals(false,NumeroDeCedula.validarCedula("1234567890"));
    }
}
