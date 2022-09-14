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
        joinColumns = { @JoinColumn(name = "pessoa_cpf") }, 
        inverseJoinColumns = { @JoinColumn(name = "endereco_codigo") }
    )
    private List<Endereco> enderecos;

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

    public void addEndereco(Endereco e) {
        this.enderecos.add(e);
    }

    public void removeEndereco(Endereco e) {
        this.enderecos.remove(e);
    }

}