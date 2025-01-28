package com.fabriciodev.controller.cliente;

import com.fabriciodev.dto.cliente.PessoaFisicaDTO;
import com.fabriciodev.service.cliente.PessoaFisicaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/pessoa-fisica")
@CrossOrigin(origins = "http://localhost:4200")
public class PessoaFisicaController {

    @Autowired
    private PessoaFisicaService service;

    @PostMapping
    public ResponseEntity<PessoaFisicaDTO> create(@RequestBody PessoaFisicaDTO dto) {
        return ResponseEntity.ok(service.create(dto));
    }

    @GetMapping
    public ResponseEntity<List<PessoaFisicaDTO>> getAllByEmpresa(@RequestParam Integer idEmpresa) {
        return ResponseEntity.ok(service.getAllByEmpresa(idEmpresa));
    }

    @GetMapping("/{id}")
    public ResponseEntity<PessoaFisicaDTO> getById(@PathVariable Long id) {
        return ResponseEntity.ok(service.getById(id));
    }

    @PutMapping("/{id}")
    public ResponseEntity<PessoaFisicaDTO> update(@PathVariable Long id, @RequestBody PessoaFisicaDTO dto) {
        return ResponseEntity.ok(service.update(id, dto));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}
