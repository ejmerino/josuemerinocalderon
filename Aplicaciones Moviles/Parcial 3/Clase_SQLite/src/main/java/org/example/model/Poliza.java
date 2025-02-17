package org.example.model;

public class Poliza {

    private String nombre;

    private double valor;

    private int accidente;

    private String modelo;

    private String edad;

    private double costoPoliza;

    //Constructor


    public Poliza(String nombre, double valor, int accidente, String modelo, String edad, double costoPoliza) {
        this.nombre = nombre;
        this.valor = valor;
        this.accidente = accidente;
        this.modelo = modelo;
        this.edad = edad;
        this.costoPoliza = costoPoliza;
    }
}
