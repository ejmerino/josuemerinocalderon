package com.bancamovil.service;

import com.bancamovil.model.Card;
import com.bancamovil.repository.CardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CardService {

    @Autowired
    private CardRepository cardRepository;

    // Agregar tarjeta
    public Card addCard(Card card) {
        return cardRepository.save(card);
    }

    // Congelar tarjeta
    public Card freezeCard(Long id) {
        Card card = cardRepository.findById(id).orElseThrow(() -> new RuntimeException("Tarjeta no encontrada"));
        card.setFrozen(true);
        return cardRepository.save(card);
    }

    // Obtener tarjetas de un usuario
    public List<Card> getCardsByUser(Long userId) {
        return cardRepository.findByUserId(userId);
    }
}
