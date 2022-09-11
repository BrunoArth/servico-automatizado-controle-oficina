package edu.gianluca.saco.entities;

import edu.gianluca.saco.types.CategoriaCliente;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name="Cliente")
public class Cliente {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long codigo;

    @OneToOne
    @JoinColumn(name = "cpf_pessoa")
    private Pessoa pessoa;
    
    @NotBlank
    private CategoriaCliente cc;

    @OneToMany(
        mappedBy = "post",
        cascade = CascadeType.ALL,
        orphanRemoval = true
    )
    private List<OrdemServico> ordens;

    public Long getCodigo() {
        return this.codigo;
    }

    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }

    public Pessoa getPessoa() {
        return this.pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }

    public CategoriaCliente getCc() {
        return this.cc;
    }

    public void setCc(CategoriaCliente cc) {
        this.cc = cc;
    }

    public void addOrdem(OrdemServico o){
        ordens.add(o);
    }

    public void removeOrdem(OrdemServico o){
        ordens.remove(o);
    }

}