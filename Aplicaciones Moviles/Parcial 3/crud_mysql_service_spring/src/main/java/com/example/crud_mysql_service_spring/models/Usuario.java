package com.example.crud_mysql_service_spring.models;

import jakarta.persistence.*;

@Entity
public class Usuario {

    //Clave Primaria
    @Id
    //Especificar que el ID se genera automáticamente en la base de datos
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nombre;
    private String email;

    public Usuario(){}

    public Usuario(String nombre, String email){
        this.nombre=nombre;
        this.email=email;
    }

    //Métodos de acceso
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
