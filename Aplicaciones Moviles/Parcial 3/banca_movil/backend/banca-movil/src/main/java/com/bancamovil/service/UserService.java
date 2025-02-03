package com.bancamovil.service;

import com.bancamovil.model.*;
import com.bancamovil.repository.*;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final CardRepository cardRepository;
    private final PaymentRepository paymentRepository;
    private final NotificationRepository notificationRepository;

    public UserService(UserRepository userRepository, CardRepository cardRepository,
                       PaymentRepository paymentRepository, NotificationRepository notificationRepository) {
        this.userRepository = userRepository;
        this.cardRepository = cardRepository;
        this.paymentRepository = paymentRepository;
        this.notificationRepository = notificationRepository;
    }

    public User registerUser(User user) {
        return userRepository.save(user);
    }

    public User getUserById(Long id) {
        return userRepository.findById(id).orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
    }

    public Card addCard(Long userId, Card card) {
        User user = getUserById(userId);
        card.setUser(user);
        return cardRepository.save(card);
    }

    public Payment makePayment(Long userId, Payment payment) {
        User user = getUserById(userId);
        payment.setUser(user);
        Payment savedPayment = paymentRepository.save(payment);

        Transaction transaction = new Transaction();
        transaction.setPayment(savedPayment);
        transaction.setStatus("Completed");

        Notification notification = new Notification();
        notification.setUser(user);
        notification.setMessage("Pago realizado por " + payment.getAmount());
        notificationRepository.save(notification);

        return savedPayment;
    }

    public List<Notification> getUserNotifications(Long userId) {
        return notificationRepository.findByUserId(userId);
    }
}