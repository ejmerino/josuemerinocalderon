package com.espe.micro_cursos.services;

import com.espe.micro_cursos.model.entity.Estudiante;

import java.util.Date;
import java.util.List;

public interface EstudianteService {
    // Método para listar todos los estudiantes
    List<Estudiante> listarTodos();

    // Método para guardar un estudiante
    Estudiante guardarEstudiante(Estudiante estudiante);

    // Método para obtener un estudiante por su ID
    Estudiante obtenerPorId(Long id);

    // Método para eliminar un estudiante por su ID
    void eliminarPorId(Long id);

    // Métodos adicionales para búsquedas personalizadas
    Estudiante buscarPorEmail(String email);

    List<Estudiante> buscarPorApellido(String apellido);

    List<Estudiante> buscarPorFechaNacimientoPosterior(Date fecha);

    List<Estudiante> buscarPorNombreContiene(String texto);
}