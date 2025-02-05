package com.fabriciodev.model.unidade;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "unidade")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class Unidade {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String descricao;
}