package com.fabriciodev.service.tiposlogin;

import com.fabriciodev.model.tiposlogin.TiposLogin;
import com.fabriciodev.repository.tiposlogin.TiposLoginRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TiposLoginService {

    @Autowired
    private TiposLoginRepository tiposLoginRepository;

    public List<TiposLogin> listarTodos() {
        return tiposLoginRepository.findAll();
    }

    public Optional<TiposLogin> buscarPorId(Long id) {
        return tiposLoginRepository.findById(id);
    }

    public TiposLogin criar(TiposLogin tiposLogin) {
        return tiposLoginRepository.save(tiposLogin);
    }

    public Optional<TiposLogin> atualizar(Long id, TiposLogin tiposLoginAtualizado) {
        return tiposLoginRepository.findById(id).map(tiposLogin -> {
            tiposLogin.setTiposLogin(tiposLoginAtualizado.getTiposLogin());
            return tiposLoginRepository.save(tiposLogin);
        });
    }

    public boolean deletar(Long id) {
        if (tiposLoginRepository.existsById(id)) {
            tiposLoginRepository.deleteById(id);
            return true;
        }
        return false;
    }
}
