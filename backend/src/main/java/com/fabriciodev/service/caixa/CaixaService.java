package com.fabriciodev.service.caixa;

import com.fabriciodev.dto.caixa.CaixaDTO;
import com.fabriciodev.model.caixa.Caixa;
import com.fabriciodev.repository.caixa.CaixaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CaixaService {

    private final CaixaRepository repository;

    public CaixaDTO abrirCaixa(CaixaDTO dto) {
        if (repository.findFirstByStatus("aberto") != null) {
            throw new IllegalStateException("Já existe um caixa aberto.");
        }

        Caixa caixa = Caixa.builder()
                .dataAbertura(LocalDateTime.now())
                .saldoInicial(dto.getSaldoInicial())
                .operador(dto.getOperador())
                .status("aberto")
                .build();

        return convertToDTO(repository.save(caixa));
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

        return convertToDTO(repository.save(caixa));
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
        return CaixaDTO.builder()
                .id(caixa.getId())
                .dataAbertura(caixa.getDataAbertura())
                .dataFechamento(caixa.getDataFechamento())
                .saldoInicial(caixa.getSaldoInicial())
                .saldoFinal(caixa.getSaldoFinal())
                .status(caixa.getStatus())
                .operador(caixa.getOperador())
                .build();
    }
}
