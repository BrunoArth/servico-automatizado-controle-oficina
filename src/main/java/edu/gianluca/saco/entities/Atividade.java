package edu.gianluca.saco.entities;

import javax.persistence.*;
import java.util.List;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name="Atividade")
public class Atividade {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long codigo;
    
    @NotBlank
    private String descricao;

    @ManyToMany(mappedBy = "atividades")
    private List<Servico> servicos;

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

    public void addServico(Servico s){
        servicos.add(s);
    }

    public void removeServico(Servico s){
        servicos.remove(s);
    }

}
