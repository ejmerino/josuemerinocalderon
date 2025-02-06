package com.bancamovil.service;

import com.bancamovil.model.Pago;
import com.bancamovil.repository.PagoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PagoService {

    @Autowired
    private PagoRepository pagoRepository;


    public Pago registrarPago(Pago pago) {
        // Lógica para registrar el pago
        return pagoRepository.save(pago);
    }
}
