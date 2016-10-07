/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.uniminuto.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 *
 * @author cristian.ordonez
 */
@Entity
@Table(name = "plan")
@NamedQueries({
    @NamedQuery(name = "Plan.findAll", query = "SELECT p FROM Plan p"),
    @NamedQuery(name = "Plan.findByIdPlan", query = "SELECT p FROM Plan p WHERE p.idPlan = :idPlan"),
    @NamedQuery(name = "Plan.findByNombrePlan", query = "SELECT p FROM Plan p WHERE p.nombrePlan = :nombrePlan"),
    @NamedQuery(name = "Plan.findByCosto", query = "SELECT p FROM Plan p WHERE p.costo = :costo"),
    @NamedQuery(name = "Plan.findByDescripcion", query = "SELECT p FROM Plan p WHERE p.descripcion = :descripcion"),
    @NamedQuery(name = "Plan.findByDias", query = "SELECT p FROM Plan p WHERE p.dias = :dias"),
    @NamedQuery(name = "Plan.findByNoches", query = "SELECT p FROM Plan p WHERE p.noches = :noches")})
public class Plan implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID_PLAN")
    private Integer idPlan;
    @Size(max = 45)
    @Column(name = "NOMBRE_PLAN")
    private String nombrePlan;
    @Column(name = "COSTO")
    private Integer costo;
    @Size(max = 255)
    @Column(name = "DESCRIPCION")
    private String descripcion;
    @Column(name = "DIAS")
    private Integer dias;
    @Column(name = "NOCHES")
    private Integer noches;
    @JoinColumn(name = "ID_PARQUE", referencedColumnName = "ID_PARQUE")
    @ManyToOne
    private Parque idParque;
    @JoinColumn(name = "ID_HOTEL", referencedColumnName = "ID_HOTEL")
    @ManyToOne
    private Hotel idHotel;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idPlan")
    private List<Archivo> listaArchivo;

    public Plan() {
    }

    public Plan(Integer idPlan) {
        this.idPlan = idPlan;
    }

    public Integer getIdPlan() {
        return idPlan;
    }

    public void setIdPlan(Integer idPlan) {
        this.idPlan = idPlan;
    }

    public String getNombrePlan() {
        return nombrePlan;
    }

    public void setNombrePlan(String nombrePlan) {
        this.nombrePlan = nombrePlan;
    }

    public Integer getCosto() {
        return costo;
    }

    public void setCosto(Integer costo) {
        this.costo = costo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getDias() {
        return dias;
    }

    public void setDias(Integer dias) {
        this.dias = dias;
    }

    public Integer getNoches() {
        return noches;
    }

    public void setNoches(Integer noches) {
        this.noches = noches;
    }

    public Parque getIdParque() {
        return idParque;
    }

    public void setIdParque(Parque idParque) {
        this.idParque = idParque;
    }

    public Hotel getIdHotel() {
        return idHotel;
    }

    public void setIdHotel(Hotel idHotel) {
        this.idHotel = idHotel;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPlan != null ? idPlan.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Plan)) {
            return false;
        }
        Plan other = (Plan) object;
        if ((this.idPlan == null && other.idPlan != null) || (this.idPlan != null && !this.idPlan.equals(other.idPlan))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.com.uniminuto.entities.Plan[ idPlan=" + idPlan + " ]";
    }

    public List<Archivo> getListaArchivo() {
        return listaArchivo;
    }

    public void setListaArchivo(List<Archivo> listaArchivo) {
        this.listaArchivo = listaArchivo;
    }
    
}
