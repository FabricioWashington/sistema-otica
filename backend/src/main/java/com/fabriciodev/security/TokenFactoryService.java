package com.fabriciodev.security;

import org.springframework.stereotype.Service;
import java.util.Map;

@Service
public class TokenFactoryService {

    private final TokenUsuarioService tokenUsuarioService;
    private final TokenEmpresaService tokenEmpresaService;

    public TokenFactoryService(TokenUsuarioService tokenUsuarioService, TokenEmpresaService tokenEmpresaService) {
        this.tokenUsuarioService = tokenUsuarioService;
        this.tokenEmpresaService = tokenEmpresaService;
    }

    public String generateToken(Object entity) {
        if (entity instanceof com.fabriciodev.model.login.Login) {
            return tokenUsuarioService.generateToken((com.fabriciodev.model.login.Login) entity);
        } else if (entity instanceof com.fabriciodev.model.empresa.Empresa) {
            return tokenEmpresaService.generateToken((com.fabriciodev.model.empresa.Empresa) entity);
        }
        throw new IllegalArgumentException("Entidade desconhecida para geração de token.");
    }

    public Map<String, Object> validateToken(String token) {
        Map<String, Object> claims = tokenUsuarioService.validateToken(token);
        
        if (claims == null) {
            claims = tokenEmpresaService.validateToken(token);
        }

        return claims;
    }
}
