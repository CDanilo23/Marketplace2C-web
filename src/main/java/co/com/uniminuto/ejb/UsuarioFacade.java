/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.uniminuto.ejb;

import co.com.uniminuto.entities.Usuario;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author cristian.ordonez
 */
@Stateless(name = "UsuarioFacade", mappedName = "UsuarioFacadeBean")
public class UsuarioFacade implements UsuarioFacadeLocal {

    @PersistenceContext(unitName = "Marketplace-PU")
    private EntityManager em;

    @Override
    public void create(Usuario usuario) {
        em.persist(usuario);
    }

    @Override
    public void edit(Usuario usuario) {
        em.merge(usuario);
    }

    @Override
    @TransactionAttribute(TransactionAttributeType.REQUIRES_NEW)
    public void remove(Usuario usuario) {
        em.remove(usuario);
    }

    @Override
    public Usuario find(Object id) {
        return em.find(Usuario.class, id);
    }

    @Override
    public List<Usuario> findAll() {
        return em.createNamedQuery("Usuario.findAll").getResultList();
    }

    @Override
    public List<Usuario> findUserByIdAndPass(String user, String password) {
        List<Usuario> lu = new ArrayList<>();
        try {
            lu = em.createNamedQuery("Usuario.findByUsuarioAndPass").setParameter("user", user).setParameter("password", password).getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lu;
    }

    @Override
    public List<Usuario> findUserByUserAndName(String user, String name) {
        List<Usuario> lu = new ArrayList<>();
        try{
            lu = em.createNamedQuery("Usuario.findByUsuarioAndName",Usuario.class).setParameter("usuario", user).setParameter("nombre", name).getResultList();
        }catch(Exception e){
            e.printStackTrace();
        }
        return lu;
    }

}
