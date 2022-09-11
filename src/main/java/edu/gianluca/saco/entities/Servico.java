package edu.gianluca.saco.entities;

import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

public class Servico {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long codigo;

    @NotBlank
    private String descricao;

    @NotBlank
    private float custo;

    @ManyToMany
    @JoinTable(
        name = "Servico_Atividade", 
        joinColumns = { @JoinColumn(name = "codigo_servico") }, 
        inverseJoinColumns = { @JoinColumn(name = "codigo_atividade") }
    )
    private List<Atividade> atividades;

    public Long getCodigo() {
        return this.codigo;
    }

    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }

    public String getDescricao() {
        return this.descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public float getCusto() {
        return this.custo;
    }

    public void setCusto(float custo) {
        this.custo = custo;
    }

    public void addAtividade(Atividade a){
        atividades.add(a);
    }

    public void removeAtividade(Atividade a){
        atividades.remove(a);
    }

}
