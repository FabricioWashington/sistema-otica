package com.fabriciodev.service.cliente;

import com.fabriciodev.dto.cliente.PessoaFisicaDTO;
import com.fabriciodev.model.cliente.PessoaFisica;
import com.fabriciodev.repository.cliente.PessoaFisicaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class PessoaFisicaService {

    @Autowired
    private PessoaFisicaRepository repository;

    public PessoaFisicaDTO create(PessoaFisicaDTO dto) {
        PessoaFisica pessoa = new PessoaFisica();
        pessoa.setCpf(dto.getCpf());
        pessoa.setIdCliente(dto.getIdCliente());
        pessoa.setIdEmpresa(dto.getIdEmpresa());

        PessoaFisica savedPessoa = repository.save(pessoa);
        return mapToDTO(savedPessoa);
    }

    public List<PessoaFisicaDTO> getAllByEmpresa(Integer idEmpresa) {
        return repository.findByIdEmpresa(idEmpresa)
                .stream()
                .map(this::mapToDTO)
                .collect(Collectors.toList());
    }

    public PessoaFisicaDTO getById(Long id) {
        return repository.findById(id)
                .map(this::mapToDTO)
                .orElseThrow(() -> new RuntimeException("Pessoa Física não encontrada!"));
    }

    public PessoaFisicaDTO update(Long id, PessoaFisicaDTO dto) {
        PessoaFisica pessoa = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Pessoa Física não encontrada!"));

        pessoa.setCpf(dto.getCpf());
        pessoa.setIdCliente(dto.getIdCliente());
        pessoa.setIdEmpresa(dto.getIdEmpresa());

        PessoaFisica updatedPessoa = repository.save(pessoa);
        return mapToDTO(updatedPessoa);
    }

    public void delete(Long id) {
        repository.deleteById(id);
    }

    private PessoaFisicaDTO mapToDTO(PessoaFisica pessoa) {
        PessoaFisicaDTO dto = new PessoaFisicaDTO();
        dto.setId(pessoa.getId());
        dto.setCpf(pessoa.getCpf());
        dto.setIdCliente(pessoa.getIdCliente());
        dto.setIdEmpresa(pessoa.getIdEmpresa());
        return dto;
    }
}
