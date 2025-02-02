package com.bancamovil.controller;

import com.bancamovil.model.Payment;
import com.bancamovil.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/payments")
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    // Realizar pago
    @PostMapping("/make")
    public Payment makePayment(@RequestBody Payment payment) {
        return paymentService.makePayment(payment);
    }
}
