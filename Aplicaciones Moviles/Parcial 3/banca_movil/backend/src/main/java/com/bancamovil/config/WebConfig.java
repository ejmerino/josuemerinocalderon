package com.bancamovil.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("http://localhost:3000", // Si estás usando localhost con puerto 3000 en React, por ejemplo
                        "http://10.0.2.2:8080", // Para emuladores de Android
                        "http://192.168.100.124:8080", // La IP local de tu computadora en la red
                        "http://localhost:8080")
                .allowedMethods("GET", "POST", "PUT", "DELETE")
                .allowedHeaders("*")
                .allowCredentials(true);  // Mantén esto si necesitas permitir credenciales
    }
}


