package com.bancamovil.controller;

import com.bancamovil.model.Transferencia;
import com.bancamovil.service.TransferenciaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/transferencias")
public class TransferenciaController {

    @Autowired
    private TransferenciaService transferenciaService;

    // Crear una transferencia
    @PostMapping("/realizar")
    public Transferencia realizarTransferencia(@RequestParam Long emisorId,
                                               @RequestParam String numeroCuentaDestino,
                                               @RequestParam Double monto) {
        return transferenciaService.realizarTransferencia(emisorId, numeroCuentaDestino, monto);
    }
}
