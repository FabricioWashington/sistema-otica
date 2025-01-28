package com.fabriciodev.model.cliente;

import jakarta.persistence.*;

@Entity
@Table(name = "pessoafisica")
public class PessoaFisica {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "cpf", nullable = false, unique = true)
    private String cpf;

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

    public String getCpf(){
        return cpf;
    }

    public void setCpf(String cpf){
        this.cpf = cpf;
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
