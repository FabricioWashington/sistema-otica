package com.fabriciodev.controller.login;

import com.fabriciodev.model.login.Login;
import com.fabriciodev.service.login.LoginService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/login")
@CrossOrigin(origins = "http://localhost:4200")
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


}
