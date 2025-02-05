package com.fabriciodev.controller.unidade;

import com.fabriciodev.dto.unidade.UnidadeDTO;
import com.fabriciodev.service.unidade.UnidadeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/unidades")
public class UnidadeController {

    @Autowired
    private UnidadeService service;

    @GetMapping
    public ResponseEntity<List<UnidadeDTO>> listarTodos() {
        return ResponseEntity.ok(service.listarTodos());
    }

    @GetMapping("/{id}")
    public ResponseEntity<UnidadeDTO> buscarPorId(@PathVariable Long id) {
        UnidadeDTO unidade = service.buscarPorId(id);
        return unidade != null ? ResponseEntity.ok(unidade) : ResponseEntity.notFound().build();
    }

    @PostMapping
    public ResponseEntity<UnidadeDTO> criar(@RequestBody UnidadeDTO dto) {
        return ResponseEntity.ok(service.criar(dto));
    }

    @PutMapping("/{id}")
    public ResponseEntity<UnidadeDTO> atualizar(@PathVariable Long id, @RequestBody UnidadeDTO dto) {
        UnidadeDTO unidadeAtualizada = service.atualizar(id, dto);
        return unidadeAtualizada != null ? ResponseEntity.ok(unidadeAtualizada) : ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletar(@PathVariable Long id) {
        return service.deletar(id) ? ResponseEntity.noContent().build() : ResponseEntity.notFound().build();
    }
}