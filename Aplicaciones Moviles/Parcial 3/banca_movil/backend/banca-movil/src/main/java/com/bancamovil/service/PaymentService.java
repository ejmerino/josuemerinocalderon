package com.bancamovil.service;

import com.bancamovil.model.Payment;
import com.bancamovil.repository.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentService {

    @Autowired
    private PaymentRepository paymentRepository;

    public Payment createPayment(Payment payment) {
        return paymentRepository.save(payment); // Crear pago
    }

    // Otros métodos para procesar pagos, obtener pagos, etc.
}
