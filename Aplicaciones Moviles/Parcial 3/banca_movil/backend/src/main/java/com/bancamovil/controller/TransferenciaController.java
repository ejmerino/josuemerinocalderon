package com.bancamovil.controller;

import com.bancamovil.dto.TransferenciaRequest;
import com.bancamovil.model.Transferencia;
import com.bancamovil.service.TransferenciaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult; // Importa BindingResult
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid; // Importa la anotación Valid
import java.util.List;

@RestController
@RequestMapping("/transferencias")
@CrossOrigin(origins = "*")
public class TransferenciaController {

    @Autowired
    private TransferenciaService transferenciaService;

    @PostMapping("/realizar")
    public ResponseEntity<?> realizarTransferencia(@Valid @RequestBody TransferenciaRequest transferenciaRequest, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            // Si hay errores de validación, retorna una respuesta de error
            return new ResponseEntity<>(bindingResult.getAllErrors(), HttpStatus.BAD_REQUEST);
        }

        try {
            Transferencia transferencia = transferenciaService.realizarTransferencia(
                    transferenciaRequest.getNumeroCuentaEmisor(),
                    transferenciaRequest.getNumeroCuentaDestino(),
                    transferenciaRequest.getMonto(),
                    transferenciaRequest.getMotivo()
            );
            return new ResponseEntity<>(transferencia, HttpStatus.CREATED);
        } catch (RuntimeException e) {
            // Captura la excepción que lanza TransferenciaService si no se encuentra el emisor o el saldo es insuficiente
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST); // Devuelve un mensaje de error
        } catch (Exception e) {
            // Captura cualquier otra excepción inesperada
            System.err.println("Error inesperado al realizar la transferencia: " + e.getMessage());
            return new ResponseEntity<>("Error interno del servidor", HttpStatus.INTERNAL_SERVER_ERROR); // Devuelve un mensaje genérico
        }
    }

    @GetMapping
    public List<Transferencia> obtenerTransferencias() {
        return transferenciaService.obtenerTransferencias();
    }

    @GetMapping("/emisor/{emisorId}")
    public List<Transferencia> obtenerTransferenciasPorEmisor(@PathVariable Long emisorId) {
        return transferenciaService.obtenerTransferenciasPorEmisor(emisorId);
    }
}