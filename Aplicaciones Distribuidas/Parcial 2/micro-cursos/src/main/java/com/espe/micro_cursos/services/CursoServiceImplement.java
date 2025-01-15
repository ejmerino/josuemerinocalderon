package com.espe.micro_cursos.services;

import com.espe.micro_cursos.clients.UsuarioClientRest;
import com.espe.micro_cursos.model.Usuario;
import com.espe.micro_cursos.model.entities.Curso;
import com.espe.micro_cursos.model.entities.CursoUsuario;
import com.espe.micro_cursos.repositories.CursoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.text.html.Option;
import java.util.List;
import java.util.Optional;


@Service
public class CursoServiceImplement implements CursoService{
    @Autowired
    private CursoRepository repository;

    @Autowired
    private UsuarioClientRest clientRest;

    @Override
    public List<Curso> findAll() {return (List<Curso>) repository.findAll();}

    @Override
    public Optional<Curso> findById(Long id) {return repository.findById(id);}

    @Override
    public Curso save(Curso curso) {
        return repository.save(curso);
    }

    @Override
    public void deleteById(Long id) {
        repository.deleteById(id);
    }

    @Override
    public Optional<Usuario> addUser(Usuario usuario, Long id) {
        Optional<Curso> optional = repository.findById(id);
        if(optional.isPresent()){
            Usuario usuarioTemp = clientRest.findById(usuario.getId());

            Curso curso = optional.get();
            CursoUsuario cursoUsuario = new CursoUsuario();

            cursoUsuario.setUsuarioId(usuarioTemp.getId());

            curso.addCursoUsuario(cursoUsuario);
            repository.save(curso);
            return Optional.of(usuarioTemp);
        }
        return Optional.empty();
    }
}
