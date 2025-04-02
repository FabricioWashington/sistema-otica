package com.fabriciodev.service;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.fabriciodev.dto.EmpresaDTO;
import com.fabriciodev.model.Empresa;
import com.fabriciodev.model.Usuario;
import com.fabriciodev.model.TiposLogin;
import com.fabriciodev.repository.EmpresaRepository;
import com.fabriciodev.repository.UsuarioRepository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class EmpresaService {

    private final UsuarioRepository usuarioRepository;

    @Autowired
    private EmpresaRepository empresaRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private ModelMapper modelMapper;

    EmpresaService(UsuarioRepository usuarioRepository) {
        this.usuarioRepository = usuarioRepository;
    }

    public Empresa createEmpresa(EmpresaDTO empresaDTO) {
        Empresa empresa = modelMapper.map(empresaDTO, Empresa.class);
        empresa.setSenha(passwordEncoder.encode(empresaDTO.getSenha()));
        Empresa empresaSalva = empresaRepository.save(empresa);

        Usuario usuario = new Usuario();
        TiposLogin tipo = new TiposLogin();
        usuario.setLoginUsuario(empresaDTO.getEmail());
        usuario.setLoginSenha(passwordEncoder.encode("senha-temporaria"));
        usuario.setIdEmpresa(empresaSalva.getIdEmpresa());
        usuario.setCpf("00000000000");
        tipo.setId(1);
        usuario.setTiposLogin(tipo);
        usuario.setDataCadastro(LocalDateTime.now());
        usuarioRepository.save(usuario);

        return empresaSalva;
    }

    public Empresa updateEmpresa(Integer id, EmpresaDTO empresaDTO) {
        Empresa empresa = empresaRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Empresa não encontrada."));

        modelMapper.map(empresaDTO, empresa);
        empresa.setSenha(passwordEncoder.encode(empresaDTO.getSenha()));
        empresa.setDataModificacao(LocalDateTime.now());

        return empresaRepository.save(empresa);
    }

    public List<Empresa> listarEmpresas() {
        return empresaRepository.findAll();
    }

    public Optional<Empresa> consultarEmpresa(Integer id) {
        return empresaRepository.findById(id);
    }

    public void deleteEmpresa(Integer id) {
        Empresa empresa = empresaRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Empresa não encontrada."));

        empresaRepository.deleteById(id);
    }
}
