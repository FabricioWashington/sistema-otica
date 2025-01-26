package com.fabriciodev.service.endereco;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fabriciodev.dto.endereco.EnderecoDTO;
import com.fabriciodev.model.endereco.Endereco;
import com.fabriciodev.repository.endereco.EnderecoRepository;

import java.util.List;

@Service
public class EnderecoService {

    @Autowired
    private EnderecoRepository enderecoRepository;

    public Endereco salvarEndereco(EnderecoDTO enderecoDTO) {
        Endereco endereco = new Endereco();
        endereco.setLogradouro(enderecoDTO.getLogradouro());
        endereco.setBairro(enderecoDTO.getBairro());
        endereco.setNumero(enderecoDTO.getNumero());
        endereco.setComplemento(enderecoDTO.getComplemento());
        endereco.setCep(enderecoDTO.getCep());
        endereco.setUf(enderecoDTO.getUf());
        endereco.setMunicipio(enderecoDTO.getMunicipio());

        return enderecoRepository.save(endereco);
    }

    public List<Endereco> listarEnderecos() {
        return enderecoRepository.findAll();
    }

    public Endereco consultarEndereco(Integer idEndereco) {
        return enderecoRepository.findById(idEndereco)
                .orElseThrow(() -> new IllegalArgumentException("Endereço não encontrado."));
    }

    public Endereco atualizarEndereco(Integer idEndereco, EnderecoDTO enderecoDTO) {
        Endereco endereco = consultarEndereco(idEndereco);

        endereco.setLogradouro(enderecoDTO.getLogradouro());
        endereco.setBairro(enderecoDTO.getBairro());
        endereco.setNumero(enderecoDTO.getNumero());
        endereco.setComplemento(enderecoDTO.getComplemento());
        endereco.setCep(enderecoDTO.getCep());
        endereco.setUf(enderecoDTO.getUf());
        endereco.setMunicipio(enderecoDTO.getMunicipio());

        return enderecoRepository.save(endereco);
    }

    public void excluirEndereco(Integer idEndereco) {
        if (!enderecoRepository.existsById(idEndereco)) {
            throw new IllegalArgumentException("Endereço não encontrado.");
        }
        enderecoRepository.deleteById(idEndereco);
    }
}