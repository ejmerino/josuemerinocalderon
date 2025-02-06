package com.bancamovil.service;

import com.bancamovil.model.Tarjeta;
import com.bancamovil.model.EstadoTarjeta;
import com.bancamovil.repository.TarjetaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TarjetaService {

    @Autowired
    private TarjetaRepository tarjetaRepository;

    public List<Tarjeta> obtenerTarjetasPorUsuario(Long usuarioId) {
        return tarjetaRepository.findByUsuarioId(usuarioId);
    }

    public Tarjeta agregarTarjeta(Tarjeta tarjeta) {
        tarjeta.setEstado(EstadoTarjeta.ACTIVA); // por defecto, la tarjeta se activa
        return tarjetaRepository.save(tarjeta);
    }

    public Tarjeta congelarTarjeta(Long tarjetaId) {
        Tarjeta tarjeta = tarjetaRepository.findById(tarjetaId).orElseThrow(() -> new RuntimeException("Tarjeta no encontrada"));
        tarjeta.setEstado(EstadoTarjeta.CONGELADA);
        return tarjetaRepository.save(tarjeta);
    }
}
