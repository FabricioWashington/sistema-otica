package com.fabriciodev.repository.tiposlogin;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fabriciodev.model.tiposlogin.TiposLogin;

public interface TiposLoginRepository extends JpaRepository<TiposLogin, Long> {
    List<TiposLogin> findByIdEmpresa(Integer idEmpresa);
}