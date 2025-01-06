package com.fabriciodev.controller.usuarios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fabriciodev.model.tiposlogin.TiposLogin;
import com.fabriciodev.service.tiposlogin.TiposLoginService;

import org.springframework.web.bind.annotation.GetMapping;


@RestController
@RequestMapping("/api/usuarios")
@CrossOrigin(origins = "http://localhost:4200")
public class UsuariosController {

    @Autowired
    private TiposLoginService tiposLoginService;

    @GetMapping("/tipos-login")
    public ResponseEntity<List<TiposLogin>> listarTiposLogin() {
        return ResponseEntity.ok(tiposLoginService.listarTodos());
    }
}
