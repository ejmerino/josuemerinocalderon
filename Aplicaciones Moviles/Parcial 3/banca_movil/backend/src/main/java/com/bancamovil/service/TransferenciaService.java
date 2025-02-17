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

    // Realizar la transferencia
    public Transferencia realizarTransferencia(String numeroCuentaEmisor,
                                               String numeroCuentaDestino,
                                               Double monto,
                                               String motivo) {
        // Verificar que el emisor existe y tiene saldo suficiente
        Usuario emisor = usuarioRepository.findByNumeroCuenta(numeroCuentaEmisor)
                .orElseThrow(() -> new RuntimeException("Emisor no encontrado"));
        if (emisor.getSaldoDisponible() < monto) {
            throw new RuntimeException("Saldo insuficiente en la cuenta del emisor");
        }

        // Verificar que la cuenta de destino existe
        Usuario beneficiario = usuarioRepository.findByNumeroCuenta(numeroCuentaDestino)
                .orElseThrow(() -> new RuntimeException("Número de cuenta de destino no encontrado"));

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
        transferencia.setNumeroCuentaEmisor(numeroCuentaEmisor);
        transferencia.setNumeroCuentaDestino(numeroCuentaDestino);
        transferencia.setMotivo(motivo);

        return transferenciaRepository.save(transferencia);
    }

    public List<Transferencia> obtenerTransferencias() {
        return transferenciaRepository.findAll();
    }

    public List<Transferencia> obtenerTransferenciasPorEmisor(Long emisorId) {
        return transferenciaRepository.findByEmisorId(emisorId);
    }
}
