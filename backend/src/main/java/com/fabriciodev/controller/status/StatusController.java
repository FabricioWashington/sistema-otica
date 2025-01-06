package com.fabriciodev.controller.status;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:4200")
public class StatusController {

    @GetMapping("/status-banco")
    public ResponseEntity<Map<String, String>> verificarBanco() {
        Map<String, String> response = new HashMap<>();
        try {
            // Substitua pela lógica de verificação real
            response.put("status", "Banco de dados OK");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("status", "Erro ao conectar com o banco");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }
}
