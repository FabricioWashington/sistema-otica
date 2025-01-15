package com.fabriciodev.model.login;

import jakarta.persistence.*;
import java.time.LocalDateTime;

import com.fabriciodev.model.tiposlogin.TiposLogin;

@Entity
@Table(name = "login")
public class Login {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idlogin") // Ajustando para refletir o nome correto da coluna
    private Long id;

    @Column(name = "login_usuario", nullable = false, unique = true)
    private String loginUsuario;

    @Column(name = "login_senha", nullable = false)
    private String loginSenha;

    @ManyToOne
    @JoinColumn(name = "idtipos_login", nullable = false)
    private TiposLogin tiposLogin;

    @Column(name = "idUsuario", nullable = false) 
    private Integer idUsuario;

    @Column(name = "Data_cadastro", nullable = false)
    private LocalDateTime dataCadastro;

    @Column(name = "Data_modificacao")
    private LocalDateTime dataModificacao;

    // Getters e Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLoginUsuario() {
        return loginUsuario;
    }

    public void setLoginUsuario(String loginUsuario) {
        this.loginUsuario = loginUsuario;
    }

    public String getLoginSenha() {
        return loginSenha;
    }

    public void setLoginSenha(String loginSenha) {
        this.loginSenha = loginSenha;
    }

    public TiposLogin getTiposLogin() {
        return tiposLogin;
    }

    public void setTiposLogin(TiposLogin tiposLogin) {
        this.tiposLogin = tiposLogin;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    public LocalDateTime getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(LocalDateTime dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public LocalDateTime getDataModificacao() {
        return dataModificacao;
    }

    public void setDataModificacao(LocalDateTime dataModificacao) {
        this.dataModificacao = dataModificacao;
    }
}
