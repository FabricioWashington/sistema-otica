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
import com.auth0.jwt.interfaces.DecodedJWT;
import com.fabriciodev.model.login.Login;

@Service
public class TokenUsuarioService implements TokenServiceInterface {

    @Value("${api.security.token.secret}")
    private String secret;

    @Override
    public String generateToken(Object entity) {
        Login login = (Login) entity;
        Algorithm algorithm = Algorithm.HMAC256(secret);

        Map<String, Object> claims = new HashMap<>();
        claims.put("loginUsuario", login.getLoginUsuario());
        claims.put("idTiposLogin", login.getTiposLogin().getId());
        claims.put("idEmpresa", login.getIdEmpresa());

        return JWT.create()
                .withIssuer("sistema-otica")
                .withSubject(login.getLoginUsuario())
                .withPayload(claims)
                .withExpiresAt(generateExpirationDate())
                .sign(algorithm);
    }

    @Override
    public Map<String, Object> validateToken(String token) {
        Algorithm algorithm = Algorithm.HMAC256(secret);
        DecodedJWT decodedJWT = JWT.require(algorithm)
                .withIssuer("sistema-otica")
                .build()
                .verify(token);

        Map<String, Object> claims = new HashMap<>();
        claims.put("loginUsuario", decodedJWT.getClaim("loginUsuario").asString());
        claims.put("idTiposLogin", decodedJWT.getClaim("idTiposLogin").asLong());
        claims.put("idEmpresa", decodedJWT.getClaim("idEmpresa").asInt());

        return claims;
    }

    private Instant generateExpirationDate() {
        return LocalDateTime.now()
                .plusHours(2)
                .atZone(ZoneId.of("America/Sao_Paulo"))
                .toInstant();
    }
}
