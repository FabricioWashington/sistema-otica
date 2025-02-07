package com.fabriciodev.service.venda;

import com.fabriciodev.dto.venda.VendaDTO;
import com.fabriciodev.model.venda.Venda;
import com.fabriciodev.repository.venda.VendaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class VendaService {

    private final VendaRepository repository;

    public VendaDTO cadastrarVenda(VendaDTO dto) {
        Venda venda = convertToEntity(dto);
        Venda savedVenda = repository.save(venda);
        return convertToDTO(savedVenda);
    }

    public List<VendaDTO> listarVendas() {
        return repository.findAll().stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    public VendaDTO atualizarVenda(Long id, VendaDTO dto) {
        Venda venda = repository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Venda não encontrada"));

        venda.setIdFuncionario(dto.getIdFuncionario());
        venda.setIdCliente(dto.getIdCliente());
        venda.setIdPagamento(dto.getIdPagamento());
        venda.setData(dto.getData());
        venda.setVencimento(dto.getVencimento());
        venda.setVlrSugerido(dto.getVlrSugerido());
        venda.setDesconto(dto.getDesconto());
        venda.setTotalVenda(dto.getTotalVenda());
        venda.setParcela(dto.getParcela());
        venda.setStatus(dto.getStatus());
        venda.setVlrRecebido(dto.getVlrRecebido());
        venda.setVlrRestante(dto.getVlrRestante());
        venda.setVlrFinal(dto.getVlrFinal());

        Venda updatedVenda = repository.save(venda);
        return convertToDTO(updatedVenda);
    }

    public void excluirVenda(Long id) {
        if (!repository.existsById(id)) {
            throw new IllegalArgumentException("Venda não encontrada");
        }
        repository.deleteById(id);
    }

    private VendaDTO convertToDTO(Venda venda) {
        return VendaDTO.builder()
                .id(venda.getId())
                .idFuncionario(venda.getIdFuncionario())
                .idCliente(venda.getIdCliente())
                .idPagamento(venda.getIdPagamento())
                .data(venda.getData())
                .vencimento(venda.getVencimento())
                .vlrSugerido(venda.getVlrSugerido())
                .desconto(venda.getDesconto())
                .totalVenda(venda.getTotalVenda())
                .parcela(venda.getParcela())
                .status(venda.getStatus())
                .vlrRecebido(venda.getVlrRecebido())
                .vlrRestante(venda.getVlrRestante())
                .vlrFinal(venda.getVlrFinal())
                .build();
    }

    private Venda convertToEntity(VendaDTO dto) {
        return Venda.builder()
                .idFuncionario(dto.getIdFuncionario())
                .idCliente(dto.getIdCliente())
                .idPagamento(dto.getIdPagamento())
                .data(dto.getData())
                .vencimento(dto.getVencimento())
                .vlrSugerido(dto.getVlrSugerido())
                .desconto(dto.getDesconto())
                .totalVenda(dto.getTotalVenda())
                .parcela(dto.getParcela())
                .status(dto.getStatus())
                .vlrRecebido(dto.getVlrRecebido())
                .vlrRestante(dto.getVlrRestante())
                .vlrFinal(dto.getVlrFinal())
                .build();
    }
}
