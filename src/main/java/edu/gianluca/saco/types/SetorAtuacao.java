package edu.gianluca.saco.types;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

public @Entity class SetorAtuacao{

    public static enum categoria{Administrativo, Operacional, Mecanico};

    @Enumerated(EnumType.STRING)
    SetorAtuacao setor;

}