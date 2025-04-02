package com.fabriciodev.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fabriciodev.model.Caixa;

@Repository
public interface CaixaRepository extends JpaRepository<Caixa, Long> {
    List<Caixa> findByIdEmpresa(Integer idEmpresa);

    Caixa findFirstByStatus(String status);

    Optional<Caixa> findFirstByStatusAndIdEmpresa(String status, Integer idEmpresa);
}
