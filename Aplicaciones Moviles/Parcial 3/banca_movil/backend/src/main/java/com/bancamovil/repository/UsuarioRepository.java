package com.bancamovil.repository;

import com.bancamovil.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
    Optional<Usuario> findByNumeroCuenta(String numeroCuenta);
    Usuario findByUsername(String username);
    boolean existsByNumeroCuenta(String numero);
}