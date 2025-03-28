package com.fabriciodev.service.LoginEmpresa;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.fabriciodev.dto.EmpresaDTO;
import com.fabriciodev.model.Empresa;
import com.fabriciodev.repository.EmpresaRepository;

import java.util.Optional;

@Service
public class LoginEmpresaService {

    @Autowired
    private EmpresaRepository empresaRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private ModelMapper modelMapper;

    public Optional<EmpresaDTO> autenticarCnpj(String cnpj, String senha) {
        Optional<Empresa> empresaOptional = empresaRepository.findByCnpj(cnpj);

        if (empresaOptional.isPresent()) {
            Empresa empresa = empresaOptional.get();

            if (passwordEncoder.matches(senha, empresa.getSenha().trim())) {
                EmpresaDTO empresaDTO = modelMapper.map(empresa, EmpresaDTO.class);
                empresaDTO.setSenha(null);
                return Optional.of(empresaDTO);
            }
        }

        return Optional.empty();
    }
}
