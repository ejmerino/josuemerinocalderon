package com.bancamovil.service;

import com.bancamovil.model.User;
import com.bancamovil.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    // Registrar usuario
    public User registerUser(User user) {
        return userRepository.save(user);
    }

    // Iniciar sesión (con credenciales básicas)
    public User loginUser(String email, String password) {
        return userRepository.findByEmailAndPassword(email, password).orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
    }
}
