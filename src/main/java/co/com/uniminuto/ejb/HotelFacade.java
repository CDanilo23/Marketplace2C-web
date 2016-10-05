/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.uniminuto.ejb;

import co.com.uniminuto.entities.Hotel;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author cristian.ordonez
 */
@Stateless(name = "HotelFacade",mappedName = "HotelFacadeBean")
public class HotelFacade implements  HotelFacadeLocal{
 @PersistenceContext(unitName = "Marketplace-PU")
    private EntityManager em;

    @Override
    public void create(Hotel hotel) throws Exception {
        try {
            em.persist(hotel);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public void edit(Hotel hotel) throws Exception {
        try {
            em.merge(hotel);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public void remove(Hotel hotel) throws Exception {
        try {
            em.remove(hotel);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public Hotel find(Object id) throws Exception {
        Hotel hotel = new Hotel();
        try {
            hotel = em.find(Hotel.class, id);
        } catch (Exception e) {
            throw e;
        }
        return hotel;
    }

    @Override
    public List<Hotel> findAllHoteles(){
        List<Hotel> listaHoteles = null;
        try {
            listaHoteles = em.createNamedQuery("Hotel.findAll", Hotel.class).getResultList();
        } catch (Exception e) {
            throw e;
        }
        return listaHoteles;
    }

    @Override
    public List<Hotel> findById(Integer id) throws Exception {
        List<Hotel> listaHoteles = null;
        try {
            listaHoteles = em.createNamedQuery("Hotel.findByIdHotel", Hotel.class).setParameter("idHotel", id).
                    getResultList();
        } catch (Exception e) {
            throw e;
        }
        return listaHoteles;
    }
}
