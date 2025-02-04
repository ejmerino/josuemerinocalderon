package com.example.crud_mysql_service_spring.repositories;

import com.example.crud_mysql_service_spring.models.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

//Extiende JPARepository con la entidad Usuario y el tipo de la clave primaria
public interface UsuarioRepositorio extends JpaRepository<Usuario, Long> {

}
