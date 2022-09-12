package edu.gianluca.saco.types;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;
import javax.persistence.Entity;

@Entity
@Table(name = "tipo_pagamento")
public class TipoPagamento {

    public static enum tipo{Credito, Debito, Dinheiro, PIX};

    @Enumerated(EnumType.STRING)
    TipoPagamento tipo;

}
