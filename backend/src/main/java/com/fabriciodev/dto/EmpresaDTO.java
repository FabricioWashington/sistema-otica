package com.fabriciodev.dto;

import lombok.Data;

@Data
public class EmpresaDTO {

    private Integer idEmpresa;
    private String cnpj;
    private String razaoSocial;
    private String nomeFantasia;
    private String regimeTributario;
    private String inscricaoEstadual;
    private String indicadorIE;
    private String senha;
    private Long idCnae;

    // Contato
    private String email;
    private String telefone;
    private String telefone2;

    // Endereço
    private String logradouro;
    private String numero;
    private String complemento;
    private String bairro;
    private String uf;
    private String municipio;
    private String cep;
}
