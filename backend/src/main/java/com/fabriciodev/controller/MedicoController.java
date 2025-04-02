package com.fabriciodev.controller;

import com.fabriciodev.components.BaseApiController;
import com.fabriciodev.dto.MedicoDTO;
import com.fabriciodev.service.MedicoService;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

@RestController
@RequestMapping("/api/medico")
public class MedicoController extends BaseApiController {

    @Autowired
    private MedicoService medicoService;

    @PostMapping
    public ResponseEntity<?> create(@RequestBody MedicoDTO dto, HttpServletRequest request) {
        if (!isAuthorized(request)) {
            return ResponseEntity.status(403).body(Map.of("error", "Acesso negado. Token inválido ou ausente."));
        }
        return ResponseEntity.ok(medicoService.create(dto));
    }

    @GetMapping
    public ResponseEntity<?> getAll(@RequestParam Integer idEmpresa, HttpServletRequest request) {
        if (!isAuthorized(request)) {
            return ResponseEntity.status(403).body(Map.of("error", "Acesso negado. Token inválido ou ausente."));
        }
        return ResponseEntity.ok(medicoService.getAllByEmpresa(idEmpresa));
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getById(@PathVariable Long id, HttpServletRequest request) {
        if (!isAuthorized(request)) {
            return ResponseEntity.status(403).body(Map.of("error", "Acesso negado. Token inválido ou ausente."));
        }
        return ResponseEntity.ok(medicoService.getById(id));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> update(@PathVariable Long id, @RequestBody MedicoDTO dto, HttpServletRequest request) {
        if (!isAuthorized(request)) {
            return ResponseEntity.status(403).body(Map.of("error", "Acesso negado. Token inválido ou ausente."));
        }
        return ResponseEntity.ok(medicoService.update(id, dto));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable Long id, HttpServletRequest request) {
        if (!isAuthorized(request)) {
            return ResponseEntity.status(403).body(Map.of("error", "Acesso negado. Token inválido ou ausente."));
        }
        medicoService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
