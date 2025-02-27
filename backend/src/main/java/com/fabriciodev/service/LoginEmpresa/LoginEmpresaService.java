package com.fabriciodev.service.LoginEmpresa;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.fabriciodev.model.empresa.Empresa;
import com.fabriciodev.repository.empresa.EmpresaRepository;

import java.util.Optional;

@Service
public class LoginEmpresaService {

    @Autowired
    private EmpresaRepository empresaRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public Optional<Empresa> autenticarCnpj(String cnpj, String senha) {
        Optional<Empresa> empresaOptional = empresaRepository.findByCnpj(cnpj);
        System.out.println("Empresa encontrada: " + empresaOptional);

        if (empresaOptional.isPresent()) {
            Empresa empresa = empresaOptional.get();
            // System.out.println("Senha salva no banco: " + empresa.getSenha());
            // System.out.println("Senha digitada pelo usuário: " + senha);

            if (!passwordEncoder.matches(senha, empresa.getSenha().trim())) {
                return Optional.of(empresa);
            } else {
                // System.out.println("Erro: Senha incorreta.");
            }
        } else {
            // System.out.println("Erro: CNPJ não encontrado.");
        }
        return Optional.empty();
    }

}