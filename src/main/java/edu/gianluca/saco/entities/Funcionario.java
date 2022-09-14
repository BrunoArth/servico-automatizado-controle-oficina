package edu.gianluca.saco.entities;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonFormat;

import edu.gianluca.saco.types.SetorAtuacao;
import edu.gianluca.saco.types.TipoConserto;

@Entity
@Table(name="Funcionario")
public class Funcionario {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long codigo;

    @OneToOne
    @JoinColumn(name = "cpf_pessoa")
    private Pessoa pessoa;

    @NotBlank
    private String url_foto;
    
    @NotBlank
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy")
    private LocalDate data_admissao;
    
    private float salario;
    
    @NotBlank
    @Enumerated(EnumType.STRING)
    private SetorAtuacao setor;
    
    @NotBlank
    @Enumerated(EnumType.STRING)
    private TipoConserto especialidade;

    @OneToMany
    private List<Realizacao> realizacoes;

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

    public String getUrl_foto() {
        return this.url_foto;
    }

    public void setUrl_foto(String url_foto) {
        this.url_foto = url_foto;
    }

    public LocalDate getData_admissao() {
        return this.data_admissao;
    }

    public void setData_admissao(LocalDate data_admissao) {
        this.data_admissao = data_admissao;
    }

    public float getSalario() {
        return this.salario;
    }

    public void setSalario(float salario) {
        this.salario = salario;
    }

    public SetorAtuacao getSetor() {
        return this.setor;
    }

    public void setSetor(SetorAtuacao setor) {
        this.setor = setor;
    }

    public TipoConserto getEspecialidade() {
        return this.especialidade;
    }

    public void setEspecialidade(TipoConserto especialidade) {
        this.especialidade = especialidade;
    }    

}
