/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.uniminuto.ejb;

import co.com.uniminuto.entities.Rol;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author cristian.ordonez
 */
@Stateless
public class RolFacade extends AbstractFacade<Rol> implements RolFacadeLocal {

    @PersistenceContext(unitName = "Marketplace-PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public RolFacade() {
        super(Rol.class);
    }
    
}
