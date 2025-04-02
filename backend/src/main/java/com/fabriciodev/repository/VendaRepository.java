package com.fabriciodev.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fabriciodev.model.Venda;

@Repository
public interface VendaRepository extends JpaRepository<Venda, Long> {
}