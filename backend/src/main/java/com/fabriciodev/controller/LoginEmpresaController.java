package com.fabriciodev.controller;

import com.fabriciodev.dto.EmpresaDTO;
import com.fabriciodev.security.TokenEmpresaService;
import com.fabriciodev.service.LoginEmpresa.LoginEmpresaService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/login-empresa")
public class LoginEmpresaController {

    @Autowired
    private LoginEmpresaService loginEmpresaService;

    @Autowired
    private TokenEmpresaService tokenEmpresaService;

    @PostMapping("/auth")
    public ResponseEntity<Map<String, Object>> autenticar(
            @RequestBody EmpresaDTO request,
            HttpServletResponse response) {

        Optional<EmpresaDTO> empresaOptional = loginEmpresaService.autenticarCnpj(request.getCnpj(),
                request.getSenha());

        return empresaOptional.map(empresaDTO -> {
            String token = tokenEmpresaService.generateToken(empresaDTO);

            Cookie cookie = new Cookie("_auth_empresa", token);
            cookie.setHttpOnly(false);
            cookie.setSecure(false);
            cookie.setPath("/");
            cookie.setMaxAge(60 * 60 * 2);
            response.addCookie(cookie);

            Map<String, Object> responseBody = new HashMap<>();
            responseBody.put("message", "Empresa autenticada com sucesso!");
            responseBody.put("token", token);
            responseBody.put("empresa", empresaDTO.getNomeFantasia());

            return ResponseEntity.ok(responseBody);
        }).orElseGet(() -> {
            Map<String, Object> errorResponse = new HashMap<>();
            errorResponse.put("error", "Credenciais inválidas.");
            return ResponseEntity.status(401).body(errorResponse);
        });
    }

    @PostMapping("/refresh-token")
    public ResponseEntity<Map<String, Object>> refreshToken(
            @CookieValue(value = "_auth_empresa", required = false) String token,
            HttpServletResponse response) {

        if (token == null || token.isEmpty()) {
            return ResponseEntity.status(401).body(Map.of("error", "Token ausente."));
        }

        Map<String, Object> claims = tokenEmpresaService.validateToken(token);
        if (claims == null) {
            return ResponseEntity.status(401).body(Map.of("error", "Token inválido ou expirado."));
        }

        EmpresaDTO empresa = new EmpresaDTO();
        empresa.setIdEmpresa((Integer) claims.get("idEmpresa"));
        empresa.setCnpj((String) claims.get("cnpj"));

        String novoToken = tokenEmpresaService.generateToken(empresa);

        Cookie cookie = new Cookie("_auth_empresa", novoToken);
        cookie.setHttpOnly(false);
        cookie.setSecure(false);
        cookie.setPath("/");
        cookie.setMaxAge(60 * 60 * 2);
        response.addCookie(cookie);

        Map<String, Object> responseBody = new HashMap<>();
        responseBody.put("message", "Token renovado com sucesso!");
        responseBody.put("token", novoToken);

        return ResponseEntity.ok(responseBody);
    }

    @GetMapping("/logout")
    public ResponseEntity<Map<String, String>> logout(HttpServletResponse response) {
        Cookie cookie = new Cookie("_auth_empresa", null);
        cookie.setHttpOnly(false);
        cookie.setSecure(false);
        cookie.setPath("/");
        cookie.setMaxAge(0);
        response.addCookie(cookie);

        Map<String, String> responseBody = new HashMap<>();
        responseBody.put("message", "Logout realizado com sucesso.");
        return ResponseEntity.ok(responseBody);
    }
}
