package com.fabriciodev.controller.tiposlogin;

import com.fabriciodev.components.BaseApiController;
import com.fabriciodev.model.tiposlogin.TiposLogin;
import com.fabriciodev.service.tiposlogin.TiposLoginService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/tipos-login")
@CrossOrigin(origins = "http://localhost:4200")
public class TiposLoginController extends BaseApiController {

    @Autowired
    private TiposLoginService tiposLoginService;

    @GetMapping
    public ResponseEntity<?> listarTiposLogin(HttpServletRequest request,
            @RequestParam(required = false) Integer idEmpresa) {

        if (!isAuthorized(request)) {
            return ResponseEntity.status(403).body(Map.of("error", "Acesso negado. Apenas empresas podem acessar."));
        }

        if (idEmpresa != null) {
            return ResponseEntity.ok(tiposLoginService.listarPorEmpresa(idEmpresa));
        }
        return ResponseEntity.ok(tiposLoginService.listarTodos());
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> buscarPorId(HttpServletRequest request, @PathVariable Long id) {

        if (!isAuthorized(request)) {
            return ResponseEntity.status(403).body(Map.of("error", "Acesso negado. Apenas empresas podem acessar."));
        }

        return tiposLoginService.buscarPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<?> criarTipoLogin(HttpServletRequest request, @RequestBody TiposLogin tiposLogin) {

        if (!isAuthorized(request)) {
            return ResponseEntity.status(403).body(Map.of("error", "Acesso negado. Apenas empresas podem acessar."));
        }

        return ResponseEntity.ok(tiposLoginService.criar(tiposLogin));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> atualizarTipoLogin(HttpServletRequest request,
            @PathVariable Long id,
            @RequestBody TiposLogin tiposLoginAtualizado) {

        if (!isAuthorized(request)) {
            return ResponseEntity.status(403).body(Map.of("error", "Acesso negado. Apenas empresas podem acessar."));
        }

        return tiposLoginService.atualizar(id, tiposLoginAtualizado)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deletarTipoLogin(HttpServletRequest request, @PathVariable Long id) {

        if (!isAuthorized(request)) {
            return ResponseEntity.status(403).body(Map.of("error", "Acesso negado. Apenas empresas podem acessar."));
        }

        if (tiposLoginService.deletar(id)) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }
}
