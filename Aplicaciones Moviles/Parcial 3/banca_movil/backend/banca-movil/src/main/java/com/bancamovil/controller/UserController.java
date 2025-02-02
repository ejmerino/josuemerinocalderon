package com.bancamovil.controller;

import com.bancamovil.model.User;
import com.bancamovil.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    // Registrar un nuevo usuario
    @PostMapping("/register")
    public User registerUser(@RequestBody User user) {
        return userService.registerUser(user);
    }

    // Iniciar sesión (Por simplicidad no se implementa autenticación real aquí)
    @PostMapping("/login")
    public User loginUser(@RequestParam String email, @RequestParam String password) {
        return userService.loginUser(email, password);
    }
}
