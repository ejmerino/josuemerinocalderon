package com.bancamovil.service;

import com.bancamovil.model.Payment;
import com.bancamovil.model.Transaction;
import com.bancamovil.repository.PaymentRepository;
import com.bancamovil.repository.TransactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentService {

    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private TransactionRepository transactionRepository;

    // Realizar pago y generar transacción
    public Payment makePayment(Payment payment) {
        Payment savedPayment = paymentRepository.save(payment);

        // Crear transacción para este pago
        Transaction transaction = new Transaction();
        transaction.setAmount(payment.getAmount());
        transaction.setPayment(savedPayment);
        transactionRepository.save(transaction);

        return savedPayment;
    }
}
