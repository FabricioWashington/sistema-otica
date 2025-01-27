package com.fabriciodev.service.LoginEmpresa;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fabriciodev.model.empresa.Empresa;
import com.fabriciodev.repository.empresa.EmpresaRepository;


@Service
public class LoginEmpresaService {

    @Autowired
    private EmpresaRepository empresaRepository;


    public Integer autenticarCnpj(String cnpj, String senha) {
        if (!cnpj.matches("\\d{2}\\.\\d{3}\\.\\d{3}/\\d{4}-\\d{2}")) {
            return null;
        }

        Empresa empresa = empresaRepository.findByCnpjAndSenha(cnpj, senha);

        return (empresa != null) ? empresa.getIdEmpresa() : null;
    }
    
}