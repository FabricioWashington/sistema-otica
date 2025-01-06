package com.fabriciodev.repository.tiposlogin;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fabriciodev.model.tiposlogin.TiposLogin;

public interface TiposLoginRepository extends JpaRepository<TiposLogin, Long> {
}