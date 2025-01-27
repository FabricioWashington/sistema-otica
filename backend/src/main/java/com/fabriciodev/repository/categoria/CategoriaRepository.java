package com.fabriciodev.repository.categoria;

import com.fabriciodev.model.categoria.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoriaRepository extends JpaRepository<Categoria, Long> {
    List<Categoria> findByIdEmpresa(Integer idEmpresa);
}
