package edu.gianluca.saco.types;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;

public class StatusGeral {
    
    public static enum status{Espera, Iniciado, Concluido};

    @Enumerated(EnumType.STRING)
    StatusGeral status;

}
