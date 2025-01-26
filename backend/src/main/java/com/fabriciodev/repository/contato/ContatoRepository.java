package com.fabriciodev.repository.contato;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fabriciodev.model.contato.Contato;

@Repository
public interface ContatoRepository extends JpaRepository<Contato, Integer> {
}