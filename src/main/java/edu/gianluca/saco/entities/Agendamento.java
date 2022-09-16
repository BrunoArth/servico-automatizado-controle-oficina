package edu.gianluca.saco.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
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
@Table(name = "Agendamento")
public class Agendamento {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long codigo;

    @ManyToOne
    private Cliente cliente;

    @OneToOne
    @JoinColumn(name="codigo_endereco")
    private Endereco endereco;

    @OneToOne
    @JoinColumn(name="placa_veiculo")
    private Veiculo veiculo;

    @NotBlank
    @Column(name = "data_hora")
    private LocalDateTime dataHora;

    @NotBlank
    private StatusGeral situacao;

    public Long getCodigo() {
        return this.codigo;
    }

    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }

    public Cliente getCliente() {
        return this.cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Endereco getEndereco() {
        return this.endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public Veiculo getVeiculo() {
        return this.veiculo;
    }

    public void setVeiculo(Veiculo veiculo) {
        this.veiculo = veiculo;
    }

    public LocalDateTime getDataHora() {
        return this.dataHora;
    }

    public void setDataHora(LocalDateTime dataHora) {
        this.dataHora = dataHora;
    }

    public StatusGeral getSituacao() {
        return this.situacao;
    }

    public void setSituacao(StatusGeral situacao) {
        this.situacao = situacao;
    }
    
}
