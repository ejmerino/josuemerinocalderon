package com.bancamovil.service;

import com.bancamovil.model.Transferencia;
import com.bancamovil.model.Usuario;
import com.bancamovil.repository.TransferenciaRepository;
import com.bancamovil.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TransferenciaService {

    @Autowired
    private TransferenciaRepository transferenciaRepository;

    @Autowired
    private UsuarioRepository usuarioRepository;

    // Realizar transferencia
    public Transferencia realizarTransferencia(Long emisorId, String numeroCuentaDestino, Double monto) {
        // Verificar que el emisor existe y tiene saldo suficiente
        Usuario emisor = usuarioRepository.findById(emisorId).orElseThrow(() -> new RuntimeException("Emisor no encontrado"));
        if (emisor.getSaldoDisponible() < monto) {
            throw new RuntimeException("Saldo insuficiente en la cuenta del emisor");
        }

        // Verificar que la cuenta de destino existe
        Optional<Usuario> beneficiarioOpt = usuarioRepository.findByNumeroCuenta(numeroCuentaDestino);
        if (beneficiarioOpt.isEmpty()) {
            throw new RuntimeException("Número de cuenta de destino no encontrado");
        }
        Usuario beneficiario = beneficiarioOpt.get();

        // Realizar la transferencia (restar del emisor y sumar al beneficiario)
        emisor.setSaldoDisponible(emisor.getSaldoDisponible() - monto);
        beneficiario.setSaldoDisponible(beneficiario.getSaldoDisponible() + monto);

        // Guardar los cambios en la base de datos
        usuarioRepository.save(emisor);
        usuarioRepository.save(beneficiario);

        // Registrar la transferencia
        Transferencia transferencia = new Transferencia();
        transferencia.setEmisor(emisor);
        transferencia.setBeneficiario(beneficiario);
        transferencia.setMonto(monto);
        transferencia.setNumeroCuentaDestino(numeroCuentaDestino);

        return transferenciaRepository.save(transferencia);
    }

    // Obtener todas las transferencias
    public List<Transferencia> obtenerTransferencias() {
        return transferenciaRepository.findAll(); // Devuelve todas las transferencias
    }

    // Obtener transferencias por emisor
    public List<Transferencia> obtenerTransferenciasPorEmisor(Long emisorId) {
        return transferenciaRepository.findByEmisorId(emisorId); // Devuelve transferencias de un emisor específico
    }
}
