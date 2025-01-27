package com.fabriciodev.service.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fabriciodev.model.login.Login;
import com.fabriciodev.repository.login.LoginRepository;

import java.util.Optional;

@Service
public class LoginService {

    @Autowired
    private LoginRepository loginRepository;

    public Optional<Login> autenticar(String loginUsuario, String loginSenha, Long idTiposLogin, Integer idEmpresa) {
        return loginRepository.findByLoginUsuarioAndLoginSenhaAndTiposLoginIdAndIdEmpresa(loginUsuario, loginSenha, idTiposLogin, idEmpresa);
    }

    public boolean verificarUsuarioCadastrado(String loginUsuario, Long idTiposLogin, Integer idEmpresa) {
        return loginRepository.existsByLoginUsuarioAndTiposLoginIdAndIdEmpresa(loginUsuario, idTiposLogin, idEmpresa);
    }

    public Login salvar(Login login) {
        return loginRepository.save(login);
    }
}
