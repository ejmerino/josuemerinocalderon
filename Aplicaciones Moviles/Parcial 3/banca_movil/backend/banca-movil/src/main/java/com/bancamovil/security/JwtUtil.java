package com.bancamovil.security;

import io.jsonwebtoken.*;
import java.util.Date;
import java.util.Map;

public class JwtUtil {

    private static final String SECRET_KEY = "moviles1234";  // Cambiar por una clave segura

    // Método para generar el JWT
    public static String generateToken(String username) {
        return Jwts.builder()
                .setSubject(username)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + 86400000)) // Expira en 24 horas
                .signWith(SignatureAlgorithm.HS256, SECRET_KEY)
                .compact();
    }

    // Método para validar el JWT
    public static Claims extractClaims(String token) {
        return Jwts.parser()
                .setSigningKey(SECRET_KEY)
                .parseClaimsJws(token)
                .getBody();
    }

    // Método para verificar la validez del token
    public static boolean isTokenExpired(String token) {
        return extractClaims(token).getExpiration().before(new Date());
    }

    // Método para extraer el nombre de usuario desde el token
    public static String extractUsername(String token) {
        return extractClaims(token).getSubject();
    }

    // Método para validar el JWT
    public static boolean validateToken(String token, String username) {
        return (username.equals(extractUsername(token)) && !isTokenExpired(token));
    }
}
