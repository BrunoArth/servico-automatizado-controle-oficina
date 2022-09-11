package edu.gianluca.saco.types;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

public @Entity class CategoriaCliente{

    public static enum categoria{Esporádico, Especial, Mal_Pagador, Devedor};

    @Enumerated(EnumType.STRING)
    CategoriaCliente cc;

}