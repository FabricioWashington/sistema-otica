package com.fabriciodev.repository.cliente;

import com.fabriciodev.model.cliente.PessoaFisica;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PessoaFisicaRepository extends JpaRepository<PessoaFisica, Long> {
    List<PessoaFisica> findByIdEmpresa(Integer idEmpresa);
}
