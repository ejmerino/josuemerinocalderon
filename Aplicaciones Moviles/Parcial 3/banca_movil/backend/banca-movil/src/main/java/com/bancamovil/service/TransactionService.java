package com.bancamovil.service;

import com.bancamovil.model.Transaction;
import com.bancamovil.repository.TransactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TransactionService {

    @Autowired
    private TransactionRepository transactionRepository;

    public Transaction createTransaction(Transaction transaction) {
        return transactionRepository.save(transaction); // Crear transacción
    }

    // Métodos para obtener transacciones si es necesario
}
