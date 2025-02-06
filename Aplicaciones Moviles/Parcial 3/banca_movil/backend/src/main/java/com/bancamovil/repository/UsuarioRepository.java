package com.bancamovil.repository;

import com.bancamovil.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
    boolean existsByNumeroCuenta(String numeroCuenta);
}
