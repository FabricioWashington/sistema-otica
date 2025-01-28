package com.fabriciodev.repository.cliente;

import com.fabriciodev.model.cliente.PessoaJuridica;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PessoaJuridicaRepository extends JpaRepository<PessoaJuridica, Long> {
    List<PessoaJuridica> findByIdEmpresa(Integer idEmpresa);
}
