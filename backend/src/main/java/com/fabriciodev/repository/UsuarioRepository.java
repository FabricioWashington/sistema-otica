package com.fabriciodev.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fabriciodev.model.Usuario;

import java.util.Optional;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
        Optional<Usuario> findByLoginUsuarioAndLoginSenhaAndTiposLoginIdAndIdEmpresa(String loginUsuario,
                        String loginSenha,
                        Integer idTiposLogin, Integer idEmpresa);

        boolean existsByLoginUsuarioAndTiposLoginIdAndIdEmpresa(String loginUsuario, Integer idTiposLogin,
                        Integer idEmpresa);

        Optional<Usuario> findByLoginUsuario(String loginUsuario);

        Optional<Usuario> findByLoginUsuarioAndTiposLoginIdAndIdEmpresa(String loginUsuario, Integer idTiposLogin,
                        Integer idEmpresa);
}
