package com.fabriciodev.controller.cnae;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fabriciodev.model.cnae.Cnae;
import com.fabriciodev.service.cnae.CnaeService;

import java.util.List;

@RestController
@RequestMapping("/api/cnae")
public class CnaeController {

    @Autowired
    private CnaeService cnaeService;

    /**
     * Endpoint para listar todos os CNAEs.
     *
     * @return Lista de CNAEs
     */
    @GetMapping
    public ResponseEntity<List<Cnae>> listarCNAEs() {
        List<Cnae> cnaes = cnaeService.listarCNAEs();
        return ResponseEntity.ok(cnaes);
    }
}
