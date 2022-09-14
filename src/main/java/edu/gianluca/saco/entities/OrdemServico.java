package edu.gianluca.saco.entities;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.OneToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import edu.gianluca.saco.types.StatusGeral;

@Entity
@Table(name="Ordem_Servico")
public class OrdemServico {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long codigo;
    
    @ManyToOne
    private Veiculo veiculo;

    @ManyToOne
    private Cliente cliente;
    
    @OneToOne
    @JoinColumn(name="codigo_supervisor")
    private Funcionario supervisor;

    @NotBlank
    @Enumerated(EnumType.STRING)
    private StatusGeral situacao;

    @NotBlank
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy")
    private LocalDate dataEntrada;

    @NotBlank
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy")
    private LocalDate dataSaida;

    @NotBlank
    private float custoTotal;

    @OneToMany
    @JoinColumn(name="codigo_ordem_servico")
    private List<Pagamento> pagamentos;

    @OneToMany
    private List<Realizacao> realizacoes;

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
        return this.situacao;
    }

    public void setStatus(StatusGeral status) {
        this.situacao = status;
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

    public void addPagamento(Pagamento p){
        this.pagamentos.add(p);
    }

    public void removePagamento(Pagamento p){
        this.pagamentos.remove(p);
    }

}
