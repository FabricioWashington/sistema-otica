package com.fabriciodev.controller.tiposlogin;

import com.fabriciodev.model.tiposlogin.TiposLogin;
import com.fabriciodev.security.TokenEmpresaService;
import com.fabriciodev.service.tiposlogin.TiposLoginService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/tipos-login")
@CrossOrigin(origins = "http://localhost:4200")
public class TiposLoginController {

    @Autowired
    private TiposLoginService tiposLoginService;

    @Autowired
    private TokenEmpresaService tokenEmpresaService;

    @GetMapping
    public ResponseEntity<?> listarTiposLogin(
            @RequestHeader("Authorization") String token,
            @RequestParam(required = false) Integer idEmpresa) {

        System.out.println("Token recebido no backend: " + token);
        // token = token.replace("Bearer ", "").trim();

        if (!tokenEmpresaService.isTokenEmpresa(token)) {
            System.out.println("Token inválido ou não autorizado." + token);
            return ResponseEntity.status(403).body(Map.of("error", "Acesso negado. Apenas empresas podem acessar."));
        }

        if (idEmpresa != null) {
            return ResponseEntity.ok(tiposLoginService.listarPorEmpresa(idEmpresa));
        }
        return ResponseEntity.ok(tiposLoginService.listarTodos());
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> buscarPorId(
            @RequestHeader("Authorization") String token,
            @PathVariable Long id) {

        if (!tokenEmpresaService.isTokenEmpresa(token)) {
            return ResponseEntity.status(403).body(Map.of("error", "Acesso negado. Apenas empresas podem acessar."));
        }

        return tiposLoginService.buscarPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<?> criarTipoLogin(
            @RequestHeader("Authorization") String token,
            @RequestBody TiposLogin tiposLogin) {

        if (!tokenEmpresaService.isTokenEmpresa(token)) {
            return ResponseEntity.status(403).body(Map.of("error", "Acesso negado. Apenas empresas podem acessar."));
        }

        return ResponseEntity.ok(tiposLoginService.criar(tiposLogin));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> atualizarTipoLogin(
            @RequestHeader("Authorization") String token,
            @PathVariable Long id,
            @RequestBody TiposLogin tiposLoginAtualizado) {

        if (!tokenEmpresaService.isTokenEmpresa(token)) {
            return ResponseEntity.status(403).body(Map.of("error", "Acesso negado. Apenas empresas podem acessar."));
        }

        return tiposLoginService.atualizar(id, tiposLoginAtualizado)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deletarTipoLogin(
            @RequestHeader("Authorization") String token,
            @PathVariable Long id) {

        if (!tokenEmpresaService.isTokenEmpresa(token)) {
            return ResponseEntity.status(403).body(Map.of("error", "Acesso negado. Apenas empresas podem acessar."));
        }

        if (tiposLoginService.deletar(id)) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }
}
