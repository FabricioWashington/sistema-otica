package com.fabriciodev.service.categoria;

import com.fabriciodev.dto.categoria.CategoriaDTO;
import com.fabriciodev.model.categoria.Categoria;
import com.fabriciodev.repository.categoria.CategoriaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CategoriaService {

    @Autowired
    private CategoriaRepository repository;

    public CategoriaDTO cadastrarCategoria(CategoriaDTO dto) {
        Categoria categoria = new Categoria();
        categoria.setNomeCategoria(dto.getNomeCategoria());
        categoria.setIdEmpresa(dto.getIdEmpresa());

        Categoria savedCategoria = repository.save(categoria);
        return convertToDTO(savedCategoria);
    }

    public List<CategoriaDTO> listarCategorias(Integer idEmpresa) {
        return repository.findByIdEmpresa(idEmpresa).stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    public CategoriaDTO atualizarCategoria(Long id, CategoriaDTO dto) {
        Categoria categoria = repository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Categoria não encontrada"));

        categoria.setNomeCategoria(dto.getNomeCategoria());
        categoria.setIdEmpresa(dto.getIdEmpresa());
        Categoria updatedCategoria = repository.save(categoria);
        return convertToDTO(updatedCategoria);
    }

    public void excluirCategoria(Long id) {
        if (!repository.existsById(id)) {
            throw new IllegalArgumentException("Categoria não encontrada");
        }
        repository.deleteById(id);
    }

    private CategoriaDTO convertToDTO(Categoria categoria) {
        CategoriaDTO dto = new CategoriaDTO();
        dto.setId(categoria.getId());
        dto.setNomeCategoria(categoria.getNomeCategoria());
        dto.setIdEmpresa(categoria.getIdEmpresa());
        return dto;
    }
}
