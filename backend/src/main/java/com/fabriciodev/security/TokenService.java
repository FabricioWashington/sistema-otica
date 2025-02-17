package com.fabriciodev.security;

import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class TokenService {

    private final TokenFactoryService tokenFactoryService;

    public TokenService(TokenFactoryService tokenFactoryService) {
        this.tokenFactoryService = tokenFactoryService;
    }

    public String generateToken(Object entity) {
        return tokenFactoryService.generateToken(entity);
    }

    public Map<String, Object> validateToken(String token) {
        return tokenFactoryService.validateToken(token);
    }
}
