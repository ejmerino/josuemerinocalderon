package com.bancamovil.service;

import com.bancamovil.model.Notification;
import com.bancamovil.repository.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NotificationService {

    @Autowired
    private NotificationRepository notificationRepository;

    // Crear notificación
    public Notification createNotification(Notification appNotification) {
        return notificationRepository.save(appNotification);
    }
}
