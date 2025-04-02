package com.fabriciodev.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Entity
@Table(name = "tipos_login")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TiposLogin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idtipos_login")
    private Integer id;

    @Column(name = "tipos_login", nullable = false)
    private String tiposLogin;
}
