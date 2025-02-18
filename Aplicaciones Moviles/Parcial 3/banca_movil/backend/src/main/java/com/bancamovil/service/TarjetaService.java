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

    public Tarjeta agregarTarjeta(Tarjeta tarjeta) {
        return tarjetaRepository.save(tarjeta);
    }

    public void eliminarTarjeta(Long tarjetaId) {
        if (!tarjetaRepository.existsById(tarjetaId)) {
            throw new RuntimeException("Tarjeta no encontrada");
        }
        tarjetaRepository.deleteById(tarjetaId);
    }

    public List<Tarjeta> obtenerTodasLasTarjetas() {
        return tarjetaRepository.findAll();
    }

    public List<Tarjeta> obtenerTarjetasPorUsuario(Long usuarioId) {
        return tarjetaRepository.findByUsuarioId(usuarioId);
    }

    public Tarjeta congelarTarjeta(Long tarjetaId) {
        Tarjeta tarjeta = tarjetaRepository.findById(tarjetaId)
                .orElseThrow(() -> new RuntimeException("Tarjeta no encontrada"));
        tarjeta.setEstado(false);
        return tarjetaRepository.save(tarjeta);
    }

    public Tarjeta descongelarTarjeta(Long tarjetaId) {
        Tarjeta tarjeta = tarjetaRepository.findById(tarjetaId)
                .orElseThrow(() -> new RuntimeException("Tarjeta no encontrada"));
        tarjeta.setEstado(true);
        return tarjetaRepository.save(tarjeta);
    }
}