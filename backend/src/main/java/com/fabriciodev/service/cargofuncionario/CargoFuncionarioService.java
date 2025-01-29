package com.fabriciodev.service.cargofuncionario;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fabriciodev.dto.cargofuncionario.CargoFuncionarioDTO;
import com.fabriciodev.model.cargofuncionario.CargoFuncionario;
import com.fabriciodev.repository.cargofuncionario.CargoFuncionarioRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CargoFuncionarioService {

    @Autowired
    private CargoFuncionarioRepository repository;

    public CargoFuncionarioDTO create(CargoFuncionarioDTO dto) {
        CargoFuncionario cargo = new CargoFuncionario();
        cargo.setCargo(dto.getCargo());
        cargo.setSalario(dto.getSalario());
        cargo.setIdEmpresa(dto.getIdEmpresa());
        CargoFuncionario savedCargo = repository.save(cargo);
        return mapToDTO(savedCargo);
    }

    public List<CargoFuncionarioDTO> getAllByEmpresa(Integer idEmpresa) {
        return repository.findByIdEmpresa(idEmpresa).stream()
                .map(this::mapToDTO)
                .collect(Collectors.toList());
    }

    public CargoFuncionarioDTO getById(Long id) {
        return repository.findById(id).map(this::mapToDTO)
                .orElseThrow(() -> new RuntimeException("Cargo não encontrado!"));
    }

    public CargoFuncionarioDTO update(Long id, CargoFuncionarioDTO dto) {
        CargoFuncionario cargo = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Cargo não encontrado!"));
        cargo.setCargo(dto.getCargo());
        cargo.setSalario(dto.getSalario());
        cargo.setIdEmpresa(dto.getIdEmpresa()); 
        CargoFuncionario updatedCargo = repository.save(cargo);
        return mapToDTO(updatedCargo);
    }

    public void delete(Long id) {
        repository.deleteById(id);
    }

    private CargoFuncionarioDTO mapToDTO(CargoFuncionario cargo) {
        CargoFuncionarioDTO dto = new CargoFuncionarioDTO();
        dto.setId(cargo.getId());
        dto.setCargo(cargo.getCargo());
        dto.setSalario(cargo.getSalario());
        dto.setIdEmpresa(cargo.getIdEmpresa()); 
        return dto;
    }
}
