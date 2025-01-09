package com.fabriciodev.service.caixa;

import com.fabriciodev.dto.caixa.CaixaDTO;
import com.fabriciodev.model.caixa.Caixa;
import com.fabriciodev.repository.caixa.CaixaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class CaixaService {

    @Autowired
    private CaixaRepository repository;

    public CaixaDTO abrirCaixa(CaixaDTO dto) {
        if (repository.findFirstByStatus("aberto") != null) {
            throw new IllegalStateException("Já existe um caixa aberto.");
        }

        Caixa caixa = new Caixa();
        caixa.setDataAbertura(LocalDateTime.now());
        caixa.setSaldoInicial(dto.getSaldoInicial());
        caixa.setOperador(dto.getOperador());
        caixa.setStatus("aberto");

        Caixa savedCaixa = repository.save(caixa);
        return convertToDTO(savedCaixa);
    }

    public CaixaDTO fecharCaixa(Long id, BigDecimal saldoFinal) {
        Caixa caixa = repository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Caixa não encontrado."));

        if (!"aberto".equals(caixa.getStatus())) {
            throw new IllegalStateException("O caixa já está fechado.");
        }

        caixa.setSaldoFinal(saldoFinal);
        caixa.setDataFechamento(LocalDateTime.now());
        caixa.setStatus("fechado");

        Caixa savedCaixa = repository.save(caixa);
        return convertToDTO(savedCaixa);
    }

    public List<CaixaDTO> listarCaixas() {
        return repository.findAll().stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    public void deletarCaixa(Long id) {
        repository.deleteById(id);
    }

    private CaixaDTO convertToDTO(Caixa caixa) {
        CaixaDTO dto = new CaixaDTO();
        dto.setId(caixa.getId());
        dto.setDataAbertura(caixa.getDataAbertura());
        dto.setDataFechamento(caixa.getDataFechamento());
        dto.setSaldoInicial(caixa.getSaldoInicial());
        dto.setSaldoFinal(caixa.getSaldoFinal());
        dto.setStatus(caixa.getStatus());
        dto.setOperador(caixa.getOperador());
        return dto;
    }
}
