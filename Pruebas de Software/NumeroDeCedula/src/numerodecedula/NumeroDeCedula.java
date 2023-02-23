/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package numerodecedula;

/**
 *
 * @author JOSUE
 */
public class NumeroDeCedula {
    public static boolean validarCedula(String cedula) {
    // Verificar que la cédula no sea nula y tenga una longitud de 10 caracteres
    if (cedula == null || cedula.length() != 10) {
        return false;
    }
    
    // Extraer el código de provincia de la cédula (los dos primeros dígitos)
    int provincia = Integer.parseInt(cedula.substring(0, 2));
    
    // Verificar que el código de provincia esté entre 1 y 24 (los códigos válidos)
    if (provincia < 1 || provincia > 24) {
        return false;
    }
    
    // Extraer el dígito que indica el género de la persona (el tercer dígito)
    int genero = Character.getNumericValue(cedula.charAt(2));
    
    // Verificar que el género esté entre 0 y 6 (los valores válidos)
    if (genero < 0 || genero > 6) {
        return false;
    }
    
    // Calcular la suma de los dígitos de la cédula según el algoritmo especificado
    int suma = 0;
    for (int i = 0; i < 9; i++) {
        int digito = Character.getNumericValue(cedula.charAt(i));
        if (i % 2 == 0) {
            // Si el dígito está en una posición par, se multiplica por 2 y se resta 9 si es mayor a 9
            digito *= 2;
            if (digito > 9) {
                digito -= 9;
            }
        }
        suma += digito;
    }
    
    // Calcular el residuo de la suma dividida entre 10
    int residuo = suma % 10;
    
    // Extraer el último dígito de la cédula
    int ultimoDigito = Character.getNumericValue(cedula.charAt(9));
    
    // Verificar que el último dígito sea cero si el residuo de la suma es cero
    // O que el último dígito sea igual a la diferencia entre 10 y el residuo de la suma
    return (residuo == 0 && ultimoDigito == 0) || (residuo == 10 - ultimoDigito);
}




    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
    }
    
}
