package com.bancamovil.controller;

import com.bancamovil.model.*;
import com.bancamovil.service.*;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/users")
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/register")
    public ResponseEntity<User> registerUser(@RequestBody User user) {
        return ResponseEntity.ok(userService.registerUser(user));
    }

    @GetMapping("/{id}")
    public ResponseEntity<User> getUserById(@PathVariable Long id) {
        return ResponseEntity.ok(userService.getUserById(id));
    }

    @PostMapping("/{id}/cards")
    public ResponseEntity<Card> addCard(@PathVariable Long id, @RequestBody Card card) {
        return ResponseEntity.ok(userService.addCard(id, card));
    }

    @PostMapping("/{id}/payments")
    public ResponseEntity<Payment> makePayment(@PathVariable Long id, @RequestBody Payment payment) {
        return ResponseEntity.ok(userService.makePayment(id, payment));
    }

    @GetMapping("/{id}/notifications")
    public ResponseEntity<List<Notification>> getUserNotifications(@PathVariable Long id) {
        return ResponseEntity.ok(userService.getUserNotifications(id));
    }
}