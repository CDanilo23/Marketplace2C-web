/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.uniminuto.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author cristian.ordonez
 */
@Entity
@Table(name = "parque")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Parque.findAll", query = "SELECT p FROM Parque p"),
    @NamedQuery(name = "Parque.findByIdParque", query = "SELECT p FROM Parque p WHERE p.idParque = :idParque"),
    @NamedQuery(name = "Parque.findByParque", query = "SELECT p FROM Parque p WHERE p.parque = :parque")
//    @NamedQuery(name = "Parque.findByImg", query = "SELECT p FROM Parque p WHERE p.img = :img")
})
public class Parque implements Serializable {

    @JoinColumn(name = "ID_UBICACION", referencedColumnName = "ID_UBICACION")
    @ManyToOne
    private Ubicacion idUbicacion;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID_PARQUE")
    private Integer idParque;
    @Size(max = 45)
    @Column(name = "PARQUE")
    private String parque;
//    @Size(max = 45)
//    @Column(name = "IMG")
//    private String img;
    @OneToMany(mappedBy = "idParque")
    private List<Plan> planList;

    public Parque() {
    }

    public Parque(Integer idParque) {
        this.idParque = idParque;
    }

    public Integer getIdParque() {
        return idParque;
    }

    public void setIdParque(Integer idParque) {
        this.idParque = idParque;
    }

    public String getParque() {
        return parque;
    }

    public void setParque(String parque) {
        this.parque = parque;
    }

//    public String getImg() {
//        return img;
//    }
//
//    public void setImg(String img) {
//        this.img = img;
//    }

    @XmlTransient
    public List<Plan> getPlanList() {
        return planList;
    }

    public void setPlanList(List<Plan> planList) {
        this.planList = planList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idParque != null ? idParque.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Parque)) {
            return false;
        }
        Parque other = (Parque) object;
        if ((this.idParque == null && other.idParque != null) || (this.idParque != null && !this.idParque.equals(other.idParque))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.com.uniminuto.ejb.Parque[ idParque=" + idParque + " ]";
    }

    public Ubicacion getIdUbicacion() {
        return idUbicacion;
    }

    public void setIdUbicacion(Ubicacion idUbicacion) {
        this.idUbicacion = idUbicacion;
    }
    
}
