package com.fabriciodev.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "empresa")
public class Empresa {

    public Empresa() {

    }

    public Empresa(Integer idEmpresa, String cnpj) {
        this.idEmpresa = idEmpresa;
        this.cnpj = cnpj;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idEmpresa")
    private Integer idEmpresa;

    @Column(name = "CNPJ", nullable = false, unique = true)
    private String cnpj;

    @Column(name = "Razao_Social", nullable = false)
    private String razaoSocial;

    @Column(name = "Nome_Fantasia")
    private String nomeFantasia;

    @Column(name = "Regime_Tributario")
    private String regimeTributario;

    @Column(name = "Inscricao_Estadual")
    private String inscricaoEstadual;

    @Column(name = "Indicador_IE")
    private String indicadorIE;

    @Column(name = "idCNAE")
    private Long idCNAE;

    @Column(name = "Data_Cadastro")
    private LocalDateTime dataCadastro = LocalDateTime.now();

    @Column(name = "Data_Modificacao")
    private LocalDateTime dataModificacao = LocalDateTime.now();

    @Column(name = "senha", nullable = false)
    private String senha;

    @Column(name = "Logradouro")
    private String logradouro;

    @Column(name = "Bairro")
    private String bairro;

    @Column(name = "Numero")
    private String numero;

    @Column(name = "Complemento")
    private String complemento;

    @Column(name = "CEP")
    private String cep;

    @Column(name = "UF")
    private String uf;

    @Column(name = "Municipio")
    private String municipio;

    @Column(name = "Email")
    private String email;

    @Column(name = "Telefone")
    private String telefone;

    @Column(name = "Telefone2")
    private String telefone2;
}
