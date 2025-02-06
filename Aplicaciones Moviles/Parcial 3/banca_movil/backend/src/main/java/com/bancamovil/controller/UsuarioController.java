package com.bancamovil.controller;

import com.bancamovil.model.Usuario;
import com.bancamovil.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/usuarios")
@CrossOrigin(origins = "*")
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @PostMapping("/registrar")
    public Usuario registrarUsuario(@RequestBody Usuario usuario) {
        return usuarioService.registrarUsuario(usuario);
    }

    @GetMapping
    public List<Usuario> obtenerUsuarios() {
        return usuarioService.obtenerUsuarios();  // Lógica para obtener todos los usuarios
    }

    @GetMapping("/cuenta/{numeroCuenta}")
    public ResponseEntity<Usuario> obtenerUsuarioPorNumeroCuenta(@PathVariable String numeroCuenta) {
        System.out.println("Buscando cuenta con número: " + numeroCuenta);
        // Verifica si llega correctamente al backend
        Optional<Usuario> usuario = usuarioService.obtenerUsuarioPorNumeroCuenta(numeroCuenta);
        return usuario.map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }




}
