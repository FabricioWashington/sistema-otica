package com.fabriciodev.controller.venda;

import com.fabriciodev.dto.venda.VendaDTO;
import com.fabriciodev.service.venda.VendaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/vendas")
public class VendaController {

    @Autowired
    private VendaService service;

    @PostMapping
    public ResponseEntity<VendaDTO> cadastrarVenda(@RequestBody VendaDTO dto) {
        return ResponseEntity.ok(service.cadastrarVenda(dto));
    }

    @GetMapping
    public ResponseEntity<List<VendaDTO>> listarVendas() {
        return ResponseEntity.ok(service.listarVendas());
    }

    @PutMapping("/{id}")
    public ResponseEntity<VendaDTO> atualizarVenda(@PathVariable Long id, @RequestBody VendaDTO dto) {
        return ResponseEntity.ok(service.atualizarVenda(id, dto));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> excluirVenda(@PathVariable Long id) {
        service.excluirVenda(id);
        return ResponseEntity.noContent().build();
    }
}
