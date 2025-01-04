package com.fabriciodev.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fabriciodev.model.Login;
import com.fabriciodev.repository.LoginRepository;

import java.util.Optional;

@Service
public class LoginService {

    @Autowired
    private LoginRepository loginRepository;

    public Optional<Login> autenticar(String loginUsuario, String loginSenha, Long idTiposLogin) {
        return loginRepository.findByLoginUsuarioAndLoginSenhaAndTiposLoginId(loginUsuario, loginSenha, idTiposLogin);
    }

    public boolean verificarUsuarioCadastrado(String loginUsuario, Long idTiposLogin) {
        return loginRepository.existsByLoginUsuarioAndTiposLoginId(loginUsuario, idTiposLogin);
    }

    public Login salvar(Login login) {
        return loginRepository.save(login);
    }
}