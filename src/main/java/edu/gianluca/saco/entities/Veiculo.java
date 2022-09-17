package edu.gianluca.saco.entities;

import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="Veiculo")
public class Veiculo{

    @Id
    private String placa;

    @NotNull
    private String marca;

    @NotNull
    private String modelo;

    @NotNull
    private int ano;

    @ManyToMany(mappedBy = "veiculos")
    private List<Cliente> proprietario;

    @OneToMany(
        mappedBy = "veiculo",
        cascade = CascadeType.ALL,
        orphanRemoval = true
    )
    private List<OrdemServico> ordens;

    public String getPlaca() {
        return this.placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getMarca() {
        return this.marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return this.modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getAno() {
        return this.ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public void addProprietario(Cliente c) {
        this.proprietario.add(c);
    }

    public void removeProprietario(Cliente c) {
        this.proprietario.remove(c);
    }

    public List<OrdemServico> getOrdens() {
        return this.ordens;
    }

    public void setOrdens(List<OrdemServico> ordens) {
        this.ordens = ordens;
    }

}