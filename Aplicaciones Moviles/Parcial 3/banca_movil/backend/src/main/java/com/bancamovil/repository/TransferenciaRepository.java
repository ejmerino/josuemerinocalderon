package com.bancamovil.repository;

import com.bancamovil.model.Transferencia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TransferenciaRepository extends JpaRepository<Transferencia, Long> {
    // Cambié esto para que coincida con las propiedades correctas
    Optional<Transferencia> findByNumeroCuentaEmisor(String numeroCuentaEmisor);
    Optional<Transferencia> findByNumeroCuentaDestino(String numeroCuentaDestino);
    List<Transferencia> findByEmisorId(Long emisorId);
}
