package com.fabriciodev.model.produto;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "produto")
public class Produto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idProduto;

    @Column(nullable = false, length = 100)
    private String nomeProduto;

    @Column(nullable = false)
    private Integer idUnidade;

    @Column(nullable = false)
    private Integer idCategoria;

    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal preco;

    @Column(nullable = false)
    private LocalDate data;

    @Column(length = 255)
    private String imagem;

    @Column(unique = true, nullable = false, length = 50)
    private String codigoDeBarras;

    @Column(columnDefinition = "TEXT")
    private String observacoes;

    @Column(nullable = false)
    private Integer idEmpresa;
}