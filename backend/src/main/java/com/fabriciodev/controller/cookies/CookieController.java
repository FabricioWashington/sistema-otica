package com.fabriciodev.controller.cookies;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fabriciodev.service.cookies.CookieService;

import lombok.RequiredArgsConstructor;

import java.util.Optional;

@RestController
@RequestMapping("/api/cookies")
@RequiredArgsConstructor
public class CookieController {

    private final CookieService cookieService;

    @GetMapping("/usuario")
    public ResponseEntity<String> getUsuarioCookie(HttpServletRequest request) {
        Optional<String> usuario = cookieService.obterCookieUsuario(request);
        return usuario.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.status(404).body("Cookie de usuário não encontrado"));
    }

    @GetMapping("/empresa")
    public ResponseEntity<String> getEmpresaCookie(HttpServletRequest request) {
        Optional<String> empresa = cookieService.obterCookieEmpresa(request);
        return empresa.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.status(404).body("Cookie de empresa não encontrado"));
    }
}
