package com.fabriciodev.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fabriciodev.model.Login;

import java.util.Optional;

public interface LoginRepository extends JpaRepository<Login, Long> {
        Optional<Login> findByLoginUsuarioAndLoginSenhaAndTiposLoginIdAndIdEmpresa(String loginUsuario,
                        String loginSenha,
                        Long idTiposLogin, Integer idEmpresa);

        boolean existsByLoginUsuarioAndTiposLoginIdAndIdEmpresa(String loginUsuario, Long idTiposLogin,
                        Integer idEmpresa);

        Optional<Login> findByLoginUsuario(String loginUsuario);

        Optional<Login> findByLoginUsuarioAndTiposLoginIdAndIdEmpresa(String loginUsuario, Long idTiposLogin,
                        Integer idEmpresa);
}
