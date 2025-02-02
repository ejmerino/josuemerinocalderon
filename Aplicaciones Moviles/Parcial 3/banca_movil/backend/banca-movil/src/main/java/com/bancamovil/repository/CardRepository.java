package com.bancamovil.repository;

import com.bancamovil.model.Card;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CardRepository extends JpaRepository<Card, Long> {

    List<Card> findByUserId(Long userId);
}
