package com.fabriciodev.security;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.fabriciodev.model.empresa.Empresa;

@Service
public class TokenEmpresaService {

    @Value("${api.security.token.secret}")
    private String secret;

    public String generateToken(Empresa empresa) {
        try {
            Algorithm algorithm = Algorithm.HMAC256(secret);

            Map<String, Object> claims = new HashMap<>();
            claims.put("cnpj", empresa.getCnpj());
            claims.put("idEmpresa", empresa.getIdEmpresa());
            claims.put("role", "EMPRESA");

            return JWT.create()
                    .withIssuer("sistema-otica")
                    .withSubject(empresa.getCnpj())
                    .withPayload(claims)
                    .withExpiresAt(generateExpirationDate())
                    .sign(algorithm);
        } catch (JWTCreationException exception) {
            throw new RuntimeException("Erro ao gerar token JWT: " + exception.getMessage());
        }
    }

    public Map<String, Object> validateToken(String token) {
        try {
            token = token.replace("Bearer ", "").trim();

            Algorithm algorithm = Algorithm.HMAC256(secret);
            DecodedJWT decodedJWT = JWT.require(algorithm)
                    .withIssuer("sistema-otica")
                    .build()
                    .verify(token);

            Map<String, Object> userData = new HashMap<>();
            userData.put("cnpj", decodedJWT.getClaim("cnpj").asString());
            userData.put("idEmpresa", decodedJWT.getClaim("idEmpresa").asInt());
            userData.put("role", decodedJWT.getClaim("role").asString());

            // System.out.println("Token validado! Claims: " + userData);
            return userData;
        } catch (JWTVerificationException exception) {
            // System.out.println("Erro ao validar token: " + exception.getMessage());
            return null;
        }
    }

    public boolean isTokenEmpresa(String token) {
        Map<String, Object> claims = validateToken(token);
        // System.out.println("Claims do Token: " + claims);
        return claims != null && "EMPRESA".equals(claims.get("role"));
    }

    private Instant generateExpirationDate() {
        return LocalDateTime.now()
                .plusHours(2)
                .atZone(ZoneId.of("America/Sao_Paulo"))
                .toInstant();
    }
}
