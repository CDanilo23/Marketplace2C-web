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
public enum TipoDocumentoEnum {
    CEDULA(1,"Cedula de ciudadania"),
    TARJETA_DE_IDENTIDAD(2,"Tarjeta de identidad"),
    PASAPORTE(3,"Pasaporte"),
    NIT(4,"Nit");
    
    private Integer valor;
    private String descripcion;
    
    TipoDocumentoEnum(Integer valor, String descripcion){
        this.valor = valor;
        this.descripcion = descripcion;
    }

    public Integer getValor() {
        return valor;
    }

    public void setValor(Integer valor) {
        this.valor = valor;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
}
