package com.bancamovil.repository;

import com.bancamovil.model.Notification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, Long> {
    // Métodos personalizados si es necesario
}
