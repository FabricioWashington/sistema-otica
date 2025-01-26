package com.fabriciodev.service.LoginEmpresa;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fabriciodev.model.empresa.Empresa;
import com.fabriciodev.repository.empresa.EmpresaRepository;

@Service
public class LoginEmpresaService {

    @Autowired
    private EmpresaRepository empresaRepository;

    public boolean autenticar(String cnpj, String email, String senha) {
        Empresa empresa = empresaRepository.findByCnpj(cnpj).orElse(null);
        if (empresa == null) {
            return false; 
        }

        return empresa.getSenha().equals(senha);
    }
}