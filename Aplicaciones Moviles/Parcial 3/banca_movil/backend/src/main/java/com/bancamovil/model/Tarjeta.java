package com.bancamovil.model;

import jakarta.persistence.*;

@Entity
@Table(name = "tarjetas")
public class Tarjeta {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String numero;

    @Column(nullable = false)
    private String mesExpiracion;

    @Column(nullable = false)
    private String anioExpiracion;

    @Column(nullable = false)
    private String cvv;

    @Column(nullable = false)
    private boolean estado;  // true = activa, false = congelada

    @ManyToOne
    @JoinColumn(name = "usuario_id", nullable = false)
    private Usuario usuario;

    @Column(nullable = false)
    private String marca;

    // Getters y Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNumero() { return numero; }
    public void setNumero(String numero) { this.numero = numero; }

    public String getMesExpiracion() { return mesExpiracion; }
    public void setMesExpiracion(String mesExpiracion) { this.mesExpiracion = mesExpiracion; }

    public String getAnioExpiracion() { return anioExpiracion; }
    public void setAnioExpiracion(String anioExpiracion) { this.anioExpiracion = anioExpiracion; }

    public String getCvv() { return cvv; }
    public void setCvv(String cvv) { this.cvv = cvv; }

    public boolean isEstado() { return estado; }  // Cambié el nombre para seguir las convenciones de Java
    public void setEstado(boolean estado) { this.estado = estado; }

    public Usuario getUsuario() { return usuario; }
    public void setUsuario(Usuario usuario) { this.usuario = usuario; }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }
}