package com.fabriciodev.dto.empresa;

import com.fabriciodev.dto.contato.ContatoDTO;
import com.fabriciodev.dto.endereco.EnderecoDTO;

public class EmpresaDTO {

    private String cnpj;
    private String razaoSocial;
    private String nomeFantasia;
    private String regimeTributario;
    private String inscricaoEstadual;
    private String indicadorIE;
    private String senha;
    private ContatoDTO contatoDTO;
    private EnderecoDTO enderecoDTO;
    private Long idCnae;

    // Getters e Setters
    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getRazaoSocial() {
        return razaoSocial;
    }

    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }

    public String getNomeFantasia() {
        return nomeFantasia;
    }

    public void setNomeFantasia(String nomeFantasia) {
        this.nomeFantasia = nomeFantasia;
    }

    public String getRegimeTributario() {
        return regimeTributario;
    }

    public void setRegimeTributario(String regimeTributario) {
        this.regimeTributario = regimeTributario;
    }

    public String getInscricaoEstadual() {
        return inscricaoEstadual;
    }

    public void setInscricaoEstadual(String inscricaoEstadual) {
        this.inscricaoEstadual = inscricaoEstadual;
    }

    public String getIndicadorIE() {
        return indicadorIE;
    }

    public void setIndicadorIE(String indicadorIE) {
        this.indicadorIE = indicadorIE;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public ContatoDTO getContatoDTO() {
        return contatoDTO;
    }

    public void setContatoDTO(ContatoDTO contatoDTO) {
        this.contatoDTO = contatoDTO;
    }

    public EnderecoDTO getEnderecoDTO() {
        return enderecoDTO;
    }

    public void setEnderecoDTO(EnderecoDTO enderecoDTO) {
        this.enderecoDTO = enderecoDTO;
    }

    public Long getIdCnae() {
        return idCnae;
    }

    public void setIdCnae(Long idCnae) {
        this.idCnae = idCnae;
    }
}
