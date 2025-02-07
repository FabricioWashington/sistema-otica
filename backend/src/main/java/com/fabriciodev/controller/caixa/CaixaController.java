package com.fabriciodev.controller.caixa;

import com.fabriciodev.dto.caixa.CaixaDTO;
import com.fabriciodev.service.caixa.CaixaService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping("/api/caixa")
@RequiredArgsConstructor
public class CaixaController {

    private final CaixaService service;

    @PostMapping("/abrir")
    public ResponseEntity<CaixaDTO> abrirCaixa(@RequestBody CaixaDTO dto) {
        return ResponseEntity.ok(service.abrirCaixa(dto));
    }

    @PostMapping("/fechar/{id}")
    public ResponseEntity<CaixaDTO> fecharCaixa(@PathVariable Long id, @RequestParam BigDecimal saldoFinal) {
        return ResponseEntity.ok(service.fecharCaixa(id, saldoFinal));
    }

    @GetMapping
    public ResponseEntity<List<CaixaDTO>> listarCaixas() {
        return ResponseEntity.ok(service.listarCaixas());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletarCaixa(@PathVariable Long id) {
        service.deletarCaixa(id);
        return ResponseEntity.noContent().build();
    }
}
