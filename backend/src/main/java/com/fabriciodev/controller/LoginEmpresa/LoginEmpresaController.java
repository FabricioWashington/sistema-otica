package com.fabriciodev.controller.LoginEmpresa;

import com.fabriciodev.model.empresa.Empresa;
import com.fabriciodev.security.TokenEmpresaService;
import com.fabriciodev.service.LoginEmpresa.LoginEmpresaService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/login-empresa")
public class LoginEmpresaController {

    @Autowired
    private LoginEmpresaService loginEmpresaService;

    @Autowired
    private TokenEmpresaService tokenEmpresaService;

    @PostMapping("/auth")
    public ResponseEntity<?> autenticar(
            @RequestParam String cnpj, 
            @RequestParam String senha, 
            HttpServletResponse response) {
        Optional<Empresa> empresaOptional = loginEmpresaService.autenticarCnpj(cnpj, senha);

        return empresaOptional.map(empresa -> {
            String token = tokenEmpresaService.generateToken(empresa);

            Cookie cookie = new Cookie("_auth_" + empresa.getNomeFantasia(), token);
            cookie.setHttpOnly(false);
            cookie.setSecure(false);
            cookie.setPath("/");
            cookie.setMaxAge(60 * 60 * 2);
            response.addCookie(cookie);

            return ResponseEntity.ok("Empresa autenticada com sucesso!");
        }).orElseGet(() -> ResponseEntity.status(401).body("Credenciais inválidas."));
    }

    @GetMapping("/logout")
    public ResponseEntity<?> logout(HttpServletResponse response) {
        Cookie cookie = new Cookie("_auth_", null);
        cookie.setHttpOnly(false);
        cookie.setSecure(false);
        cookie.setPath("/");
        cookie.setMaxAge(0);
        response.addCookie(cookie);

        return ResponseEntity.ok("Logout realizado com sucesso.");
    }
}
