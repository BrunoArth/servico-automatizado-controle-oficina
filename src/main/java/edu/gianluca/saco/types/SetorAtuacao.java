package edu.gianluca.saco.types;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

@Entity
@Table(name = "setor_atuacao")
public class SetorAtuacao{

    public static enum setor{Administrativo, Operacional, Mecanico};

    @Enumerated(EnumType.STRING)
    SetorAtuacao setor;

}