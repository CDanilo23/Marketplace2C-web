/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.uniminuto.ejb;

import co.com.uniminuto.entities.Hotel;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author cristian.ordonez
 */
@Local
public interface HotelFacadeLocal {

    public void create(Hotel hotel) throws Exception;

    public void edit(Hotel hotel) throws Exception;

    public void remove(Hotel hotel) throws Exception;

    public Hotel find(Object id) throws Exception;

    public List<Hotel> findAllHoteles();

    public List<Hotel> findById(Integer id) throws Exception;
}
