package com.fabriciodev.controller;

import com.fabriciodev.components.BaseApiController;
import com.fabriciodev.dto.EmpresaDTO;
import com.fabriciodev.model.Empresa;
import com.fabriciodev.service.EmpresaService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api/empresa")
public class EmpresaController extends BaseApiController {

    @Autowired
    private EmpresaService empresaService;

    @PostMapping("/create")
    public ResponseEntity<Empresa> cadastrarEmpresa(@RequestBody EmpresaDTO empresaDTO) {
        Empresa empresa = empresaService.createEmpresa(empresaDTO);
        return ResponseEntity.ok(empresa);
    }

    @GetMapping
    public ResponseEntity<?> listarEmpresas(HttpServletRequest request) {
        if (!isAuthorized(request)) {
            return ResponseEntity.status(403)
                    .body(Map.of("error", "Acesso negado. Apenas usuários autenticados podem listar empresas."));
        }

        List<Empresa> empresas = empresaService.listarEmpresas();
        return ResponseEntity.ok(empresas);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> consultarEmpresa(HttpServletRequest request, @PathVariable Integer id) {
        if (!isAuthorized(request)) {
            return ResponseEntity.status(403)
                    .body(Map.of("error", "Acesso negado. Apenas usuários autenticados podem consultar empresas."));
        }

        log.info("Consultando empresa com ID: {}", id);

        return empresaService.consultarEmpresa(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> atualizarEmpresa(HttpServletRequest request, @PathVariable Integer id,
            @RequestBody EmpresaDTO empresaDTO) {

        if (!isAuthorized(request)) {
            return ResponseEntity.status(403)
                    .body(Map.of("error", "Acesso negado. Apenas usuários autenticados podem atualizar empresas."));
        }

        Empresa empresa = empresaService.updateEmpresa(id, empresaDTO);
        return ResponseEntity.ok(empresa);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> excluirEmpresa(HttpServletRequest request, @PathVariable Integer id) {

        if (!isAuthorized(request)) {
            return ResponseEntity.status(403)
                    .body(Map.of("error", "Acesso negado. Apenas usuários autenticados podem excluir empresas."));
        }

        empresaService.deleteEmpresa(id);
        return ResponseEntity.noContent().build();
    }
}
