package com.example.crud_mysql_service_spring.services;

import com.example.crud_mysql_service_spring.models.Usuario;
import com.example.crud_mysql_service_spring.repositories.UsuarioRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
public class UsuarioServicio {

    @Autowired
    private UsuarioRepositorio repositorio;

    //Metodo para obtener todos los usuarios
    public List<Usuario> obtenerTodos(){
        return repositorio.findAll();
    }

    //Metodo para guardar un usuario
    public Usuario guardarUsuario(Usuario usuario){
        return repositorio.save(usuario);
    }

    //Metodo para obtener el usuario por ID
    public Object obtenerPorId(Long id){
        return repositorio.findById(id).orElse(null);
    }

    //Metodo para actualizar
    public Usuario actualizarUsuario(Long id, Usuario usuarioDetalles){
        Usuario usuario =(Usuario)repositorio.findById(id).orElse(null);
        if(usuario!=null){
            usuario.setNombre(usuarioDetalles.getNombre());
            usuario.setEmail(usuarioDetalles.getEmail());
            return (Usuario) repositorio.save(usuario);
        }
        return null;
    }

    //Metodo para eliminar un usuario
    public void eliminarUsuario(Long id){
            repositorio.deleteById(id);
    }
}
