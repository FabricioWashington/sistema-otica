package com.fabriciodev.controller.empresa;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.fabriciodev.dto.empresa.EmpresaDTO;
import com.fabriciodev.model.empresa.Empresa;
import com.fabriciodev.service.empresa.EmpresaService;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/empresa")
public class EmpresaController {

    @Autowired
    private EmpresaService empresaService;

    @PostMapping
    public ResponseEntity<Empresa> cadastrarEmpresa(@RequestBody EmpresaDTO empresaDTO) {
        Empresa empresa = empresaService.salvarEmpresaComContatoEEndereco(empresaDTO);
        return ResponseEntity.ok(empresa);
    }

    @GetMapping
    public ResponseEntity<List<Empresa>> listarEmpresas() {
        List<Empresa> empresas = empresaService.listarEmpresas();
        return ResponseEntity.ok(empresas);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Empresa> consultarEmpresa(@PathVariable Integer id) {
        Optional<Empresa> empresa = empresaService.consultarEmpresa(id);
        return empresa.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<Empresa> atualizarEmpresa(@PathVariable Integer id, @RequestBody EmpresaDTO empresaDTO) {
        Empresa empresa = empresaService.atualizarEmpresaComContatoEEndereco(id, empresaDTO);
        return ResponseEntity.ok(empresa);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> excluirEmpresa(@PathVariable Integer id) {
        empresaService.excluirEmpresa(id);
        return ResponseEntity.noContent().build();
    }
}
