package com.fabriciodev.repository.caixa;

import com.fabriciodev.model.caixa.Caixa;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CaixaRepository extends JpaRepository<Caixa, Long> {
List<Caixa> findByIdEmpresa(Integer idEmpresa);
    Caixa findFirstByStatus(String status);
    Optional<Caixa> findFirstByStatusAndIdEmpresa(String status, Integer idEmpresa);
}
