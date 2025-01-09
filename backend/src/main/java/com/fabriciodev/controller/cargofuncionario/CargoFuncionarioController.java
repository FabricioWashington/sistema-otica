package com.fabriciodev.controller.cargofuncionario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.fabriciodev.dto.cargofuncionario.CargoFuncionarioDTO;
import com.fabriciodev.service.cargofuncionario.CargoFuncionarioService;

import java.util.List;

@RestController
@RequestMapping("/api/cargos")
public class CargoFuncionarioController {

    @Autowired
    private CargoFuncionarioService service;

    @PostMapping
    public ResponseEntity<CargoFuncionarioDTO> create(@RequestBody CargoFuncionarioDTO dto) {
        return ResponseEntity.ok(service.create(dto));
    }

    @GetMapping
    public ResponseEntity<List<CargoFuncionarioDTO>> getAll() {
        return ResponseEntity.ok(service.getAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<CargoFuncionarioDTO> getById(@PathVariable Long id) {
        return ResponseEntity.ok(service.getById(id));
    }

    @PutMapping("/{id}")
    public ResponseEntity<CargoFuncionarioDTO> update(@PathVariable Long id, @RequestBody CargoFuncionarioDTO dto) {
        return ResponseEntity.ok(service.update(id, dto));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}
