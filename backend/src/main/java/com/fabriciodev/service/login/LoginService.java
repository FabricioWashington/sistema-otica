package com.fabriciodev.service.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.fabriciodev.model.login.Login;
import com.fabriciodev.repository.login.LoginRepository;

import java.util.Optional;

@Service
public class LoginService {

    @Autowired
    private LoginRepository loginRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public Optional<Login> autenticar(String loginUsuario, String loginSenha, Long idTiposLogin, Integer idEmpresa) {
        return loginRepository.findByLoginUsuarioAndLoginSenhaAndTiposLoginIdAndIdEmpresa(loginUsuario, loginSenha, idTiposLogin, idEmpresa);
    }

    public boolean verificarUsuarioCadastrado(String loginUsuario, Long idTiposLogin, Integer idEmpresa) {
        return loginRepository.existsByLoginUsuarioAndTiposLoginIdAndIdEmpresa(loginUsuario, idTiposLogin, idEmpresa);
    }

    public Login salvar(Login login) {
        login.setLoginSenha(passwordEncoder.encode(login.getLoginSenha()));
        return loginRepository.save(login);
    }

    public Login updateLogin(Long id, String novaSenha) {
        return loginRepository.findById(id).map(login -> {
            login.setLoginSenha(passwordEncoder.encode(novaSenha));
            return loginRepository.save(login);
        }).orElseThrow(() -> new IllegalArgumentException("Usuário não encontrado!"));
    }

    public void deleteLogin(Long id) {
        if (!loginRepository.existsById(id)) {
            throw new IllegalArgumentException("Usuário não encontrado!");
        }
        loginRepository.deleteById(id);
    }
}
