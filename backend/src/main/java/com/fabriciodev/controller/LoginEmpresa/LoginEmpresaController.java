package com.fabriciodev.controller.LoginEmpresa;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.fabriciodev.service.LoginEmpresa.LoginEmpresaService;

@RestController
@RequestMapping("/api/login-empresa")
public class LoginEmpresaController {

    @Autowired
    private LoginEmpresaService loginEmpresaService;

    @PostMapping("/auth")
    public ResponseEntity<String> autenticar(
            @RequestParam String cnpj,
            @RequestParam String email,
            @RequestParam String senha) {

        boolean autenticado = loginEmpresaService.autenticar(cnpj, email, senha);

        if (autenticado) {
            return ResponseEntity.ok("Autenticação realizada com sucesso.");
        } else {
            return ResponseEntity.status(401).body("Credenciais inválidas.");
        }
    }
}