package com.fabriciodev.service;

import com.fabriciodev.model.TiposLogin;
import com.fabriciodev.repository.TiposLoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TiposLoginService {

    @Autowired
    private TiposLoginRepository tiposLoginRepository;

    public List<TiposLogin> listarTiposLogin() {
        return tiposLoginRepository.findAll();
    }
}
