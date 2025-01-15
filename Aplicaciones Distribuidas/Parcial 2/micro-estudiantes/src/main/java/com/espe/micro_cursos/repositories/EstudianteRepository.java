package com.espe.micro_cursos.repositories;

import com.espe.micro_cursos.model.entity.Estudiante;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface EstudianteRepository extends JpaRepository<Estudiante, Long> {
    // Buscar estudiante por email
    Estudiante findByEmail(String email);

    // Buscar estudiantes por apellido
    List<Estudiante> findByApellido(String apellido);

    // Buscar estudiantes nacidos después de una fecha específica
    List<Estudiante> findByFechaNacimientoAfter(Date fecha);

    // Buscar estudiantes cuyo nombre contenga un texto específico
    List<Estudiante> findByNombreContaining(String texto);
}