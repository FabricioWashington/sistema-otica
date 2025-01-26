package com.fabriciodev.service.empresa;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fabriciodev.dto.empresa.EmpresaDTO;
import com.fabriciodev.dto.contato.ContatoDTO;
import com.fabriciodev.dto.endereco.EnderecoDTO;
import com.fabriciodev.model.contato.Contato;
import com.fabriciodev.model.endereco.Endereco;
import com.fabriciodev.model.empresa.Empresa;
import com.fabriciodev.repository.contato.ContatoRepository;
import com.fabriciodev.repository.endereco.EnderecoRepository;
import com.fabriciodev.repository.empresa.EmpresaRepository;

import java.util.List;
import java.util.Optional;

@Service
public class EmpresaService {

    @Autowired
    private EmpresaRepository empresaRepository;

    @Autowired
    private ContatoRepository contatoRepository;

    @Autowired
    private EnderecoRepository enderecoRepository;

    /**
     * Salva uma nova empresa com os dados de contato e endereço.
     */
    public Empresa salvarEmpresaComContatoEEndereco(EmpresaDTO empresaDTO) {
        if (empresaRepository.existsByCnpj(empresaDTO.getCnpj())) {
            throw new IllegalArgumentException("CNPJ já cadastrado.");
        }

        // Salvar o contato
        ContatoDTO contatoDTO = empresaDTO.getContatoDTO();
        Contato contato = new Contato();
        contato.setEmail(contatoDTO.getEmail());
        contato.setTelefone(contatoDTO.getTelefone());
        contato.setTelefone2(contatoDTO.getTelefone2());
        Contato contatoSalvo = contatoRepository.save(contato);
        System.out.println("ID Contato: " + contatoSalvo.getIdContato());

        // Salvar o endereço
        EnderecoDTO enderecoDTO = empresaDTO.getEnderecoDTO();
        Endereco endereco = new Endereco();
        endereco.setLogradouro(enderecoDTO.getLogradouro());
        endereco.setNumero(enderecoDTO.getNumero());
        endereco.setComplemento(enderecoDTO.getComplemento());
        endereco.setBairro(enderecoDTO.getBairro());
        endereco.setUf(enderecoDTO.getUf());
        endereco.setMunicipio(enderecoDTO.getMunicipio());
        endereco.setCep(enderecoDTO.getCep());
        Endereco enderecoSalvo = enderecoRepository.save(endereco);
        System.out.println("ID Endereco: " + enderecoSalvo.getIdEndereco());

        // Salvar a empresa com os IDs de contato e endereço
        Empresa empresa = new Empresa();
        empresa.setCnpj(empresaDTO.getCnpj());
        empresa.setRazaoSocial(empresaDTO.getRazaoSocial());
        empresa.setNomeFantasia(empresaDTO.getNomeFantasia());
        empresa.setRegimeTributario(empresaDTO.getRegimeTributario());
        empresa.setInscricaoEstadual(empresaDTO.getInscricaoEstadual());
        empresa.setIndicadorIE(empresaDTO.getIndicadorIE());
        empresa.setSenha(empresaDTO.getSenha());
        empresa.setIdContato(contatoSalvo.getIdContato());
        empresa.setIdEndereco(enderecoSalvo.getIdEndereco());
        Empresa empresaSalva = empresaRepository.save(empresa);
        System.out.println("ID Empresa: " + empresaSalva.getIdEmpresa());

        return empresaSalva;
    }

    /**
     * Atualiza uma empresa com os dados de contato e endereço existentes.
     */
    public Empresa atualizarEmpresaComContatoEEndereco(Integer id, EmpresaDTO empresaDTO) {
        Empresa empresa = empresaRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Empresa não encontrada."));

        Endereco endereco = enderecoRepository.findById(empresa.getIdEndereco())
                .orElseThrow(() -> new IllegalArgumentException("Endereço não encontrado."));
        EnderecoDTO enderecoDTO = empresaDTO.getEnderecoDTO();
        endereco.setLogradouro(enderecoDTO.getLogradouro());
        endereco.setNumero(enderecoDTO.getNumero());
        endereco.setComplemento(enderecoDTO.getComplemento());
        endereco.setBairro(enderecoDTO.getBairro());
        endereco.setUf(enderecoDTO.getUf());
        endereco.setMunicipio(enderecoDTO.getMunicipio());
        endereco.setCep(enderecoDTO.getCep());
        enderecoRepository.save(endereco);

        Contato contato = contatoRepository.findById(empresa.getIdContato())
                .orElseThrow(() -> new IllegalArgumentException("Contato não encontrado."));
        ContatoDTO contatoDTO = empresaDTO.getContatoDTO();
        contato.setEmail(contatoDTO.getEmail());
        contato.setTelefone(contatoDTO.getTelefone());
        contato.setTelefone2(contatoDTO.getTelefone2());
        contatoRepository.save(contato);

        empresa.setCnpj(empresaDTO.getCnpj());
        empresa.setRazaoSocial(empresaDTO.getRazaoSocial());
        empresa.setNomeFantasia(empresaDTO.getNomeFantasia());
        empresa.setRegimeTributario(empresaDTO.getRegimeTributario());
        empresa.setInscricaoEstadual(empresaDTO.getInscricaoEstadual());
        empresa.setIndicadorIE(empresaDTO.getIndicadorIE());
        empresa.setSenha(empresaDTO.getSenha());
        empresa.setDataModificacao(java.time.LocalDateTime.now());

        return empresaRepository.save(empresa);
    }

    /**
     * Lista todas as empresas cadastradas.
     */
    public List<Empresa> listarEmpresas() {
        return empresaRepository.findAll();
    }

    /**
     * Consulta os detalhes de uma empresa específica.
     */
    public Optional<Empresa> consultarEmpresa(Integer id) {
        return empresaRepository.findById(id);
    }

    /**
     * Exclui uma empresa junto com seus dados de contato e endereço.
     */
    public void excluirEmpresa(Integer id) {
        Empresa empresa = empresaRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Empresa não encontrada."));

        // Excluir o contato
        contatoRepository.deleteById(empresa.getIdContato());

        // Excluir o endereço
        enderecoRepository.deleteById(empresa.getIdEndereco());

        // Excluir a empresa
        empresaRepository.deleteById(id);
    }
}
