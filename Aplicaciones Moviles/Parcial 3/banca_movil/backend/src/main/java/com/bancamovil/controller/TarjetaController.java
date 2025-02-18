package com.bancamovil.controller;// TarjetaController.java

import com.bancamovil.model.Tarjeta;
import com.bancamovil.model.Usuario;
import com.bancamovil.service.TarjetaService;
import com.bancamovil.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Random;

@RestController
@RequestMapping("/tarjetas")
@CrossOrigin(origins = "*")
public class TarjetaController {

    @Autowired
    private TarjetaService tarjetaService;

    @Autowired
    private UsuarioService usuarioService;

    @PostMapping("/agregar")
    public ResponseEntity<?> agregarTarjeta(@RequestBody Map<String, Object> payload) {
        Long usuarioId = ((Number) payload.get("usuarioId")).longValue();
        String tipo = (String) payload.get("tipo");
        String marca = (String) payload.get("marca");

        try {
            Usuario usuario = usuarioService.obtenerUsuario(usuarioId);

            if ("credito".equals(tipo) && usuario.getSaldoDisponible() < 250) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Saldo insuficiente para tarjeta de crédito");
            }

            String numero = generarNumeroTarjeta();
            String mesExpiracion = generarMesExpiracion();
            String anioExpiracion = generarAnioExpiracion();
            String cvv = generarCvv();

            Tarjeta tarjeta = new Tarjeta();
            tarjeta.setUsuario(usuario);
            tarjeta.setNumero(numero);
            tarjeta.setMesExpiracion(mesExpiracion);
            tarjeta.setAnioExpiracion(anioExpiracion);
            tarjeta.setCvv(cvv);
            tarjeta.setEstado(true);

            if ("debito".equals(tipo)) {
                // Todas las tarjetas de débito serán Visa
                // No necesitas una variable separada para la marca en este caso
            } else {
                // Todas las tarjetas de crédito serán MasterCard
                // No necesitas una variable separada para la marca en este caso
            }

            Tarjeta nuevaTarjeta = tarjetaService.agregarTarjeta(tarjeta);
            return ResponseEntity.ok(nuevaTarjeta);

        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Usuario no encontrado");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error interno del servidor");
        }
    }

    @GetMapping("/usuario/{usuarioId}")
    public ResponseEntity<?> obtenerTarjetas(@PathVariable Long usuarioId) {
        try {
            List<Tarjeta> tarjetas = tarjetaService.obtenerTarjetasPorUsuario(usuarioId);
            return ResponseEntity.ok(tarjetas);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Usuario no encontrado");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error interno del servidor");
        }
    }

    @PostMapping("/congelar/{tarjetaId}")
    public ResponseEntity<?> congelarTarjeta(@PathVariable Long tarjetaId) {
        try {
            Tarjeta tarjeta = tarjetaService.congelarTarjeta(tarjetaId);
            return ResponseEntity.ok(tarjeta);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Tarjeta no encontrada");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error interno del servidor");
        }
    }

    @PostMapping("/descongelar/{tarjetaId}")
    public ResponseEntity<?> descongelarTarjeta(@PathVariable Long tarjetaId) {
        try {
            Tarjeta tarjeta = tarjetaService.descongelarTarjeta(tarjetaId);
            return ResponseEntity.ok(tarjeta);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Tarjeta no encontrada");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error interno del servidor");
        }
    }

    private String generarNumeroTarjeta() {
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 16; i++) {
            sb.append(random.nextInt(10));
        }
        return sb.toString();
    }

    private String generarMesExpiracion() {
        Random random = new Random();
        int mes = random.nextInt(12) + 1;
        return String.format("%02d", mes);
    }

    private String generarAnioExpiracion() {
        Random random = new Random();
        int anio = random.nextInt(10) + 2024;
        return String.valueOf(anio);
    }

    private String generarCvv() {
        Random random = new Random();
        int cvv = random.nextInt(900) + 100;
        return String.valueOf(cvv);
    }
}