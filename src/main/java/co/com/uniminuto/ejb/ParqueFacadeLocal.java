/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.uniminuto.ejb;

import co.com.uniminuto.entities.Parque;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author pc
 */
@Local
public interface ParqueFacadeLocal {

    void create(Parque parque);

    void edit(Parque parque);

    void remove(Parque parque);

    Parque find(Object id);

    List<Parque> findAll();

    List<Parque> findRange(int[] range);

    int count();
    
}
