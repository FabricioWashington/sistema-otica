package com.fabriciodev.repository.login;


import org.springframework.data.jpa.repository.JpaRepository;

import com.fabriciodev.model.login.Login;

import java.util.Optional;

public interface LoginRepository extends JpaRepository<Login, Long> {
    Optional<Login> findByLoginUsuarioAndLoginSenhaAndTiposLoginId(String loginUsuario, String loginSenha, Long idTiposLogin);
    boolean existsByLoginUsuarioAndTiposLoginId(String loginUsuario, Long idTiposLogin);
}
