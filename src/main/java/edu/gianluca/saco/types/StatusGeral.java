package edu.gianluca.saco.types;

import javax.persistence.EnumType;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.persistence.Enumerated;

@Entity
@Table(name = "status_geral")
public class StatusGeral {
    
    public static enum status{Espera, Iniciado, Concluido};

    @Enumerated(EnumType.STRING)
    StatusGeral status;

}
