package com.bancamovil.dto;

import jakarta.validation.constraints.NotBlank; // Importa NotBlank
import jakarta.validation.constraints.NotNull;  // Importa NotNull
import jakarta.validation.constraints.Positive; // Importa Positive

public class TransferenciaRequest {

    @NotBlank(message = "El número de cuenta del emisor no puede estar en blanco")
    private String numeroCuentaEmisor;

    @NotBlank(message = "El número de cuenta del destino no puede estar en blanco")
    private String numeroCuentaDestino;

    @NotNull(message = "El monto no puede ser nulo")
    @Positive(message = "El monto debe ser positivo")
    private Double monto;

    private String motivo;

    // Getters y setters
    public String getNumeroCuentaEmisor() {
        return numeroCuentaEmisor;
    }

    public void setNumeroCuentaEmisor(String numeroCuentaEmisor) {
        this.numeroCuentaEmisor = numeroCuentaEmisor;
    }

    public String getNumeroCuentaDestino() {
        return numeroCuentaDestino;
    }

    public void setNumeroCuentaDestino(String numeroCuentaDestino) {
        this.numeroCuentaDestino = numeroCuentaDestino;
    }

    public Double getMonto() {
        return monto;
    }

    public void setMonto(Double monto) {
        this.monto = monto;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }
}