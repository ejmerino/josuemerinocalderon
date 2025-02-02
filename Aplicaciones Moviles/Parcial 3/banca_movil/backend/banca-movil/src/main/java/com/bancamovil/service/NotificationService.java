package com.bancamovil.service;

import com.bancamovil.model.Notification;
import com.bancamovil.repository.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NotificationService {

    @Autowired
    private NotificationRepository notificationRepository;

    public Notification createNotification(Notification notification) {
        return notificationRepository.save(notification); // Crear notificación
    }

    // Otros métodos para enviar alertas o consultar notificaciones
}
