package com.fabriciodev.service.unidade;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;
import com.fabriciodev.dto.unidade.UnidadeDTO;
import com.fabriciodev.model.unidade.Unidade;
import com.fabriciodev.repository.unidade.UnidadeRepository;

@Service
public class UnidadeService {

    @Autowired
    private UnidadeRepository repository;

    public List<UnidadeDTO> listarTodos() {
        return repository.findAll().stream()
                .map(unidade -> new UnidadeDTO(unidade.getId(), unidade.getDescricao()))
                .collect(Collectors.toList());
    }

    public UnidadeDTO buscarPorId(Long id) {
        return repository.findById(id)
                .map(unidade -> new UnidadeDTO(unidade.getId(), unidade.getDescricao()))
                .orElse(null);
    }

    public UnidadeDTO criar(UnidadeDTO dto) {
        if (repository.existsByDescricao(dto.getDescricao())) {
            throw new IllegalArgumentException("Unidade já cadastrada");
        }
        Unidade unidade = new Unidade();
        unidade.setDescricao(dto.getDescricao());
        unidade = repository.save(unidade);
        return new UnidadeDTO(unidade.getId(), unidade.getDescricao());
    }

    public UnidadeDTO atualizar(Long id, UnidadeDTO dto) {
        return repository.findById(id).map(unidade -> {
            unidade.setDescricao(dto.getDescricao());
            unidade = repository.save(unidade);
            return new UnidadeDTO(unidade.getId(), unidade.getDescricao());
        }).orElse(null);
    }

    public boolean deletar(Long id) {
        if (repository.existsById(id)) {
            repository.deleteById(id);
            return true;
        }
        return false;
    }
}