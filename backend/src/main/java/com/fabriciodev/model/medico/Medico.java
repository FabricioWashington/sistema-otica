package com.fabriciodev.model.medico;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "optometrista")
public class Medico {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_Optometrista")
    private Long id;

    @Column(name = "Nome", nullable = false)
    private String nome;

    @Column(name = "registro_profissional", nullable = false, unique = true)
    private String registroProfissional;

    @Column(name = "idEndereco", nullable = false)
    private Long idEndereco;

    @Column(name = "idContato", nullable = false)
    private Long idContato;

    @Column(name = "Data_Cadastro", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date dataCadastro;

    @Column(name = "idEmpresa", nullable = false)
    private Integer idEmpresa;

    // Getters e Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getRegistroProfissional() {
        return registroProfissional;
    }

    public void setRegistroProfissional(String registroProfissional) {
        this.registroProfissional = registroProfissional;
    }

    public Long getIdEndereco() {
        return idEndereco;
    }

    public void setIdEndereco(Long idEndereco) {
        this.idEndereco = idEndereco;
    }

    public Long getIdContato() {
        return idContato;
    }

    public void setIdContato(Long idContato) {
        this.idContato = idContato;
    }

    public Date getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }
    
    public Integer getIdEmpresa(){
        return idEmpresa;
    }

    public void setIdEmpresa(Integer idEmpresa){
        this.idEmpresa = idEmpresa;
    }
}