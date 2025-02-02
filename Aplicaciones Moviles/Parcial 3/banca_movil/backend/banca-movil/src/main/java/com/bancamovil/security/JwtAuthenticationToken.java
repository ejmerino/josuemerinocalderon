package com.bancamovil.security;

import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.util.Collections;

public class JwtAuthenticationToken extends AbstractAuthenticationToken {

    private final String token;

    public JwtAuthenticationToken(String token) {
        super(Collections.singletonList(new SimpleGrantedAuthority("USER")));  // Ajusta el rol
        this.token = token;
        setAuthenticated(true);
    }

    public String getToken() {
        return token;
    }

    @Override
    public Object getCredentials() {
        return token;
    }

    @Override
    public Object getPrincipal() {
        return "user";  // Aquí puedes obtener el nombre de usuario del JWT
    }
}
