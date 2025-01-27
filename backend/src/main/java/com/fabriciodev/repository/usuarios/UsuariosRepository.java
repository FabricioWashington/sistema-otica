package com.fabriciodev.repository.usuarios;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.fabriciodev.model.usuarios.Usuarios;

@Repository
public interface UsuariosRepository extends JpaRepository<Usuarios, Long> {
    boolean existsByCpf(String cpf);
    List<Usuarios> findByIdEmpresa(Integer idEmpresa);
}
