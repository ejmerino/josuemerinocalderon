package com.espe.micro_cursos.services;

import com.espe.micro_cursos.model.Usuario;
import com.espe.micro_cursos.model.entities.Curso;

import java.util.List;
import java.util.Optional;

public interface CursoService {

    List<Curso> findAll();
    Optional<Curso> findById(Long id);
    Curso save(Curso curso);
    void deleteById(Long id);
    Optional<Usuario> addUser(Usuario usuario, Long id);
}
