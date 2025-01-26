package com.fabriciodev.dto.endereco;

import lombok.Data;

@Data
public class EnderecoDTO {
    private String logradouro;
    private String bairro;
    private String numero;
    private String complemento;
    private String cep;
    private String uf;
    private String municipio;
}

