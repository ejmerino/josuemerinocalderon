package com.bancamovil.service;

import com.bancamovil.model.EstadoTarjeta;
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

    // Obtener tarjetas de un usuario
    public List<Tarjeta> obtenerTarjetasPorUsuario(Long usuarioId) {
        return tarjetaRepository.findByUsuarioId(usuarioId);
    }

    // Congelar tarjeta
    public Tarjeta congelarTarjeta(Long tarjetaId) {
        Tarjeta tarjeta = tarjetaRepository.findById(tarjetaId).orElseThrow(() -> new RuntimeException("Tarjeta no encontrada"));
        tarjeta.setEstado(EstadoTarjeta.valueOf("congelada"));
        return tarjetaRepository.save(tarjeta);
    }
}
