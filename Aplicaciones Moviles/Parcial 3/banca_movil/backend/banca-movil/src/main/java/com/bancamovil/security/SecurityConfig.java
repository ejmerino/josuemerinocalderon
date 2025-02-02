package com.bancamovil.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    // Configuración de seguridad con la nueva API de Spring Security 6.1
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(authorizeRequests ->
                        authorizeRequests
                                .requestMatchers("/login", "/register").permitAll()  // Rutas públicas
                                .anyRequest().authenticated()  // Cualquier otra ruta requiere autenticación
                )
                .formLogin(form -> form
                        .loginPage("/login")
                        .permitAll()  // Permite el acceso a la página de login
                )
                .logout(logout -> logout
                        .permitAll()  // Permite el acceso a la página de logout
                )
                .csrf(csrf -> csrf.disable());  // Desactiva CSRF para simplificar (ajustar según necesidades)

        return http.build();  // Es necesario para construir la configuración final
    }

    // Bean para configurar el AuthenticationManager
    @Bean
    public AuthenticationManager authenticationManager(HttpSecurity http) throws Exception {
        AuthenticationManagerBuilder authenticationManagerBuilder =
                http.getSharedObject(AuthenticationManagerBuilder.class);
        authenticationManagerBuilder.inMemoryAuthentication()
                .withUser("user").password("{noop}password").roles("USER");
        return authenticationManagerBuilder.build();
    }
}
