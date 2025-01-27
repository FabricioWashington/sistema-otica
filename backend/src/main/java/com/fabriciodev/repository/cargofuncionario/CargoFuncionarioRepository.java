package com.fabriciodev.repository.cargofuncionario;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fabriciodev.model.cargofuncionario.CargoFuncionario;

import java.util.List;

@Repository
public interface CargoFuncionarioRepository extends JpaRepository<CargoFuncionario, Long> {
    List<CargoFuncionario> findByIdEmpresa(Integer idEmpresa); 
}
