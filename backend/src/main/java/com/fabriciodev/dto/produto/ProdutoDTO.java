package com.fabriciodev.dto.produto;

import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProdutoDTO {

    private Long idProduto;
    private String nomeProduto;
    private Integer idUnidade;
    private Integer idCategoria;
    private BigDecimal preco;
    private LocalDate data;
    private String imagem;
    private String codigoDeBarras;
    private String observacoes;
    private Integer idEmpresa;
}
