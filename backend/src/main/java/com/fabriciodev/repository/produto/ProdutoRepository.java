package com.fabriciodev.repository.produto;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fabriciodev.model.produto.Produto;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProdutoRepository extends JpaRepository<Produto, Long> {
    List<Produto> findByIdEmpresa(Integer idEmpresa);
    Optional<Produto> findByNomeProduto(String nomeProduto);
}
