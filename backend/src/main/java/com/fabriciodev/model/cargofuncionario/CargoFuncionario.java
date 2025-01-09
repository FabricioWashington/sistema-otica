package com.fabriciodev.model.cargofuncionario;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "cargo_funcionario")
public class CargoFuncionario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String cargo;

    @Column(nullable = false)
    private BigDecimal salario;

    // Getters e Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public BigDecimal getSalario() {
        return salario;
    }

    public void setSalario(BigDecimal salario) {
        this.salario = salario;
    }
}
