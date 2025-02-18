package com.bancamovil.controller;

import com.bancamovil.model.Usuario;
import com.bancamovil.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
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

    @PutMapping("/editar")
    public ResponseEntity<String> editarUsuario(
            @RequestBody Map<String, String> payload) {
        try {
            String numeroCuenta = payload.get("numeroCuenta");
            String email = payload.get("email");
            String username = payload.get("username");
            String password = payload.get("password");

            usuarioService.editarUsuario(numeroCuenta, email, username, password);
            return new ResponseEntity<>("Usuario actualizado con éxito", HttpStatus.OK);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        } catch (Exception e) {
            System.err.println("Error inesperado al editar el usuario: " + e.getMessage());
            return new ResponseEntity<>("Error interno del servidor", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
