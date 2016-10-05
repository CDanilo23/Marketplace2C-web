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
public enum RolEnum {
    ADMINISTRADOR(1),
    PROVEEDOR(2),
    CLIENTE(3);
    
    private Integer valor;
    
    RolEnum(Integer valor){
        this.valor = valor;
    }

    public Integer getValor() {
        return valor;
    }

    public void setValor(Integer valor) {
        this.valor = valor;
    }
    
}
