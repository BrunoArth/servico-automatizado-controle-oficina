package edu.gianluca.saco.types;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;

@Entity
@Table(name="categoria_cliente")
public class TipoMensagem{

    public static enum mensagem{Iniciado, Rejeitado, Aceito, Finalizado, No_Local, Impossivel_Iniciar};

    @Enumerated(EnumType.STRING)
    CategoriaCliente mensagem;

}
