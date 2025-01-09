package com.fabriciodev.dto.venda;

import java.math.BigDecimal;
import java.util.Date;

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

    // Getters e Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getIdFuncionario() {
        return idFuncionario;
    }

    public void setIdFuncionario(Long idFuncionario) {
        this.idFuncionario = idFuncionario;
    }

    public Long getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Long idCliente) {
        this.idCliente = idCliente;
    }

    public Long getIdPagamento() {
        return idPagamento;
    }

    public void setIdPagamento(Long idPagamento) {
        this.idPagamento = idPagamento;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Date getVencimento() {
        return vencimento;
    }

    public void setVencimento(Date vencimento) {
        this.vencimento = vencimento;
    }

    public BigDecimal getVlrSugerido() {
        return vlrSugerido;
    }

    public void setVlrSugerido(BigDecimal vlrSugerido) {
        this.vlrSugerido = vlrSugerido;
    }

    public BigDecimal getDesconto() {
        return desconto;
    }

    public void setDesconto(BigDecimal desconto) {
        this.desconto = desconto;
    }

    public BigDecimal getTotalVenda() {
        return totalVenda;
    }

    public void setTotalVenda(BigDecimal totalVenda) {
        this.totalVenda = totalVenda;
    }

    public String getParcela() {
        return parcela;
    }

    public void setParcela(String parcela) {
        this.parcela = parcela;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public BigDecimal getVlrRecebido() {
        return vlrRecebido;
    }

    public void setVlrRecebido(BigDecimal vlrRecebido) {
        this.vlrRecebido = vlrRecebido;
    }

    public BigDecimal getVlrRestante() {
        return vlrRestante;
    }

    public void setVlrRestante(BigDecimal vlrRestante) {
        this.vlrRestante = vlrRestante;
    }

    public BigDecimal getVlrFinal() {
        return vlrFinal;
    }

    public void setVlrFinal(BigDecimal vlrFinal) {
        this.vlrFinal = vlrFinal;
    }
}
