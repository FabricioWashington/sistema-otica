package com.fabriciodev.components;

import com.fabriciodev.security.TokenEmpresaService;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Cookie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

@RestController
@RequestMapping("/api")
public abstract class BaseApiController {

    @Autowired
    private TokenEmpresaService tokenEmpresaService;

    @ModelAttribute
    public void beforeAction(HttpServletResponse response, HttpServletRequest request) {
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Headers",
                "X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Authorization, Cache-Control, Pragma");
        response.setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");

        if ("OPTIONS".equalsIgnoreCase(request.getMethod())) {
            response.setStatus(HttpServletResponse.SC_OK);
        }
    }

    public String getAuthorization(HttpServletRequest request) {
        String authHeader = request.getHeader("Authorization");
        if (authHeader == null || authHeader.isEmpty()) {
            throw new RuntimeException("Token não informado!");
        }
        return authHeader;
    }

    public <T> T toObject(Map<String, Object> data, Class<T> clazz) {
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.convertValue(data, clazz);
    }

    public boolean isAuthorized(HttpServletRequest request) {
        String token = request.getHeader("Authorization");

        if (token == null || token.isEmpty()) {
            if (request.getCookies() != null) {
                for (Cookie cookie : request.getCookies()) {
                    if (cookie.getName().startsWith("_auth_empresa")) {
                        token = cookie.getValue();
                        break;
                    }
                }
            }
        }

        if (token == null || token.isEmpty()) {
            System.out.println("Token não encontrado.");
            return false;
        }

        if (token.startsWith("Bearer ")) {
            token = token.substring(7);
        }

        return tokenEmpresaService.isTokenEmpresa(token);
    }
}
