package com.fabriciodev.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "login")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Login {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idlogin")
    private Long id;

    @Column(name = "cpf")
    private String cpf;

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

    @Column(name = "idEmpresa", nullable = false)
    private Integer idEmpresa;
}
