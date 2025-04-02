package com.fabriciodev.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.fabriciodev.model.Usuario;
import com.fabriciodev.repository.UsuarioRepository;

import java.util.Optional;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public Optional<Usuario> autenticar(String loginUsuario, String loginSenha, Integer idTiposLogin,
            Integer idEmpresa) {
        return usuarioRepository.findByLoginUsuarioAndLoginSenhaAndTiposLoginIdAndIdEmpresa(loginUsuario, loginSenha,
                idTiposLogin, idEmpresa);
    }

    public boolean verificarUsuarioCadastrado(String loginUsuario, Integer idTiposLogin, Integer idEmpresa) {
        return usuarioRepository.existsByLoginUsuarioAndTiposLoginIdAndIdEmpresa(loginUsuario, idTiposLogin, idEmpresa);
    }

    public Usuario salvar(Usuario login) {
        login.setLoginSenha(passwordEncoder.encode(login.getLoginSenha()));
        return usuarioRepository.save(login);
    }

    public Usuario updateLogin(Long id, String novaSenha) {
        return usuarioRepository.findById(id).map(login -> {
            login.setLoginSenha(passwordEncoder.encode(novaSenha));
            return usuarioRepository.save(login);
        }).orElseThrow(() -> new IllegalArgumentException("Usuário não encontrado!"));
    }

    public void deleteLogin(Long id) {
        if (!usuarioRepository.existsById(id)) {
            throw new IllegalArgumentException("Usuário não encontrado!");
        }
        usuarioRepository.deleteById(id);
    }
}
