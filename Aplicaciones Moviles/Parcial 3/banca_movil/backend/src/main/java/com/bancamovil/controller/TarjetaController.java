package com.bancamovil.controller;

import com.bancamovil.model.Tarjeta;
import com.bancamovil.service.TarjetaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/tarjetas")
@CrossOrigin(origins = "*")
public class TarjetaController {

    @Autowired
    private TarjetaService tarjetaService;

    // Crear una nueva tarjeta
    @PostMapping("/agregar")
    public Tarjeta agregarTarjeta(@RequestBody Tarjeta tarjeta) {
        return tarjetaService.agregarTarjeta(tarjeta);
    }

    @GetMapping
    public List<Tarjeta> obtenerTodasLasTarjetas() {
        return tarjetaService.obtenerTodasLasTarjetas();
    }

    // Listar todas las tarjetas de un usuario
    @GetMapping("/usuario/{usuarioId}")
    public List<Tarjeta> obtenerTarjetas(@PathVariable Long usuarioId) {
        return tarjetaService.obtenerTarjetasPorUsuario(usuarioId);
    }

    // Congelar una tarjeta
    @PostMapping("/congelar/{tarjetaId}")
    public Tarjeta congelarTarjeta(@PathVariable Long tarjetaId) {
        return tarjetaService.congelarTarjeta(tarjetaId);
    }
    // Descongelar una tarjeta
    @PostMapping("/descongelar/{tarjetaId}")
    public Tarjeta descongelarTarjeta(@PathVariable Long tarjetaId) {
        return tarjetaService.descongelarTarjeta(tarjetaId);
    }
}
