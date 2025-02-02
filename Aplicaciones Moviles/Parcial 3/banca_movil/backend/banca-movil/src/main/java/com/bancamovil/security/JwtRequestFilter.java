package com.bancamovil.security;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.springframework.web.filter.OncePerRequestFilter;

public class JwtRequestFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws ServletException, IOException {

        // Aquí es donde manejarás el JWT en las peticiones
        String token = extractTokenFromRequest(request);

        // Aquí puedes hacer validaciones, como verificar la validez del token
        if (token != null && !token.isEmpty()) {
            // Lógica de validación del JWT y añadir el usuario a la seguridad
            // Es posible que quieras usar un filtro para autenticar la petición.
        }

        // Continúa la cadena de filtros
        chain.doFilter(request, response);
    }

    // Este es un método auxiliar para extraer el token desde la cabecera de la solicitud.
    private String extractTokenFromRequest(HttpServletRequest request) {
        String authorizationHeader = request.getHeader("Authorization");
        if (authorizationHeader != null && authorizationHeader.startsWith("Bearer ")) {
            return authorizationHeader.substring(7);  // Elimina "Bearer " de la cabecera
        }
        return null;
    }
}
