package com.fabriciodev.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fabriciodev.model.Unidade;

public interface UnidadeRepository extends JpaRepository<Unidade, Long> {
    boolean existsByDescricao(String descricao);
}