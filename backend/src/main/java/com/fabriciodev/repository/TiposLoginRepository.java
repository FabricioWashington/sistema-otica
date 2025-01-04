package com.fabriciodev.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fabriciodev.model.TiposLogin;

public interface TiposLoginRepository extends JpaRepository<TiposLogin, Long> {
}