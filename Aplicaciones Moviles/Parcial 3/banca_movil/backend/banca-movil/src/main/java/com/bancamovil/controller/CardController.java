package com.bancamovil.controller;

import com.bancamovil.model.Card;
import com.bancamovil.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/cards")
public class CardController {

    @Autowired
    private CardService cardService;

    // Agregar tarjeta
    @PostMapping("/add")
    public Card addCard(@RequestBody Card card) {
        return cardService.addCard(card);
    }

    // Congelar tarjeta
    @PostMapping("/freeze/{id}")
    public Card freezeCard(@PathVariable Long id) {
        return cardService.freezeCard(id);
    }

    // Obtener todas las tarjetas de un usuario
    @GetMapping("/user/{userId}")
    public List<Card> getCardsByUser(@PathVariable Long userId) {
        return cardService.getCardsByUser(userId);
    }
}
