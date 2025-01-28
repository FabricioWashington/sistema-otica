package com.fabriciodev.service.cliente;

import com.fabriciodev.dto.cliente.PessoaJuridicaDTO;
import com.fabriciodev.model.cliente.PessoaJuridica;
import com.fabriciodev.repository.cliente.PessoaJuridicaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class PessoaJuridicaService {

    @Autowired
    private PessoaJuridicaRepository repository;

    public PessoaJuridicaDTO create(PessoaJuridicaDTO dto) {
        PessoaJuridica pessoa = new PessoaJuridica();
        pessoa.setCnpj(dto.getCnpj());
        pessoa.setNomeFantasia(dto.getNomeFantasia());
        pessoa.setInscricaoEstadual(dto.getInscricaoEstadual());
        pessoa.setInscricaoMunicipal(dto.getInscricaoMunicipal());
        pessoa.setIdCliente(dto.getIdCliente());
        pessoa.setIdEmpresa(dto.getIdEmpresa());

        PessoaJuridica savedPessoa = repository.save(pessoa);
        return mapToDTO(savedPessoa);
    }

    public List<PessoaJuridicaDTO> getAllByEmpresa(Integer idEmpresa) {
        return repository.findByIdEmpresa(idEmpresa)
                .stream()
                .map(this::mapToDTO)
                .collect(Collectors.toList());
    }

    public PessoaJuridicaDTO getById(Long id) {
        return repository.findById(id)
                .map(this::mapToDTO)
                .orElseThrow(() -> new RuntimeException("Pessoa Jurídica não encontrada!"));
    }

    public PessoaJuridicaDTO update(Long id, PessoaJuridicaDTO dto) {
        PessoaJuridica pessoa = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Pessoa Jurídica não encontrada!"));

        pessoa.setCnpj(dto.getCnpj());
        pessoa.setNomeFantasia(dto.getNomeFantasia());
        pessoa.setInscricaoEstadual(dto.getInscricaoEstadual());
        pessoa.setInscricaoMunicipal(dto.getInscricaoMunicipal());
        pessoa.setIdCliente(dto.getIdCliente());
        pessoa.setIdEmpresa(dto.getIdEmpresa());

        PessoaJuridica updatedPessoa = repository.save(pessoa);
        return mapToDTO(updatedPessoa);
    }

    public void delete(Long id) {
        repository.deleteById(id);
    }

    private PessoaJuridicaDTO mapToDTO(PessoaJuridica pessoa) {
        PessoaJuridicaDTO dto = new PessoaJuridicaDTO();
        dto.setId(pessoa.getId());
        dto.setCnpj(pessoa.getCnpj());
        dto.setNomeFantasia(pessoa.getNomeFantasia());
        dto.setInscricaoEstadual(pessoa.getInscricaoEstadual());
        dto.setInscricaoMunicipal(pessoa.getInscricaoMunicipal());
        dto.setIdCliente(pessoa.getIdCliente());
        dto.setIdEmpresa(pessoa.getIdEmpresa());
        return dto;
    }
}
