package com.bancamovil.controller;

import com.bancamovil.model.Notificacion;
import com.bancamovil.service.NotificacionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/notificaciones")
@CrossOrigin(origins = "*")
public class NotificacionController {

    @Autowired
    private NotificacionService notificacionService;

    // Obtener todas las notificaciones de un usuario
    @GetMapping("/usuario/{usuarioId}")
    public List<Notificacion> obtenerNotificacionesPorUsuario(@PathVariable Long usuarioId) {
        return notificacionService.obtenerNotificacionesPorUsuario(usuarioId);
    }

    // Crear una nueva notificación (esto podría ser automatizado, pero si lo necesitas manual)
    @PostMapping("/crear")
    public Notificacion crearNotificacion(@RequestBody Notificacion notificacion) {
        return notificacionService.crearNotificacion(notificacion);
    }
}
