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
 * @author cristian.ordonez
 */
@Entity
@Table(name = "cliente_plan")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ClientePlan.findAll", query = "SELECT c FROM ClientePlan c"),
    @NamedQuery(name = "ClientePlan.findByIdPlanCliente", query = "SELECT c FROM ClientePlan c WHERE c.idPlanCliente = :idPlanCliente"),
    @NamedQuery(name = "ClientePlan.findByEstado", query = "SELECT c FROM ClientePlan c WHERE c.estado = :estado")})
public class ClientePlan implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID_PLAN_CLIENTE")
    private Integer idPlanCliente;
    @Column(name = "ESTADO")
    private Character estado;
    @JoinColumn(name = "ID_CLIENTE", referencedColumnName = "ID_CLIENTE")
    @ManyToOne
    private Cliente idCliente;
    @JoinColumn(name = "ID_PLAN", referencedColumnName = "ID_PLAN")
    @ManyToOne
    private Plan idPlan;

    public ClientePlan() {
    }

    public ClientePlan(Integer idPlanCliente) {
        this.idPlanCliente = idPlanCliente;
    }

    public Integer getIdPlanCliente() {
        return idPlanCliente;
    }

    public void setIdPlanCliente(Integer idPlanCliente) {
        this.idPlanCliente = idPlanCliente;
    }

    public Character getEstado() {
        return estado;
    }

    public void setEstado(Character estado) {
        this.estado = estado;
    }

    public Cliente getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Cliente idCliente) {
        this.idCliente = idCliente;
    }

    public Plan getIdPlan() {
        return idPlan;
    }

    public void setIdPlan(Plan idPlan) {
        this.idPlan = idPlan;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPlanCliente != null ? idPlanCliente.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ClientePlan)) {
            return false;
        }
        ClientePlan other = (ClientePlan) object;
        if ((this.idPlanCliente == null && other.idPlanCliente != null) || (this.idPlanCliente != null && !this.idPlanCliente.equals(other.idPlanCliente))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.com.uniminuto.ejb.ClientePlan[ idPlanCliente=" + idPlanCliente + " ]";
    }
    
}
