package com.fabriciodev.repository.unidade;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fabriciodev.model.unidade.Unidade;

public interface UnidadeRepository extends JpaRepository<Unidade, Long> {
    boolean existsByDescricao(String descricao);
}