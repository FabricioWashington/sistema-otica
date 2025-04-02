package com.fabriciodev.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "usuario")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_usuario")
    private Integer id;

    @Column(name = "cpf")
    private String cpf;

    @Column(name = "login_usuario", nullable = false, unique = true)
    private String loginUsuario;

    @Column(name = "login_senha", nullable = false)
    private String loginSenha;

    @ManyToOne
    @JoinColumn(name = "id_tipos_login", nullable = false)
    private TiposLogin tiposLogin;

    @Column(name = "data_cadastro", nullable = false)
    private LocalDateTime dataCadastro;

    @Column(name = "data_modificacao")
    private LocalDateTime dataModificacao;

    @Column(name = "id_empresa", nullable = false)
    private Integer idEmpresa;
}
