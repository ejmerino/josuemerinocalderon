package com.espe.micro_cursos.controllers;

import com.espe.micro_cursos.model.entity.Estudiante;
import com.espe.micro_cursos.services.EstudianteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/estudiantes")
public class EstudianteController {

    @Autowired
    private EstudianteService estudianteService;

    /**
     * Endpoint para listar todos los estudiantes.
     *
     * @return ResponseEntity con la lista de estudiantes y código HTTP 200
     */
    @GetMapping
    public ResponseEntity<Map<String, Object>> listarEstudiantes() {
        List<Estudiante> estudiantes = estudianteService.listarTodos();
        Map<String, Object> response = new HashMap<>();
        response.put("message", "Estudiantes obtenidos exitosamente.");
        response.put("data", estudiantes);
        return ResponseEntity.ok(response);
    }

    /**
     * Endpoint para obtener un estudiante por su ID.
     *
     * @param id ID del estudiante
     * @return ResponseEntity con el estudiante encontrado o código HTTP 404 si no existe
     */
    @GetMapping("/{id}")
    public ResponseEntity<Map<String, Object>> obtenerEstudiante(@PathVariable Long id) {
        Map<String, Object> response = new HashMap<>();
        try {
            Estudiante estudiante = estudianteService.obtenerPorId(id);
            response.put("message", "Estudiante encontrado exitosamente.");
            response.put("data", estudiante);
            return ResponseEntity.ok(response);
        } catch (RuntimeException e) {
            response.put("message", "Estudiante no encontrado con ID: " + id);
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
    }

    /**
     * Endpoint para crear un nuevo estudiante.
     *
     * @param estudiante Objeto Estudiante enviado en el cuerpo de la solicitud
     * @return ResponseEntity con el estudiante creado y código HTTP 201
     */
    @PostMapping
    public ResponseEntity<Map<String, Object>> crearEstudiante(@RequestBody Estudiante estudiante) {
        Estudiante estudianteCreado = estudianteService.guardarEstudiante(estudiante);
        Map<String, Object> response = new HashMap<>();
        response.put("message", "Estudiante creado exitosamente.");
        response.put("data", estudianteCreado);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    /**
     * Endpoint para actualizar un estudiante existente.
     *
     * @param id ID del estudiante a actualizar
     * @param estudiante Objeto Estudiante con los datos actualizados
     * @return ResponseEntity con el estudiante actualizado o código HTTP 404 si no existe
     */
    @PutMapping("/{id}")
    public ResponseEntity<Map<String, Object>> actualizarEstudiante(@PathVariable Long id, @RequestBody Estudiante estudiante) {
        Map<String, Object> response = new HashMap<>();
        try {
            Estudiante estudianteExistente = estudianteService.obtenerPorId(id);
            estudianteExistente.setNombre(estudiante.getNombre());
            estudianteExistente.setApellido(estudiante.getApellido());
            estudianteExistente.setEmail(estudiante.getEmail());
            estudianteExistente.setFechaNacimiento(estudiante.getFechaNacimiento());
            estudianteExistente.setTelefono(estudiante.getTelefono());
            Estudiante estudianteActualizado = estudianteService.guardarEstudiante(estudianteExistente);
            response.put("message", "Estudiante actualizado exitosamente.");
            response.put("data", estudianteActualizado);
            return ResponseEntity.ok(response);
        } catch (RuntimeException e) {
            response.put("message", "Estudiante no encontrado con ID: " + id);
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
    }

    /**
     * Endpoint para eliminar un estudiante por su ID.
     *
     * @param id ID del estudiante a eliminar
     * @return ResponseEntity con mensaje de eliminación o código HTTP 404 si no existe
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Map<String, Object>> eliminarEstudiante(@PathVariable Long id) {
        Map<String, Object> response = new HashMap<>();
        try {
            estudianteService.eliminarPorId(id);
            response.put("message", "Estudiante eliminado exitosamente.");
            return ResponseEntity.ok(response);
        } catch (RuntimeException e) {
            response.put("message", "Estudiante no encontrado con ID: " + id);
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
    }
}