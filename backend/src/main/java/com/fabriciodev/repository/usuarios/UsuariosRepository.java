package com.fabriciodev.repository.usuarios;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.fabriciodev.model.usuarios.Usuarios;

@Repository
public interface UsuariosRepository extends JpaRepository<Usuarios, Long> {
    boolean existsByCpf(String cpf);
}
