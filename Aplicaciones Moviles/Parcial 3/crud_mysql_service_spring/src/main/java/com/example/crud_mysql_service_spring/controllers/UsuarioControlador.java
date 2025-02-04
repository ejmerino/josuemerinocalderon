package com.example.crud_mysql_service_spring.controllers;

import com.example.crud_mysql_service_spring.models.Usuario;
import com.example.crud_mysql_service_spring.services.UsuarioServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/usuarios")
public class UsuarioControlador {

    @Autowired
    private UsuarioServicio usuarioServicio;

    // Obtener todos los usuarios
    @GetMapping
    public List<Usuario> obtenerTodos() {
        return usuarioServicio.obtenerTodos();
    }

    // Obtener usuario por ID
    @GetMapping("/{id}")
    public ResponseEntity<Usuario> obtenerPorId(@PathVariable Long id) {
        Usuario usuario = (Usuario) usuarioServicio.obtenerPorId(id);
        return usuario != null ? ResponseEntity.ok(usuario) : ResponseEntity.notFound().build();
    }

    // Guardar un nuevo usuario
    @PostMapping
    public ResponseEntity<Usuario> guardarUsuario(@RequestBody Usuario usuario) {
        return ResponseEntity.ok(usuarioServicio.guardarUsuario(usuario));
    }

    // Actualizar usuario
    @PutMapping("/{id}")
    public ResponseEntity<Usuario> actualizarUsuario(@PathVariable Long id, @RequestBody Usuario usuarioDetalles) {
        Usuario usuarioActualizado = usuarioServicio.actualizarUsuario(id, usuarioDetalles);
        return usuarioActualizado != null ? ResponseEntity.ok(usuarioActualizado) : ResponseEntity.notFound().build();
    }

    // Eliminar usuario
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminarUsuario(@PathVariable Long id) {
        usuarioServicio.eliminarUsuario(id);
        return ResponseEntity.noContent().build();
    }
}