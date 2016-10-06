/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.uniminuto.ejb;

import co.com.uniminuto.entities.Archivo;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author cristian.ordonez
 */
@Local
public interface ArchivoFacadeLocal {

    void create(Archivo archivo);

    void edit(Archivo archivo);

    void remove(Archivo archivo);

    Archivo find(Object id);

    List<Archivo> findAll();

    List<Archivo> findRange(int[] range);

    int count();
    
}
