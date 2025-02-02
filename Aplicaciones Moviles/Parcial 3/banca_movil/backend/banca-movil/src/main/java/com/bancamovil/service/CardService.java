package com.bancamovil.service;

import com.bancamovil.model.Card;
import com.bancamovil.repository.CardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CardService {

    @Autowired
    private CardRepository cardRepository;

    public Card addCard(Card card) {
        return cardRepository.save(card); // Agregar tarjeta
    }

    public void freezeCard(Long cardId) {
        Card card = cardRepository.findById(cardId).orElseThrow(() -> new RuntimeException("Card not found"));
        card.setFrozen(true);
        cardRepository.save(card); // Congelar tarjeta
    }

    // Otros métodos para eliminar, obtener tarjetas, etc.
}
