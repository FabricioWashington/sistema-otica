package com.fabriciodev.model;

import jakarta.persistence.*;

@Entity
@Table(name = "tipos_login")
public class TiposLogin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "tipos_login", nullable = false)
    private String tiposLogin;

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
}
