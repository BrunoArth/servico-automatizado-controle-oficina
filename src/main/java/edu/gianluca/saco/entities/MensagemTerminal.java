package edu.gianluca.saco.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import edu.gianluca.saco.types.TipoMensagem;

@Entity
@Table(name = "Mensagem_Terminal")
public class MensagemTerminal {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long codigo;

    @OneToOne
    @JoinColumn(name = "placa_unidade_movel")
    private UnidadeMovel unidade;

    @NotBlank
    private TipoMensagem conteudo;

    @NotBlank
    @Column(name = "data_hora")
    private LocalDateTime dataHora;

    @NotBlank
    private float latitude;

    @NotBlank
    private float longitude;

}
