package com.fabriciodev.model.cliente;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "pessoajuridica")
public class PessoaJuridica {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "nome_fantasia", nullable = false, unique = true)
    private String nomeFantasia;

    @Column(name = "cnpj", nullable = false, unique = true)
    private String cnpj;

    @Column(name = "inscricao_estadual", nullable = false)
    private String inscricaoEstadual;

    @Column(name = "inscricaoMunicipal", nullable = false)
    private String inscricaoMunicipal;

    @Column(name = "idCliente", nullable = false)
    private Integer idCliente;

    @Column(name = "idEmpresa", nullable = false)
    private Integer idEmpresa;


    // Getters e Setters 
    public Long getId(){
        return id;
    }

    public void setId(Long id){
        this.id = id;
    }

    public String getNomeFantasia(){
        return nomeFantasia;
    }

    public void setNomeFantasia(String nomeFantasia){
        this.nomeFantasia = nomeFantasia;
    }
    
    public String getCnpj(){
        return cnpj;
    }

    public void setCnpj(String cnpj){
        this.cnpj = cnpj;
    }

    public String getInscricaoEstadual(){
        return inscricaoEstadual;
    }

    public void setInscricaoEstadual(String inscricaoEstadual){
        this.inscricaoEstadual = inscricaoEstadual;
    }

    public String getInscricaoMunicipal(){
        return inscricaoEstadual;
    }

    public void setInscricaoMunicipal(String inscricaoMunicipal){
        this.inscricaoMunicipal = inscricaoMunicipal;
    }

    public Integer getIdCliente(){
        return idCliente;
    }

    public void setIdCliente(Integer idCliente){
        this.idCliente = idCliente;
    }

    public Integer getIdEmpresa(){
        return idEmpresa;
    }

    public void setIdEmpresa(Integer idEmpresa){
        this.idEmpresa = idEmpresa;
    }
}
