package com.fabriciodev.controller.categoria;

import com.fabriciodev.dto.categoria.CategoriaDTO;
import com.fabriciodev.service.categoria.CategoriaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/categoria")
public class CategoriaController {

    @Autowired
    private CategoriaService service;

    @PostMapping
    public ResponseEntity<CategoriaDTO> cadastrarCategoria(@RequestBody CategoriaDTO dto) {
        return ResponseEntity.ok(service.cadastrarCategoria(dto));
    }

    @GetMapping
    public ResponseEntity<List<CategoriaDTO>> listarCategorias() {
        return ResponseEntity.ok(service.listarCategorias());
    }

    @PutMapping("/{id}")
    public ResponseEntity<CategoriaDTO> atualizarCategoria(@PathVariable Long id, @RequestBody CategoriaDTO dto) {
        return ResponseEntity.ok(service.atualizarCategoria(id, dto));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> excluirCategoria(@PathVariable Long id) {
        service.excluirCategoria(id);
        return ResponseEntity.noContent().build();
    }
}
