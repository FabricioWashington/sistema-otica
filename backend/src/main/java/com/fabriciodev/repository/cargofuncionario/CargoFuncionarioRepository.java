package com.fabriciodev.repository.cargofuncionario;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fabriciodev.model.cargofuncionario.CargoFuncionario;

@Repository
public interface CargoFuncionarioRepository extends JpaRepository<CargoFuncionario, Long> {
}
