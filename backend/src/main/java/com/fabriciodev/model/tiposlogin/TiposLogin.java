package com.fabriciodev.model.tiposlogin;

import jakarta.persistence.*;

@Entity
@Table(name = "tipos_login")
public class TiposLogin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idtipos_login") 
    private Long id;

    @Column(name = "tipos_login", nullable = false)
    private String tiposLogin;

    @Column(name = "idEmpresa", nullable = false)
    private Integer idEmpresa;

    // Getters e Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTiposLogin() {
        return tiposLogin;
    }

    public void setTiposLogin(String tiposLogin) {
        this.tiposLogin = tiposLogin;
    }

    public Integer getIdEmpresa(){
        return idEmpresa;
    }

    public void setIdEmpresa(Integer idEmpresa){
        this.idEmpresa = idEmpresa;
    }

}