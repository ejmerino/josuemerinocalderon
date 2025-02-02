package com.bancamovil.service;

import com.bancamovil.model.User;
import com.bancamovil.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public User createUser(User user) {
        return userRepository.save(user); // Guardar usuario en DB
    }

    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email); // Buscar usuario por email
    }

    // Otras funcionalidades como actualizar, eliminar, etc.
}
