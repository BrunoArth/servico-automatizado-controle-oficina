package edu.gianluca.saco.types;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

@Entity
@Table(name = "tipo_conserto")
public class TipoConserto{

    public static enum tipo{Geral, Oleo, Balanceamento, Embreagem, Freios, Radiador};

    @Enumerated(EnumType.STRING)
    TipoConserto tipo;

}