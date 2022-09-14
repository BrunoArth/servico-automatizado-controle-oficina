package edu.gianluca.saco.entities;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import edu.gianluca.saco.types.StatusGeral;

@Entity
@Table(name = "Atividades_Realizadas")
public class Realizacao {
    
    @Id 
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long codigo;
    
    @OneToOne
    @JoinColumn(name = "codigo_ordem_servico")
    private OrdemServico ordemServico;

    @OneToOne
    @JoinColumn(name = "codigo_servico")
    private Servico servico;

    @OneToOne
    @JoinColumn(name = "codigo_atividade")
    private Atividade atividade;

    @ManyToOne
    @JoinColumn(name = "codigo_funcionario")
    private Funcionario realizador;

    @NotBlank
    @Enumerated(EnumType.STRING)
    private StatusGeral status;


    public Long getCodigo() {
        return this.codigo;
    }

    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }

    public OrdemServico getOrdemServico() {
        return this.ordemServico;
    }

    public void setOrdemServico(OrdemServico ordemServico) {
        this.ordemServico = ordemServico;
    }

    public Servico getServico() {
        return this.servico;
    }

    public void setServico(Servico servico) {
        this.servico = servico;
    }

    public Atividade getAtividade() {
        return this.atividade;
    }

    public void setAtividade(Atividade atividade) {
        this.atividade = atividade;
    }

    public Funcionario getRealizador() {
        return this.realizador;
    }

    public void setRealizador(Funcionario realizador) {
        this.realizador = realizador;
    }

    public StatusGeral getStatus() {
        return this.status;
    }

    public void setStatus(StatusGeral status) {
        this.status = status;
    }


}
