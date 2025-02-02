package com.bancamovil.repository;

import com.bancamovil.model.Payment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Long> {
    // Métodos personalizados si es necesario
}
