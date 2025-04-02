package com.fabriciodev.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fabriciodev.model.Cnae;

@Repository
public interface CnaeRepository extends JpaRepository<Cnae, Integer> {
}
