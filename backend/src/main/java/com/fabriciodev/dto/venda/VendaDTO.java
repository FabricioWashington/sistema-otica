package com.fabriciodev.dto.venda;

import lombok.*;

import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class VendaDTO {

    private Long id;
    private Long idFuncionario;
    private Long idCliente;
    private Long idPagamento;
    private Date data;
    private Date vencimento;
    private BigDecimal vlrSugerido;
    private BigDecimal desconto;
    private BigDecimal totalVenda;
    private String parcela;
    private String status;
    private BigDecimal vlrRecebido;
    private BigDecimal vlrRestante;
    private BigDecimal vlrFinal;
}
