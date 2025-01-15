package com.espe.micro_cursos.clients;

import com.espe.micro_cursos.model.Usuario;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name="micro-cursos",url = "localhost:8002/api/usuarios")
public interface UsuarioClientRest {
    @GetMapping("/{id}")
    Usuario findById(@PathVariable Long id);
}
