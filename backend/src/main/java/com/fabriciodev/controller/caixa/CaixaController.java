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

    @PostMapping("/fechar")
    public ResponseEntity<CaixaDTO> fecharCaixa(@RequestParam BigDecimal saldoFinal, @RequestParam Integer idEmpresa) {
        Long idCaixaAberto = service.getIdCaixaAberto(idEmpresa);
        return ResponseEntity.ok(service.fecharCaixa(idCaixaAberto, saldoFinal));
    }

    @GetMapping
    public ResponseEntity<List<CaixaDTO>> listarCaixas(@RequestParam Integer idEmpresa) {
        return ResponseEntity.ok(service.listarCaixas(idEmpresa));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletarCaixa(@PathVariable Long id) {
        service.deletarCaixa(id);
        return ResponseEntity.noContent().build();
    }
}
