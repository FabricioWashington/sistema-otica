package com.fabriciodev.security;

import java.util.Map;

public interface TokenServiceInterface {
    String generateToken(Object entity);
    Map<String, Object> validateToken(String token);
}
