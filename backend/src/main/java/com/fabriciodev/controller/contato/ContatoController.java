package com.fabriciodev.controller.contato;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.fabriciodev.dto.contato.ContatoDTO;
import com.fabriciodev.model.contato.Contato;
import com.fabriciodev.service.contato.ContatoService;

import java.util.List;

@RestController
@RequestMapping("/api/contatos")
public class ContatoController {

    @Autowired
    private ContatoService contatoService;

    @PostMapping
    public ResponseEntity<Contato> salvarContato(@RequestBody ContatoDTO contatoDTO) {
        Contato contato = contatoService.salvarContato(contatoDTO);
        return ResponseEntity.ok(contato);
    }

    @GetMapping
    public ResponseEntity<List<Contato>> listarContatos() {
        return ResponseEntity.ok(contatoService.listarContatos());
    }

    @GetMapping("/{idContato}")
    public ResponseEntity<Contato> consultarContato(@PathVariable Integer idContato) {
        return ResponseEntity.ok(contatoService.consultarContato(idContato));
    }

    @PutMapping("/{idContato}")
    public ResponseEntity<Contato> atualizarContato(@PathVariable Integer idContato, @RequestBody ContatoDTO contatoDTO) {
        Contato contato = contatoService.atualizarContato(idContato, contatoDTO);
        return ResponseEntity.ok(contato);
    }

    @DeleteMapping("/{idContato}")
    public ResponseEntity<Void> excluirContato(@PathVariable Integer idContato) {
        contatoService.excluirContato(idContato);
        return ResponseEntity.noContent().build();
    }
}

