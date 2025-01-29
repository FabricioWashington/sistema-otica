package com.fabriciodev.service.medico;

import com.fabriciodev.dto.medico.MedicoDTO;
import com.fabriciodev.model.medico.Medico;
import com.fabriciodev.repository.medico.MedicoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class MedicoService {

    @Autowired
    private MedicoRepository repository;

    public MedicoDTO create(MedicoDTO dto) {
        if (repository.existsByRegistroProfissional(dto.getRegistroProfissional())) {
            throw new IllegalArgumentException("Registro profissional já cadastrado.");
        }

        Medico medico = new Medico();
        medico.setNome(dto.getNome());
        medico.setRegistroProfissional(dto.getRegistroProfissional());
        medico.setIdEndereco(dto.getIdEndereco());
        medico.setIdContato(dto.getIdContato());
        medico.setIdEmpresa(dto.getIdEmpresa());
        medico.setDataCadastro(new Date());

        Medico savedMedico = repository.save(medico);

        return convertToDTO(savedMedico);
    }

    public List<MedicoDTO> getAllByEmpresa(Integer idEmpresa) {
        return repository.findByIdEmpresa(idEmpresa).stream().map(this::convertToDTO).collect(Collectors.toList());
    }

    public MedicoDTO getById(Long id) {
        Medico medico = repository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Médico não encontrado."));
        return convertToDTO(medico);
    }

    public MedicoDTO update(Long id, MedicoDTO dto) {
        Medico medico = repository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Médico não encontrado."));

        medico.setNome(dto.getNome());
        medico.setRegistroProfissional(dto.getRegistroProfissional());
        medico.setIdEndereco(dto.getIdEndereco());
        medico.setIdContato(dto.getIdContato());
        medico.setIdEmpresa(dto.getIdEmpresa());

        Medico updatedMedico = repository.save(medico);

        return convertToDTO(updatedMedico);
    }

    public void delete(Long id) {
        if (!repository.existsById(id)) {
            throw new IllegalArgumentException("Médico não encontrado.");
        }
        repository.deleteById(id);
    }

    private MedicoDTO convertToDTO(Medico medico) {
        MedicoDTO dto = new MedicoDTO();
        dto.setId(medico.getId());
        dto.setNome(medico.getNome());
        dto.setRegistroProfissional(medico.getRegistroProfissional());
        dto.setIdEndereco(medico.getIdEndereco());
        dto.setIdContato(medico.getIdContato());
        dto.setIdEmpresa(medico.getIdEmpresa());
        dto.setDataCadastro(medico.getDataCadastro());
        return dto;
    }
}
