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

    public Usuario login(String username, String password) {
        Usuario usuario = usuarioRepository.findByUsername(username);
        if (usuario != null && usuario.getPassword().equals(password)) {
            return usuario;
        } else {
            throw new RuntimeException("Usuario o contraseña incorrectos");
        }
    }

    public String generarNumeroCuentaUnico() {
        Random random = new Random();
        String numero;
        do {
            numero = String.format("%010d", (random.nextLong(9000000000L) + 1000000000L));
        } while (usuarioRepository.existsByNumeroCuenta(numero));
        return numero;
    }

    public Usuario registrarUsuario(Usuario usuario) {
        usuario.setNumeroCuenta(generarNumeroCuentaUnico());
        return usuarioRepository.save(usuario);
    }

    public List<Usuario> obtenerUsuarios() {
        return usuarioRepository.findAll();
    }

    public Usuario obtenerUsuario(Long usuarioId) {
        Optional<Usuario> usuarioOptional = usuarioRepository.findById(usuarioId);
        if (usuarioOptional.isPresent()) {
            return usuarioOptional.get();
        } else {
            throw new RuntimeException("Usuario no encontrado");
        }
    }

    public Optional<Usuario> obtenerUsuarioPorNumeroCuenta(String numeroCuenta) {
        return usuarioRepository.findByNumeroCuenta(numeroCuenta);
    }

    public void editarUsuario(String numeroCuenta, String email, String username, String password) {
        Usuario usuario = usuarioRepository.findByNumeroCuenta(numeroCuenta)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

        usuario.setEmail(email);
        usuario.setUsername(username);
        usuario.setPassword(password);

        usuarioRepository.save(usuario);
    }
}