package com.bancamovil.model;

import jakarta.persistence.*;


@Entity
public class Transferencia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "emisor_id")
    private Usuario emisor;

    @ManyToOne
    @JoinColumn(name = "beneficiario_id")
    private Usuario beneficiario;

    private Double monto;

    private String numeroCuentaEmisor;

    private String numeroCuentaDestino;

    private String motivo;



    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Usuario getEmisor() {
        return emisor;
    }

    public void setEmisor(Usuario emisor) {
        this.emisor = emisor;
    }

    public Usuario getBeneficiario() {
        return beneficiario;
    }

    public void setBeneficiario(Usuario beneficiario) {
        this.beneficiario = beneficiario;
    }

    public Double getMonto() {
        return monto;
    }

    public void setMonto(Double monto) {
        this.monto = monto;
    }

    public String getNumeroCuentaEmisor() { return numeroCuentaEmisor;  }

    public void setNumeroCuentaEmisor(String numeroCuentaEmisor) {this.numeroCuentaEmisor = numeroCuentaEmisor; }

    public String getNumeroCuentaDestino() {
        return numeroCuentaDestino;
    }

    public void setNumeroCuentaDestino(String numeroCuentaDestino) {
        this.numeroCuentaDestino = numeroCuentaDestino;
    }

    public String getMotivo() {return motivo; }

    public void setMotivo(String motivo) {this.motivo = motivo;}
}
