package com.fabriciodev.service.produto;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fabriciodev.dto.produto.ProdutoDTO;
import com.fabriciodev.model.produto.Produto;
import com.fabriciodev.repository.produto.ProdutoRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProdutoService {

    private final ProdutoRepository produtoRepository;

    public List<Produto> listarTodos() {
        return produtoRepository.findAll();
    }

    public Produto buscarPorId(Long id) {
        return produtoRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Produto não encontrado: " + id));
    }

    public Produto buscarPorCodigoDeBarras(String codigoDeBarras) {
        return produtoRepository.findByCodigoDeBarras(codigoDeBarras)
                .orElseThrow(() -> new RuntimeException("Produto não encontrado pelo código de barras: " + codigoDeBarras));
    }

    @Transactional
    public Produto salvar(Produto produto) {
        return produtoRepository.save(produto);
    }

    @Transactional
    public Produto atualizar(Long id, ProdutoDTO dto) {
        Produto produto = buscarPorId(id);

        produto.setNomeProduto(dto.getNomeProduto());
        produto.setIdUnidade(dto.getIdUnidade());
        produto.setIdCategoria(dto.getIdCategoria());
        produto.setPreco(dto.getPreco());
        produto.setData(dto.getData());
        produto.setImagem(dto.getImagem());
        produto.setCodigoDeBarras(dto.getCodigoDeBarras());
        produto.setObservacoes(dto.getObservacoes());
        produto.setIdEmpresa(dto.getIdEmpresa());

        return produtoRepository.save(produto);
    }

    @Transactional
    public void excluir(Long id) {
        if (!produtoRepository.existsById(id)) {
            throw new RuntimeException("Produto não encontrado: " + id);
        }
        produtoRepository.deleteById(id);
    }
}