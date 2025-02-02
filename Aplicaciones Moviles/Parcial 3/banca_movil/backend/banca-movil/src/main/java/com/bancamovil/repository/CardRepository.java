package com.bancamovil.repository;

import com.bancamovil.model.Card;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CardRepository extends JpaRepository<Card, Long> {
    // Aquí puedes añadir métodos personalizados si lo necesitas
}
