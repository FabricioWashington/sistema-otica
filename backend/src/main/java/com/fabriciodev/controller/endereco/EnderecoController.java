package com.fabriciodev.controller.endereco;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.fabriciodev.dto.endereco.EnderecoDTO;
import com.fabriciodev.model.endereco.Endereco;
import com.fabriciodev.service.endereco.EnderecoService;

import java.util.List;

@RestController
@RequestMapping("/api/enderecos")
public class EnderecoController {

    @Autowired
    private EnderecoService enderecoService;

    @PostMapping
    public ResponseEntity<Endereco> salvarEndereco(@RequestBody EnderecoDTO enderecoDTO) {
        Endereco endereco = enderecoService.salvarEndereco(enderecoDTO);
        return ResponseEntity.ok(endereco);
    }

    @GetMapping
    public ResponseEntity<List<Endereco>> listarEnderecos() {
        return ResponseEntity.ok(enderecoService.listarEnderecos());
    }

    @GetMapping("/{idEndereco}")
    public ResponseEntity<Endereco> consultarEndereco(@PathVariable Integer idEndereco) {
        return ResponseEntity.ok(enderecoService.consultarEndereco(idEndereco));
    }

    @PutMapping("/{idEndereco}")
    public ResponseEntity<Endereco> atualizarEndereco(@PathVariable Integer idEndereco, @RequestBody EnderecoDTO enderecoDTO) {
        Endereco endereco = enderecoService.atualizarEndereco(idEndereco, enderecoDTO);
        return ResponseEntity.ok(endereco);
    }

    @DeleteMapping("/{idEndereco}")
    public ResponseEntity<Void> excluirEndereco(@PathVariable Integer idEndereco) {
        enderecoService.excluirEndereco(idEndereco);
        return ResponseEntity.noContent().build();
    }
}