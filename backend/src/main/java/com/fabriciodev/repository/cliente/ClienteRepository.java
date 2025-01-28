package com.fabriciodev.repository.cliente;

import com.fabriciodev.model.cliente.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClienteRepository extends JpaRepository<Cliente, Long> {
    List<Cliente> findByIdEmpresa(Integer idEmpresa);
}
