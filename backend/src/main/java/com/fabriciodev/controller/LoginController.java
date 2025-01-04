package com.fabriciodev.controller;

import com.fabriciodev.model.Login;
import com.fabriciodev.service.LoginService;
import com.fabriciodev.service.TiposLoginService;
import com.fabriciodev.dto.TiposLoginDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/login")
public class LoginController {

    @Autowired
    private LoginService loginService;

    @PostMapping("/autenticar")
    public ResponseEntity<Login> autenticar(@RequestParam String loginUsuario,
                                        @RequestParam String loginSenha,
                                        @RequestParam Long idTiposLogin) {
    Optional<Login> login = loginService.autenticar(loginUsuario, loginSenha, idTiposLogin);

    return login.map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.status(401).build());
    }

    @PostMapping("/verificar")
    public ResponseEntity<Boolean> verificarUsuarioCadastrado(@RequestParam String loginUsuario,
                                                              @RequestParam Long idTiposLogin) {
        boolean existe = loginService.verificarUsuarioCadastrado(loginUsuario, idTiposLogin);

        return ResponseEntity.ok(existe);
    }

    @PostMapping
    public ResponseEntity<Login> salvar(@RequestBody Login login) {
        Login novoLogin = loginService.salvar(login);

        return ResponseEntity.ok(novoLogin);
    }

    @Autowired
    private TiposLoginService tiposLoginService;

}
