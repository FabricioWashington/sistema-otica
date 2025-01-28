package com.fabriciodev.controller.cliente;

import com.fabriciodev.dto.cliente.PessoaJuridicaDTO;
import com.fabriciodev.service.cliente.PessoaJuridicaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/pessoa-juridica")
@CrossOrigin(origins = "http://localhost:4200")
public class PessoaJuridicaController {

    @Autowired
    private PessoaJuridicaService service;

    @PostMapping
    public ResponseEntity<PessoaJuridicaDTO> create(@RequestBody PessoaJuridicaDTO dto) {
        return ResponseEntity.ok(service.create(dto));
    }

    @GetMapping
    public ResponseEntity<List<PessoaJuridicaDTO>> getAllByEmpresa(@RequestParam Integer idEmpresa) {
        return ResponseEntity.ok(service.getAllByEmpresa(idEmpresa));
    }

    @GetMapping("/{id}")
    public ResponseEntity<PessoaJuridicaDTO> getById(@PathVariable Long id) {
        return ResponseEntity.ok(service.getById(id));
    }

    @PutMapping("/{id}")
    public ResponseEntity<PessoaJuridicaDTO> update(@PathVariable Long id, @RequestBody PessoaJuridicaDTO dto) {
        return ResponseEntity.ok(service.update(id, dto));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}
