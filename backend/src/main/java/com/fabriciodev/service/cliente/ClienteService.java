package com.fabriciodev.service.cliente;

import com.fabriciodev.dto.cliente.ClienteDTO;
import com.fabriciodev.model.cliente.Cliente;
import com.fabriciodev.repository.cliente.ClienteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ClienteService {

    @Autowired
    private ClienteRepository repository;

    public ClienteDTO create(ClienteDTO dto) {
        Cliente cliente = new Cliente();
        cliente.setNome(dto.getNome());
        cliente.setIdEndereco(dto.getIdEndereco());
        cliente.setIdContato(dto.getIdContato());
        cliente.setDataCadastro(dto.getDataCadastro());
        cliente.setDataModificacao(dto.getDataModificacao());
        cliente.setIdEmpresa(dto.getIdEmpresa());

        Cliente savedCliente = repository.save(cliente);
        return mapToDTO(savedCliente);
    }

    public List<ClienteDTO> getAllByEmpresa(Integer idEmpresa) {
        return repository.findByIdEmpresa(idEmpresa)
                .stream()
                .map(this::mapToDTO)
                .collect(Collectors.toList());
    }

    public ClienteDTO getById(Long id) {
        return repository.findById(id)
                .map(this::mapToDTO)
                .orElseThrow(() -> new RuntimeException("Cliente não encontrado!"));
    }

    public ClienteDTO update(Long id, ClienteDTO dto) {
        Cliente cliente = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Cliente não encontrado!"));

        cliente.setNome(dto.getNome());
        cliente.setIdEndereco(dto.getIdEndereco());
        cliente.setIdContato(dto.getIdContato());
        cliente.setDataModificacao(dto.getDataModificacao());
        cliente.setIdEmpresa(dto.getIdEmpresa());

        Cliente updatedCliente = repository.save(cliente);
        return mapToDTO(updatedCliente);
    }

    public void delete(Long id) {
        repository.deleteById(id);
    }

    private ClienteDTO mapToDTO(Cliente cliente) {
        ClienteDTO dto = new ClienteDTO();
        dto.setIdClientes(cliente.getIdClientes());
        dto.setNome(cliente.getNome());
        dto.setIdEndereco(cliente.getIdEndereco());
        dto.setIdContato(cliente.getIdContato());
        dto.setDataCadastro(cliente.getDataCadastro());
        dto.setDataModificacao(cliente.getDataModificacao());
        dto.setIdEmpresa(cliente.getIdEmpresa());
        return dto;
    }
}
