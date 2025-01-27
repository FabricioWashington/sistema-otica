package com.fabriciodev.controller.usuarios;

import com.fabriciodev.dto.usuarios.UsuariosDTO;
import com.fabriciodev.service.usuarios.UsuariosService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/usuarios")
@CrossOrigin(origins = "http://localhost:4200")
public class UsuariosController {

    @Autowired
    private UsuariosService service;

    @PostMapping
    public ResponseEntity<UsuariosDTO> create(@RequestBody UsuariosDTO usuario) {
        return ResponseEntity.ok(service.create(usuario));
    }

    @GetMapping
    public ResponseEntity<List<UsuariosDTO>> getAll(@RequestParam(required = false) Integer idEmpresa) {
        if (idEmpresa != null) {
            return ResponseEntity.ok(service.getAllByEmpresa(idEmpresa));
        }
        return ResponseEntity.ok(service.getAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<UsuariosDTO> getById(@PathVariable Long id) {
        return ResponseEntity.ok(service.getById(id));
    }

    @PutMapping("/{id}")
    public ResponseEntity<UsuariosDTO> update(@PathVariable Long id, @RequestBody UsuariosDTO dto) {
        return ResponseEntity.ok(service.update(id, dto));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}
