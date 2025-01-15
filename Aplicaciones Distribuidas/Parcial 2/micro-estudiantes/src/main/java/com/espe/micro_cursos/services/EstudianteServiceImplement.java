package com.espe.micro_cursos.services;

import com.espe.micro_cursos.model.entity.Estudiante;
import com.espe.micro_cursos.repositories.EstudianteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class EstudianteServiceImplement implements EstudianteService {

    @Autowired
    private EstudianteRepository estudianteRepository;

    @Override
    public List<Estudiante> listarTodos() {
        return estudianteRepository.findAll();
    }

    @Override
    public Estudiante guardarEstudiante(Estudiante estudiante) {
        return estudianteRepository.save(estudiante);
    }

    @Override
    public Estudiante obtenerPorId(Long id) {
        return estudianteRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Estudiante no encontrado con ID: " + id));
    }

    @Override
    public void eliminarPorId(Long id) {
        if (!estudianteRepository.existsById(id)) {
            throw new RuntimeException("Estudiante no encontrado con ID: " + id);
        }
        estudianteRepository.deleteById(id);
    }

    @Override
    public Estudiante buscarPorEmail(String email) {
        return estudianteRepository.findByEmail(email);
    }

    @Override
    public List<Estudiante> buscarPorApellido(String apellido) {
        return estudianteRepository.findByApellido(apellido);
    }

    @Override
    public List<Estudiante> buscarPorFechaNacimientoPosterior(Date fecha) {
        return estudianteRepository.findByFechaNacimientoAfter(fecha);
    }

    @Override
    public List<Estudiante> buscarPorNombreContiene(String texto) {
        return estudianteRepository.findByNombreContaining(texto);
    }
}