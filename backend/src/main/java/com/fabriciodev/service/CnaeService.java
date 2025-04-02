package com.fabriciodev.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fabriciodev.model.Cnae;
import com.fabriciodev.repository.CnaeRepository;

import java.util.List;

@Service
public class CnaeService {

    @Autowired
    private CnaeRepository cnaeRepository;

    public List<Cnae> listarCNAEs() {
        return cnaeRepository.findAll();
    }
}
