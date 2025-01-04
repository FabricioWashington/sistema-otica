package com.fabriciodev.controller;

import com.fabriciodev.model.TiposLogin;
import com.fabriciodev.service.TiposLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/tipos-login")
public class TiposLoginController {

    @Autowired
    private TiposLoginService tiposLoginService;

    @GetMapping
    public List<TiposLogin> listarTiposLogin() {
        return tiposLoginService.listarTiposLogin();
    }
}
