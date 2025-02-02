package com.bancamovil.controller;

import com.bancamovil.model.Notification;
import com.bancamovil.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/notifications")
public class NotificationController {

    @Autowired
    private NotificationService notificationService;

    // Crear notificación
    @PostMapping("/create")
    public Notification createNotification(@RequestBody Notification notification) {
        return notificationService.createNotification(notification);
    }
}
