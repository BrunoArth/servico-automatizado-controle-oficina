package edu.gianluca.saco.entities;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonFormat;

import edu.gianluca.saco.types.StatusGeral;

@Entity
@Table(name="Ordem_Servico")
public class OrdemServico {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long codigo;
    
    @OneToOne
    @JoinColumn(name="placa_veiculo")
    private Veiculo veiculo;

    @OneToOne
    @JoinColumn(name="codigo_cliente")
    private Cliente cliente;
    
    @OneToOne
    @JoinColumn(name="codigo_supervisor")
    private Funcionario supervisor;

    @NotBlank
    private StatusGeral status;

    @NotBlank
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy")
    private LocalDate dataEntrada;

    @NotBlank
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy")
    private LocalDate dataSaida;

    @NotBlank
    private float custoTotal;

    public Long getCodigo() {
        return this.codigo;
    }

    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }

    public Veiculo getVeiculo() {
        return this.veiculo;
    }

    public void setVeiculo(Veiculo veiculo) {
        this.veiculo = veiculo;
    }

    public Cliente getCliente() {
        return this.cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Funcionario getSupervisor() {
        return this.supervisor;
    }

    public void setSupervisor(Funcionario supervisor) {
        this.supervisor = supervisor;
    }

    public StatusGeral getStatus() {
        return this.status;
    }

    public void setStatus(StatusGeral status) {
        this.status = status;
    }

    public LocalDate getDataEntrada() {
        return this.dataEntrada;
    }

    public void setDataEntrada(LocalDate dataEntrada) {
        this.dataEntrada = dataEntrada;
    }

    public LocalDate getDataSaida() {
        return this.dataSaida;
    }

    public void setDataSaida(LocalDate dataSaida) {
        this.dataSaida = dataSaida;
    }

    public float getCustoTotal() {
        return this.custoTotal;
    }

    public void setCustoTotal(float custoTotal) {
        this.custoTotal = custoTotal;
    }

}
