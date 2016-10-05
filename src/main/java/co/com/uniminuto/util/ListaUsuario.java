/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.uniminuto.util;

import co.com.uniminuto.entities.Rol;
import co.com.uniminuto.entities.Usuario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author cristian.ordonez
 */
public class ListaUsuario {

    Connection con = null;
    private List<Usuario> lu;

    public ListaUsuario() {
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost/marketplace?user=root&password=root");
            Statement ps = con.createStatement();
            lu = new ArrayList<Usuario>();
            StringBuilder sb = new StringBuilder();
            sb.append("select * from usuario u where u.estado = 2 ");
            ResultSet rs = ps.executeQuery(sb.toString());
            Usuario user = null;
            while (rs.next()) {
                user = new Usuario();
                user.setIdUsuario(rs.getInt(1));
                user.setUsuario(rs.getString(2));
                user.setContrasena(rs.getString(3));
                user.setNombre(rs.getString(4));
                user.setEmpresa(rs.getString(5));
                user.setNumeroDocumento(rs.getInt(6));
                user.setTipoDocumento(rs.getInt(7));
                user.setDireccion(rs.getString(8));
                user.setRol(new Rol(rs.getInt(9)));
                user.setEstado(rs.getInt(10));
                user.setCorreo(rs.getString(11));
                user.setTelefono(rs.getString(12));
                lu.add(user);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<Usuario> getLu() {
        return lu;
    }

    public void setLu(List<Usuario> lu) {
        this.lu = lu;
    }
}
