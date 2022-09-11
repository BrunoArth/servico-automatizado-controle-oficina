package edu.gianluca.saco.types;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

public @Entity class TipoConserto{

    public static enum categoria{Geral, Oleo, Balanceamento, Embreagem, Freios, Radiador};

    @Enumerated(EnumType.STRING)
    TipoConserto tipo;

}