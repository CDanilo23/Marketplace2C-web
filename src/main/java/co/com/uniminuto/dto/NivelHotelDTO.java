/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.uniminuto.dto;

/**
 *
 * @author cristian.ordonez
 */
public class NivelHotelDTO {
    private String descripcion;
    private Integer nivel;
    
    public NivelHotelDTO(String descripcion, Integer nivel){
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
