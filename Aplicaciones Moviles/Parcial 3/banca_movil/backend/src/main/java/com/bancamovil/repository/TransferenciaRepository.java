package com.bancamovil.repository;

import com.bancamovil.model.Transferencia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TransferenciaRepository extends JpaRepository<Transferencia, Long> {

    List<Transferencia> findByEmisorId(Long emisorId); // Devuelve las transferencias de un emisor específico
}
