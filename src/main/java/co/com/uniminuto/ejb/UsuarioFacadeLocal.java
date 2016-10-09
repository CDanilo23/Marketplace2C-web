/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.uniminuto.ejb;

import co.com.uniminuto.entities.Usuario;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author cristian.ordonez
 */
@Local
public interface UsuarioFacadeLocal {

    void create(Usuario usuario);

    void edit(Usuario usuario);
    
    Usuario merge(Usuario usuario);

    void remove(Usuario usuario);

    Usuario find(Object id);

    List<Usuario> findAll();

    List<Usuario> findUserByIdAndPass(String user, String password);
    
    List<Usuario> findUserByUserAndName(String user, String name);

}
