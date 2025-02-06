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
    @Column(name = "idProduto")
    private Long idProduto;

    @Column(name = "Nome_Produto", nullable = false, length = 100)
    private String nomeProduto;

    @Column(name = "unidade", nullable = false)
    private String unidade;

    @Column(name = "idCategoria", nullable = false)
    private Integer idCategoria;

    @Column(name = "Preco", nullable = false, precision = 10, scale = 2)
    private BigDecimal preco;

    @Column(name = "data", nullable = false)
    private LocalDate data;

    @Column(name = "Imagem", length = 255)
    private String imagem;

    @Column(name = "Codigo_de_Barras", unique = true, nullable = false, length = 50)
    private String codigoDeBarras;

    @Column(name = "Observacoes", columnDefinition = "TEXT")
    private String observacoes;

    @Column(name = "idEmpresa", nullable = false)
    private Integer idEmpresa;
}