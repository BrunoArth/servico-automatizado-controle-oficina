package edu.gianluca.saco.entities;

import javax.persistence.*;
import java.util.List;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="Pessoa")
public class Pessoa{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String cpf;

    @NotNull
    private String nome;
    
    @NotNull
    private String sobrenome;

    @NotNull
    private String rg;

    @NotNull
    private String telefone;

    @ManyToMany
    @JoinTable(
        name = "Pessoa_Veiculo", 
        joinColumns = { @JoinColumn(name = "cpf_pessoa") }, 
        inverseJoinColumns = { @JoinColumn(name = "placa_veiculo") }
    )
    private List<Veiculo> veiculos;

    @OneToMany
    @JoinColumn(name="endereco_codigo")
    private Endereco endereco;

    public String getCpf() {
        return this.cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSobrenome() {
        return this.sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public String getRg() {
        return this.rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getTelefone() {
        return this.telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public Endereco getEndereco() {
        return this.endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public void addVeiculo(Veiculo v){
        veiculos.add(v);
    }
    
    public void removeVeiculo(Veiculo v){
        veiculos.remove(v);
    }

}