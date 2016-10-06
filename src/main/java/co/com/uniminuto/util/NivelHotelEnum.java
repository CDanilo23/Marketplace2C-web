/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.uniminuto.util;

/**
 *
 * @author cristian.ordonez
 */
public enum NivelHotelEnum {
    CINCO_ESTRELLAS("Cinco estrellas",5),
    CUATRO_ESTRELLAS("Cuatro estrellas",4),
    TRES_ESTRELLAS("Tres estrellas",3),
    DOS_ESTRELLAS("Dos estrellas",2),
    UNA_ESTRELLA("Una estrella",1);
    
    private String descripcion;
    private Integer nivel;

    private NivelHotelEnum(String descripcion,Integer nivel) {
        this.descripcion = descripcion;
        this.nivel = nivel;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getNivel() {
        return nivel;
    }

    public void setNivel(Integer nivel) {
        this.nivel = nivel;
    }
    
}
