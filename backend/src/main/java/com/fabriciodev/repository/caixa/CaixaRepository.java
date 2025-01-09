package com.fabriciodev.repository.caixa;

import com.fabriciodev.model.caixa.Caixa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CaixaRepository extends JpaRepository<Caixa, Long> {
    Caixa findFirstByStatus(String status);
}
