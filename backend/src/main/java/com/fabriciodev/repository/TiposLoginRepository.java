package com.fabriciodev.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fabriciodev.model.TiposLogin;

public interface TiposLoginRepository extends JpaRepository<TiposLogin, Long> {
    List<TiposLogin> findByIdEmpresa(Integer idEmpresa);
}