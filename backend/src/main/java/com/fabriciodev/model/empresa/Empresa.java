package com.fabriciodev.model.empresa;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "empresa")
public class Empresa {

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

    @Column(name = "idContato")
    private Integer idContato;

    @Column(name = "idEndereco")
    private Integer idEndereco;

    @Column(name = "idCNAE")
    private Long idCNAE;

    @Column(name = "Data_Cadastro")
    private LocalDateTime dataCadastro = LocalDateTime.now();

    @Column(name = "Data_Modificacao")
    private LocalDateTime dataModificacao = LocalDateTime.now();

    @Column(name = "senha", nullable = false)
    private String senha;


    public void setIdContato(Integer idContato) {
        this.idContato = idContato;
    }

    public void setIdEndereco(Integer idEndereco) {
        this.idEndereco = idEndereco;
    }

    public Integer getIdContato() {
        return idContato;
    }

    public Integer getIdEndereco() {
        return idEndereco;
    }

}