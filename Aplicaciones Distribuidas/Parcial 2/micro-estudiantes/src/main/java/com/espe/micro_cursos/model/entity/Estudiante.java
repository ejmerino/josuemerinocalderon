package com.espe.micro_cursos.model.entity;

import jakarta.persistence.*;
import java.util.Date;

@Entity // Indica que esta clase es una entidad de base de datos
public class Estudiante {

    @Id // Marca este campo como clave primaria
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Define que el ID se genera automáticamente
    private Long id;

    private String nombre;
    private String apellido;

    @Column(unique = true) // Asegura que el email sea único
    private String email;

    @Temporal(TemporalType.DATE)
    private Date fechaNacimiento;

    private String telefono;

    @Temporal(TemporalType.TIMESTAMP)
    private Date creadoEn;

    // Constructor vacío (obligatorio para JPA)
    public Estudiante() {}

    // Constructor con parámetros
    public Estudiante(String nombre, String apellido, String email, Date fechaNacimiento, String telefono, Date creadoEn) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.fechaNacimiento = fechaNacimiento;
        this.telefono = telefono;
        this.creadoEn = creadoEn;
    }
    // Método para inicializar creadoEn antes de persistir
    @PrePersist
    protected void prePersist() {
        if (this.creadoEn == null) {
            this.creadoEn = new Date();
        }
    }
    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public Date getCreadoEn() {
        return creadoEn;
    }

    public void setCreadoEn(Date creadoEn) {
        this.creadoEn = creadoEn;
    }
}