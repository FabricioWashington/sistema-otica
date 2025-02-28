package com.fabriciodev.controller.login;

import com.fabriciodev.model.login.Login;
import com.fabriciodev.security.TokenUsuarioService;
import com.fabriciodev.service.login.LoginService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/login")
@CrossOrigin(origins = "http://localhost:4200")
public class LoginController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private TokenUsuarioService tokenUsuarioService;

    private boolean isAuthorized(String token) {
        return token != null && tokenUsuarioService.isTokenUsuario(token);
    }

    @PostMapping("/autenticar")
    public ResponseEntity<?> autenticar(
            @RequestParam String loginUsuario,
            @RequestParam String loginSenha,
            @RequestParam Long idTiposLogin,
            @RequestParam Integer idEmpresa,
            HttpServletResponse response) {

        Optional<Login> loginOptional = loginService.autenticar(loginUsuario, loginSenha, idTiposLogin, idEmpresa);

        return loginOptional.map(login -> {
            String token = tokenUsuarioService.generateToken(login);

            Cookie cookie = new Cookie("_auth_user_" + login.getLoginUsuario(), token);
            cookie.setHttpOnly(false);
            cookie.setSecure(false);
            cookie.setPath("/");
            cookie.setMaxAge(60 * 60 * 2);
            response.addCookie(cookie);

            return ResponseEntity.ok(Map.of(
                    "message", "Autenticação bem-sucedida!",
                    "usuario", login.getLoginUsuario(),
                    "acesso", login.getTiposLogin().getTiposLogin(),
                    "tokenUser", token));
        }).orElseGet(() -> ResponseEntity.status(401).body(Map.of("error", "Credenciais inválidas.")));
    }

    @GetMapping("/logout")
    public ResponseEntity<?> logout(HttpServletResponse response) {
        Cookie cookie = new Cookie("auth_token", null);
        cookie.setHttpOnly(true);
        cookie.setSecure(true);
        cookie.setPath("/");
        cookie.setMaxAge(0);
        response.addCookie(cookie);

        return ResponseEntity.ok(Map.of("message", "Logout realizado com sucesso."));
    }

    @PostMapping("/verificar")
    public ResponseEntity<Boolean> verificarUsuarioCadastrado(
            @RequestHeader("Authorization") String token,
            @RequestParam String loginUsuario,
            @RequestParam Long idTiposLogin,
            @RequestParam Integer idEmpresa) {

        if (!isAuthorized(token)) {
            return ResponseEntity.status(403).body(false);
        }

        boolean existe = loginService.verificarUsuarioCadastrado(loginUsuario, idTiposLogin, idEmpresa);
        return ResponseEntity.ok(existe);
    }

    @PostMapping
    public ResponseEntity<?> salvar(
            @RequestHeader("Authorization") String token,
            @RequestBody Login login) {

        if (!isAuthorized(token)) {
            return ResponseEntity.status(403)
                    .body(Map.of("error", "Acesso negado. Apenas usuários autenticados podem criar novos logins."));
        }

        Login novoLogin = loginService.salvar(login);
        return ResponseEntity.ok(novoLogin);
    }

    @PutMapping("/atualizar/{id}")
    public ResponseEntity<?> atualizar(
            @RequestHeader("Authorization") String token,
            @PathVariable Long id,
            @RequestParam String novaSenha) {

        if (!isAuthorized(token)) {
            return ResponseEntity.status(403)
                    .body(Map.of("error", "Acesso negado. Apenas usuários autenticados podem atualizar logins."));
        }

        Login loginAtualizado = loginService.updateLogin(id, novaSenha);
        return ResponseEntity.ok(loginAtualizado);
    }

    @DeleteMapping("/deletar/{id}")
    public ResponseEntity<?> deletar(
            @RequestHeader("Authorization") String token,
            @PathVariable Long id) {

        if (!isAuthorized(token)) {
            return ResponseEntity.status(403)
                    .body(Map.of("error", "Acesso negado. Apenas usuários autenticados podem deletar logins."));
        }

        loginService.deleteLogin(id);
        return ResponseEntity.ok(Map.of("message", "Usuário deletado com sucesso."));
    }
}
