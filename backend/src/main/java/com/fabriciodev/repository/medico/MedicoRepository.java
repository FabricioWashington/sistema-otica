package com.fabriciodev.repository.medico;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.fabriciodev.model.medico.Medico;

@Repository
public interface MedicoRepository extends JpaRepository<Medico, Long> {
    boolean existsByRegistroProfissional(String registroProfissional);
    List<Medico> findByIdEmpresa(Integer idEmpresa);
}
