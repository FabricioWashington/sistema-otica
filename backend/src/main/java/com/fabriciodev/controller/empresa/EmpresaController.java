package com.fabriciodev.controller.empresa;

import com.fabriciodev.components.BaseApiController;
import com.fabriciodev.dto.empresa.EmpresaDTO;
import com.fabriciodev.model.empresa.Empresa;
import com.fabriciodev.service.empresa.EmpresaService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/empresa")
public class EmpresaController extends BaseApiController {

    @Autowired
    private EmpresaService empresaService;

    @PostMapping("/create")
    public ResponseEntity<?> cadastrarEmpresa(HttpServletRequest request, @RequestBody EmpresaDTO empresaDTO) {

        if (!isAuthorized(request)) {
            return ResponseEntity.status(403)
                    .body(Map.of("error", "Acesso negado. Apenas usuários autenticados podem cadastrar empresas."));
        }

        Empresa empresa = empresaService.createEmpresa(empresaDTO);
        return ResponseEntity.ok(empresa);
    }

    @GetMapping
    public ResponseEntity<?> listarEmpresas(HttpServletRequest request) {

        if (!isAuthorized(request)) {
            return ResponseEntity.status(403)
                    .body(Map.of("error", "Acesso negado. Apenas usuários autenticados podem listar empresas."));
        }

        List<Empresa> empresas = empresaService.listarEmpresas();
        return ResponseEntity.ok(empresas);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> consultarEmpresa(HttpServletRequest request, @PathVariable Integer id) {
        System.out.println("ID Recebido: " + id);

        if (!isAuthorized(request)) {
            return ResponseEntity.status(403)
                    .body(Map.of("error", "Acesso negado. Apenas usuários autenticados podem consultar empresas."));
        }

        Optional<Empresa> empresa = empresaService.consultarEmpresa(id);
        return empresa.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> atualizarEmpresa(HttpServletRequest request, @PathVariable Integer id,
            @RequestBody EmpresaDTO empresaDTO) {

        if (!isAuthorized(request)) {
            return ResponseEntity.status(403)
                    .body(Map.of("error", "Acesso negado. Apenas usuários autenticados podem atualizar empresas."));
        }

        Empresa empresa = empresaService.updateEmpresa(id, empresaDTO);
        return ResponseEntity.ok(empresa);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> excluirEmpresa(HttpServletRequest request, @PathVariable Integer id) {

        if (!isAuthorized(request)) {
            return ResponseEntity.status(403)
                    .body(Map.of("error", "Acesso negado. Apenas usuários autenticados podem excluir empresas."));
        }

        empresaService.deleteEmpresa(id);
        return ResponseEntity.noContent().build();
    }
}
