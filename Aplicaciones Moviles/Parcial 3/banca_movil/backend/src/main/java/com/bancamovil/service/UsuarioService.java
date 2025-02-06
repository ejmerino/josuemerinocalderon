package com.bancamovil.service;

import com.bancamovil.model.Usuario;
import com.bancamovil.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.Random;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    // Método para login
    public Usuario login(String username, String password) {
        Usuario usuario = usuarioRepository.findByUsername(username);
        if (usuario != null && usuario.getPassword().equals(password)) {
            return usuario; // Login exitoso
        } else {
            throw new RuntimeException("Usuario o contraseña incorrectos");
        }
    }



    // Método para generar un número de cuenta único
    public String generarNumeroCuentaUnico() {
        Random random = new Random();
        String numero;
        do {
            numero = String.format("%010d", random.nextInt(1_000_000_000));
        } while (usuarioRepository.existsByNumeroCuenta(numero));
        return numero;
    }

    // Método para registrar un usuario
    public Usuario registrarUsuario(Usuario usuario) {
        usuario.setNumeroCuenta(generarNumeroCuentaUnico());
        return usuarioRepository.save(usuario);
    }

    // Método para obtener todos los usuarios (añadido)
    public List<Usuario> obtenerUsuarios() {
        return usuarioRepository.findAll();  // Devuelve todos los usuarios
    }

    public Optional<Usuario> obtenerUsuarioPorNumeroCuenta(String numeroCuenta) {
        return usuarioRepository.findByNumeroCuenta(numeroCuenta);
    }

}
