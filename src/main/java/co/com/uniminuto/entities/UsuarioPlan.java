/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.uniminuto.entities;

import java.io.Serializable;
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
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author pc
 */
@Entity
@Table(name = "usuario_plan")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UsuarioPlan.findAll", query = "SELECT u FROM UsuarioPlan u"),
    @NamedQuery(name = "UsuarioPlan.findByIdUsuarioPlan", query = "SELECT u FROM UsuarioPlan u WHERE u.idUsuarioPlan = :idUsuarioPlan"),
    @NamedQuery(name = "UsuarioPlan.findByEstado", query = "SELECT u FROM UsuarioPlan u WHERE u.estado = :estado")})
public class UsuarioPlan implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID_USUARIO_PLAN")
    private Integer idUsuarioPlan;
    @Column(name = "ESTADO")
    private Character estado;
    @JoinColumn(name = "ID_PLAN", referencedColumnName = "ID_PLAN")
    @ManyToOne
    private Plan idPlan;
    @JoinColumn(name = "ID_USUARIO", referencedColumnName = "ID_USUARIO")
    @ManyToOne
    private Usuario idUsuario;

    public UsuarioPlan() {
    }

    public UsuarioPlan(Integer idUsuarioPlan) {
        this.idUsuarioPlan = idUsuarioPlan;
    }

    public Integer getIdUsuarioPlan() {
        return idUsuarioPlan;
    }

    public void setIdUsuarioPlan(Integer idUsuarioPlan) {
        this.idUsuarioPlan = idUsuarioPlan;
    }

    public Character getEstado() {
        return estado;
    }

    public void setEstado(Character estado) {
        this.estado = estado;
    }

    public Plan getIdPlan() {
        return idPlan;
    }

    public void setIdPlan(Plan idPlan) {
        this.idPlan = idPlan;
    }

    public Usuario getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Usuario idUsuario) {
        this.idUsuario = idUsuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idUsuarioPlan != null ? idUsuarioPlan.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UsuarioPlan)) {
            return false;
        }
        UsuarioPlan other = (UsuarioPlan) object;
        if ((this.idUsuarioPlan == null && other.idUsuarioPlan != null) || (this.idUsuarioPlan != null && !this.idUsuarioPlan.equals(other.idUsuarioPlan))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.com.uniminuto.entities.UsuarioPlan[ idUsuarioPlan=" + idUsuarioPlan + " ]";
    }
    
}
