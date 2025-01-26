package com.fabriciodev.service.contato;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fabriciodev.dto.contato.ContatoDTO;
import com.fabriciodev.model.contato.Contato;
import com.fabriciodev.repository.contato.ContatoRepository;

import java.util.List;

@Service
public class ContatoService {

    @Autowired
    private ContatoRepository contatoRepository;

    public Contato salvarContato(ContatoDTO contatoDTO) {
        Contato contato = new Contato();
        contato.setEmail(contatoDTO.getEmail());
        contato.setTelefone(contatoDTO.getTelefone());
        contato.setTelefone2(contatoDTO.getTelefone2());

        return contatoRepository.save(contato);
    }

    public List<Contato> listarContatos() {
        return contatoRepository.findAll();
    }

    public Contato consultarContato(Integer idContato) {
        return contatoRepository.findById(idContato)
                .orElseThrow(() -> new IllegalArgumentException("Contato não encontrado."));
    }

    public Contato atualizarContato(Integer idContato, ContatoDTO contatoDTO) {
        Contato contato = consultarContato(idContato);

        contato.setEmail(contatoDTO.getEmail());
        contato.setTelefone(contatoDTO.getTelefone());
        contato.setTelefone2(contatoDTO.getTelefone2());

        return contatoRepository.save(contato);
    }

    public void excluirContato(Integer idContato) {
        if (!contatoRepository.existsById(idContato)) {
            throw new IllegalArgumentException("Contato não encontrado.");
        }
        contatoRepository.deleteById(idContato);
    }
}
