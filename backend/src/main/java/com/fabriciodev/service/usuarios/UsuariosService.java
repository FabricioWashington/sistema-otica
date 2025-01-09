package com.fabriciodev.service.usuarios;

import com.fabriciodev.dto.usuarios.UsuariosDTO;
import com.fabriciodev.model.usuarios.Usuarios;
import com.fabriciodev.repository.usuarios.UsuariosRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UsuariosService {

    @Autowired
    private UsuariosRepository repository;

    public UsuariosDTO create(UsuariosDTO dto) {
        if (repository.existsByCpf(dto.getCpf())) {
            throw new IllegalArgumentException("CPF já cadastrado.");
        }
        Usuarios usuario = new Usuarios();
        usuario.setCpf(dto.getCpf());
        usuario.setNomeCompleto(dto.getNomeCompleto());
        usuario.setDataCadastro(new Date());
        usuario.setDataModificacao(new Date());

        Usuarios savedUsuario = repository.save(usuario);

        return convertToDTO(savedUsuario);
    }

    public List<UsuariosDTO> getAll() {
        return repository.findAll().stream().map(this::convertToDTO).collect(Collectors.toList());
    }

    public UsuariosDTO getById(Long id) {
        Usuarios usuario = repository.findById(id).orElseThrow(() -> new IllegalArgumentException("Usuário não encontrado."));
        return convertToDTO(usuario);
    }

    public UsuariosDTO update(Long id, UsuariosDTO dto) {
        Usuarios usuario = repository.findById(id).orElseThrow(() -> new IllegalArgumentException("Usuário não encontrado."));
        usuario.setCpf(dto.getCpf());
        usuario.setNomeCompleto(dto.getNomeCompleto());
        usuario.setDataModificacao(new Date());

        Usuarios updatedUsuario = repository.save(usuario);

        return convertToDTO(updatedUsuario);
    }

    public void delete(Long id) {
        if (!repository.existsById(id)) {
            throw new IllegalArgumentException("Usuário não encontrado.");
        }
        repository.deleteById(id);
    }

    private UsuariosDTO convertToDTO(Usuarios usuario) {
        UsuariosDTO dto = new UsuariosDTO();
        dto.setId(usuario.getId());
        dto.setCpf(usuario.getCpf());
        dto.setNomeCompleto(usuario.getNomeCompleto());
        dto.setDataCadastro(usuario.getDataCadastro());
        dto.setDataModificacao(usuario.getDataModificacao());
        return dto;
    }
}
