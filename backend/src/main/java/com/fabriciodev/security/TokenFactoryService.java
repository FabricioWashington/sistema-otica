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
        try {
            // System.out.println("Token recebido para validação: " + token);

            Map<String, Object> claims = tokenUsuarioService.validateToken(token);
            if (claims != null && "USUARIO".equals(claims.get("role"))) {
                System.out.println("Token validado como USUARIO: " + claims);
                return claims;
            }

            claims = tokenEmpresaService.validateToken(token);
            if (claims != null && "EMPRESA".equals(claims.get("role"))) {
                // System.out.println("Token validado como EMPRESA: " + claims);
                return claims;
            }

            // System.out.println("Erro: Token não corresponde a nenhum tipo válido.");
            throw new RuntimeException("Token inválido ou tipo desconhecido.");
        } catch (Exception e) {
            // System.out.println("Erro ao validar token: " + e.getMessage());
            throw new RuntimeException("Erro ao validar token: " + e.getMessage());
        }
    }

}
