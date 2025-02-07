package com.fabriciodev.model.venda;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "venda")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Venda {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idVenda")
    private Long id;

    @Column(name = "idFuncionario", nullable = false)
    private Long idFuncionario;

    @Column(name = "idCliente", nullable = false)
    private Long idCliente;

    @Column(name = "idPagamento", nullable = false)
    private Long idPagamento;

    @Temporal(TemporalType.DATE)
    @Column(name = "data", nullable = false)
    private Date data;

    @Temporal(TemporalType.DATE)
    @Column(name = "vencimento")
    private Date vencimento;

    @Column(name = "vlrSugerido", precision = 10, scale = 2)
    private BigDecimal vlrSugerido;

    @Column(name = "desconto", precision = 10, scale = 2)
    private BigDecimal desconto;

    @Column(name = "totalVenda", precision = 10, scale = 2, nullable = false)
    private BigDecimal totalVenda;

    @Column(name = "parcela")
    private String parcela;

    @Column(name = "status")
    private String status;

    @Column(name = "vlrRecebido", precision = 10, scale = 2)
    private BigDecimal vlrRecebido;

    @Column(name = "vlrRestante", precision = 10, scale = 2)
    private BigDecimal vlrRestante;

    @Column(name = "vlrFinal", precision = 10, scale = 2, nullable = false)
    private BigDecimal vlrFinal;
}
