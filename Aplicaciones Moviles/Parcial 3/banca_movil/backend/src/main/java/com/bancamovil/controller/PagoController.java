package com.bancamovil.controller;

import com.bancamovil.model.Pago;
import com.bancamovil.service.PagoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/pagos")
@CrossOrigin(origins = "*")
public class PagoController {

    @Autowired
    private PagoService pagoService;

    @PostMapping("/registrar")
    public Pago registrarPago(@RequestBody Pago pago) {
        return pagoService.registrarPago(pago);
    }
}
