package com.fabriciodev.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fabriciodev.model.PessoaFisica;

import java.util.List;

@Repository
public interface PessoaFisicaRepository extends JpaRepository<PessoaFisica, Long> {
    List<PessoaFisica> findByIdEmpresa(Integer idEmpresa);
}
