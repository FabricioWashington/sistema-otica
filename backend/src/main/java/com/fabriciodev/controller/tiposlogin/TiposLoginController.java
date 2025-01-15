package com.fabriciodev.controller.tiposlogin;

import com.fabriciodev.model.tiposlogin.TiposLogin;
import com.fabriciodev.service.tiposlogin.TiposLoginService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/tipos-login")
@CrossOrigin(origins = "http://localhost:4200")
public class TiposLoginController {

    @Autowired
    private TiposLoginService tiposLoginService;

    @GetMapping
    public ResponseEntity<List<TiposLogin>> listarTiposLogin() {
        return ResponseEntity.ok(tiposLoginService.listarTodos());
    }

    @GetMapping("/{id}")
    public ResponseEntity<TiposLogin> buscarPorId(@PathVariable Long id) {
        return tiposLoginService.buscarPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<TiposLogin> criarTipoLogin(@RequestBody TiposLogin tiposLogin) {
        return ResponseEntity.ok(tiposLoginService.criar(tiposLogin));
    }

    @PutMapping("/{id}")
    public ResponseEntity<TiposLogin> atualizarTipoLogin(
            @PathVariable Long id,
            @RequestBody TiposLogin tiposLoginAtualizado) {
        return tiposLoginService.atualizar(id, tiposLoginAtualizado)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletarTipoLogin(@PathVariable Long id) {
        if (tiposLoginService.deletar(id)) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }
}
