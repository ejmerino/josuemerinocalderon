package com.bancamovil.controller;

import com.bancamovil.model.Tarjeta;
import com.bancamovil.service.TarjetaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/tarjetas")
public class TarjetaController {

    @Autowired
    private TarjetaService tarjetaService;

    @GetMapping("/usuario/{usuarioId}")
    public List<Tarjeta> obtenerTarjetas(@PathVariable Long usuarioId) {
        return tarjetaService.obtenerTarjetasPorUsuario(usuarioId);
    }

    @PostMapping("/agregar")
    public Tarjeta agregarTarjeta(@RequestBody Tarjeta tarjeta) {
        return tarjetaService.agregarTarjeta(tarjeta);
    }

    @PutMapping("/congelar/{tarjetaId}")
    public Tarjeta congelarTarjeta(@PathVariable Long tarjetaId) {
        return tarjetaService.congelarTarjeta(tarjetaId);
    }
}
