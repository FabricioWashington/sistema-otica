package com.fabriciodev.dto.login;

import java.time.LocalDateTime;

public class LoginDTO {

    private Long id;
    private Long idTiposLogin;
    private Long idUsuario;
    private Long idEmpresa;
    private String loginUsuario;
    private String loginSenha;
    private String cpf;
    private LocalDateTime dataCadastro;
    private LocalDateTime dataModificacao;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getIdTiposLogin() {
        return idTiposLogin;
    }

    public void setIdTiposLogin(Long idTiposLogin) {
        this.idTiposLogin = idTiposLogin;
    }

    public Long getIdEmpresa(){
        return idEmpresa;
    }

    public void setIdEmpresa(Long idEmpresa){
        this.idEmpresa = idEmpresa;
    }
    
    public Long getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Long idUsuario) {
        this.idUsuario = idUsuario;
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

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
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
