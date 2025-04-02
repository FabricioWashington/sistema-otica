package com.fabriciodev.controller;

import com.fabriciodev.components.BaseApiController;
import com.fabriciodev.model.TiposLogin;
import com.fabriciodev.service.TiposLoginService;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/tipos-login")
@CrossOrigin(origins = "*")
public class TiposLoginController extends BaseApiController {

    @Autowired
    private TiposLoginService tiposLoginService;

    @GetMapping
    public ResponseEntity<List<TiposLogin>> listarTiposLogin() {
        return ResponseEntity.ok(tiposLoginService.listarTodos());
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> buscarPorId(@PathVariable Long id) {
        return tiposLoginService.buscarPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<?> criarTipoLogin(@RequestBody TiposLogin tiposLogin) {
        return ResponseEntity.ok(tiposLoginService.criar(tiposLogin));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> atualizarTipoLogin(
            @PathVariable Long id,
            @RequestBody TiposLogin tiposLoginAtualizado) {
        return tiposLoginService.atualizar(id, tiposLoginAtualizado)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deletarTipoLogin(@PathVariable Long id) {
        if (tiposLoginService.deletar(id)) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }
}
