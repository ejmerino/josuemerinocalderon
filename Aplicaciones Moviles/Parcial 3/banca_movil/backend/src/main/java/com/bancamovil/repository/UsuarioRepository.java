package com.bancamovil.repository;

import com.bancamovil.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
    Usuario findByNumeroCuenta(String numeroCuenta);
    Usuario findByUsername(String username);
    boolean existsByNumeroCuenta(String numero);
}
