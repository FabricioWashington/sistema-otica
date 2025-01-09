package com.fabriciodev.service.venda;

import com.fabriciodev.dto.venda.VendaDTO;
import com.fabriciodev.model.venda.Venda;
import com.fabriciodev.repository.venda.VendaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class VendaService {

    @Autowired
    private VendaRepository repository;

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
        VendaDTO dto = new VendaDTO();
        dto.setId(venda.getId());
        dto.setIdFuncionario(venda.getIdFuncionario());
        dto.setIdCliente(venda.getIdCliente());
        dto.setIdPagamento(venda.getIdPagamento());
        dto.setData(venda.getData());
        dto.setVencimento(venda.getVencimento());
        dto.setVlrSugerido(venda.getVlrSugerido());
        dto.setDesconto(venda.getDesconto());
        dto.setTotalVenda(venda.getTotalVenda());
        dto.setParcela(venda.getParcela());
        dto.setStatus(venda.getStatus());
        dto.setVlrRecebido(venda.getVlrRecebido());
        dto.setVlrRestante(venda.getVlrRestante());
        dto.setVlrFinal(venda.getVlrFinal());
        return dto;
    }

    private Venda convertToEntity(VendaDTO dto) {
        Venda venda = new Venda();
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
        return venda;
    }
}
