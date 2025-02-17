package com.bancamovil.controller;

import com.bancamovil.model.Transferencia;
import com.bancamovil.service.TransferenciaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/transferencias")
@CrossOrigin(origins = "*")
public class TransferenciaController {

    @Autowired
    private TransferenciaService transferenciaService;

    // Crear una transferencia
    @PostMapping("/realizar")
    public Transferencia realizarTransferencia(@RequestParam Long emisorId,
                                               @RequestParam String numeroCuentaDestino,
                                               @RequestParam Double monto,
                                               @RequestParam String motivo) {
        return transferenciaService.realizarTransferencia(emisorId, numeroCuentaDestino, monto, motivo);
    }


    // Obtener todas las transferencias
    @GetMapping
    public List<Transferencia> obtenerTransferencias() {
        return transferenciaService.obtenerTransferencias();
    }

    // Obtener transferencias por emisor
    @GetMapping("/emisor/{emisorId}")
    public List<Transferencia> obtenerTransferenciasPorEmisor(@PathVariable Long emisorId) {
        return transferenciaService.obtenerTransferenciasPorEmisor(emisorId);
    }
}
