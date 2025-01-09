package com.fabriciodev.model.venda;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "venda")
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

