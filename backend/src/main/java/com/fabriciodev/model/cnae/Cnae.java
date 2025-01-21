package com.fabriciodev.model.cnae;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "cnae")
public class Cnae {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idCNAE;

    private String CNAE_Principal;

    // Getters e Setters
    public int getIdCNAE() {
        return idCNAE;
    }

    public void setIdCNAE(int idCNAE) {
        this.idCNAE = idCNAE;
    }

    public String getCNAE_Principal() {
        return CNAE_Principal;
    }

    public void setCNAE_Principal(String CNAE_Principal) {
        this.CNAE_Principal = CNAE_Principal;
    }
}

