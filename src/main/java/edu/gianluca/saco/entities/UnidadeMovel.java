package edu.gianluca.saco.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Unidade_Movel")
public class UnidadeMovel implements Serializable{

    @Id
    @OneToOne
    @JoinColumn(name = "placa_veiculo")
    private Veiculo unidadeMovel;

    @OneToOne
    @JoinColumn(name = "codigo_motorista")
    private Funcionario motorista;

    @OneToOne
    @JoinColumn(name = "codigo_atendente")
    private Funcionario atendente;

    public Veiculo getUnidadeMovel() {
        return this.unidadeMovel;
    }

    public void setUnidadeMovel(Veiculo unidadeMovel) {
        this.unidadeMovel = unidadeMovel;
    }

    public Funcionario getMotorista() {
        return this.motorista;
    }

    public void setMotorista(Funcionario motorista) {
        this.motorista = motorista;
    }

    public Funcionario getAtendente() {
        return this.atendente;
    }

    public void setAtendente(Funcionario atendente) {
        this.atendente = atendente;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof UnidadeMovel)) {
            return false;
        }
        var unidadeMovel = (UnidadeMovel) o;
        return Objects.equals(this.unidadeMovel, unidadeMovel.getUnidadeMovel()) && Objects.equals(this.motorista, unidadeMovel.getMotorista()) && Objects.equals(this.atendente, unidadeMovel.getAtendente());
    }

    @Override
    public int hashCode() {
        return Objects.hash(unidadeMovel, motorista, atendente);
    }
    
}
