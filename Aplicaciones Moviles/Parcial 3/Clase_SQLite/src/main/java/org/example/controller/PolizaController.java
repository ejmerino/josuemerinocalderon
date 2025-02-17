package org.example.controller;

public class PolizaController {
    //Metodo
    public static String calcularCosto(String nombre, int valor, int accidentes, String modelo, String edad) {
        //Cargo por valor
        double cargoxvalor = valor * 0.035;

        //Cargo por accidentes previos

        //Cargo por modelo
        double cargoxmodelo = 0;
        if(modelo.equals("A")) {
            cargoxmodelo = valor * 0.011;
        } else if(modelo.equals("BA")) {
            cargoxmodelo = valor * 0.012;
        } else if(modelo.equals("C")) {
            cargoxmodelo = valor * 0.013;
        }
        //Cargo por edad
        double cargoxedad = 0;
        if(edad.equals("18-23")){
            cargoxedad = valor * 360;
        } else if(edad.equals("25-35")){
            cargoxedad = valor * 240;
        } else if (edad.equals("Mayor de 55")) {
            cargoxedad = valor * 430;
        } else  {
            cargoxedad = valor * 0;
        }

        return "";
    }
}
