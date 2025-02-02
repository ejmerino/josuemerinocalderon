package com.bancamovil.controller;

import com.bancamovil.model.Card;
import com.bancamovil.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/cards")
public class CardController {

    @Autowired
    private CardService cardService;

    @PostMapping("/add")
    public Card addCard(@RequestBody Card card) {
        return cardService.addCard(card); // Agregar tarjeta
    }

    @PostMapping("/freeze/{cardId}")
    public void freezeCard(@PathVariable Long cardId) {
        cardService.freezeCard(cardId); // Congelar tarjeta
    }
}
