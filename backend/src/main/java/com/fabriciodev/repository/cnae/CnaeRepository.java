package com.fabriciodev.repository.cnae;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.fabriciodev.model.cnae.Cnae;

@Repository
public interface CnaeRepository extends JpaRepository<Cnae, Integer> {
}
