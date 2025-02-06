package com.bancamovil.service;

import com.bancamovil.model.Tarjeta;
import com.bancamovil.repository.TarjetaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TarjetaService {

    @Autowired
    private TarjetaRepository tarjetaRepository;

    // Crear una tarjeta
    public Tarjeta agregarTarjeta(Tarjeta tarjeta) {
        return tarjetaRepository.save(tarjeta);
    }

    // Obtener todas las tarjetas
    public List<Tarjeta> obtenerTodasLasTarjetas() {
        return tarjetaRepository.findAll(); // Retorna todas las tarjetas almacenadas
    }

    // Obtener tarjetas de un usuario
    public List<Tarjeta> obtenerTarjetasPorUsuario(Long usuarioId) {
        return tarjetaRepository.findByUsuarioId(usuarioId);
    }

    // Congelar tarjeta (estado = false)
    public Tarjeta congelarTarjeta(Long tarjetaId) {
        Tarjeta tarjeta = tarjetaRepository.findById(tarjetaId).orElseThrow(() -> new RuntimeException("Tarjeta no encontrada"));
        tarjeta.setEstado(false);  // Estado 'false' indica que la tarjeta está congelada
        return tarjetaRepository.save(tarjeta);
    }

    // Descongelar tarjeta (estado = true)
    public Tarjeta descongelarTarjeta(Long tarjetaId) {
        Tarjeta tarjeta = tarjetaRepository.findById(tarjetaId).orElseThrow(() -> new RuntimeException("Tarjeta no encontrada"));
        tarjeta.setEstado(true);  // Estado 'true' indica que la tarjeta está activa
        return tarjetaRepository.save(tarjeta);
    }
}
