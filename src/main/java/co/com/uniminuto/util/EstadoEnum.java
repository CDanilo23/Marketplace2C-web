/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.uniminuto.util;

/**
 *
 * @author pc
 */
public enum EstadoEnum {
    ACEPTADO(1),
    PENDIENTE(2);
    
    private Integer valor;
    EstadoEnum(Integer valor){
     this.valor = valor;
    }

    public Integer getValor() {
        return valor;
    }

    public void setValor(Integer valor) {
        this.valor = valor;
    }
    
}
