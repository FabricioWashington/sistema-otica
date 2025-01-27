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
    public ResponseEntity<?> autenticar(
            @RequestParam String cnpj,
            @RequestParam String senha) {

        Integer idEmpresa = loginEmpresaService.autenticarCnpj(cnpj, senha);

        if (idEmpresa != null) {
            return ResponseEntity.ok(idEmpresa);
        } else {
            return ResponseEntity.status(401).body("Credenciais inválidas.");
        }
    }
}
