/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.uniminuto.util;

import co.com.uniminuto.entities.Hotel;
import co.com.uniminuto.entities.Parque;
import co.com.uniminuto.entities.Plan;
import co.com.uniminuto.entities.Proveedor;
import co.com.uniminuto.entities.Ubicacion;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author pc
 */
public class Conexion {

    private static Connection con = null;
    private List<Hotel> lh;
    private List<Proveedor> lpro;
    private List<Parque> lp;

    public Conexion(AccionesEnum accion) {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketplace", "root", "root");
            if (accion != null && accion.equals(AccionesEnum.ConsultarHoteles)) {
                lh = getHoteles();
            } else if (accion != null && accion.equals(AccionesEnum.ConsultarParques)) {
                lp = getParques();
            }

        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }

    }

    public static List<Hotel> getHoteles() {
        List<Hotel> lh = new ArrayList<Hotel>();
        try {
            PreparedStatement ps = con.prepareStatement("select h.id_hotel, h.nombre, h.nivel, h.direccion, h.id_ubicacion from hotel h");
            ResultSet rs = ps.executeQuery();
            Hotel hotel = null;
            while (rs.next()) {
                hotel = new Hotel();
                hotel.setIdHotel(rs.getInt(1));
                hotel.setNombre(rs.getString(2));
                hotel.setNivel(rs.getInt(3));
                hotel.setDireccion(rs.getString(4));
                hotel.setIdUbicacion(new Ubicacion(rs.getInt(5)));
                lh.add(hotel);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            drivenFinally(con);
        }
        return lh;
    }

    public static List<Parque> getParques() {
        List<Parque> lp = new ArrayList<Parque>();
        StringBuilder sb = new StringBuilder();
        sb.append("select p.id_parque, p.parque, u.id_ubicacion,u.ciudad,u.pais from parque p inner join ubicacion u on p.id_ubicacion = u.id_ubicacion");
        try {
            PreparedStatement ps = con.prepareStatement(sb.toString());
            ResultSet rs = ps.executeQuery();
            Parque parque = null;
            Ubicacion ubicacion = null;
            while (rs.next()) {
                parque = new Parque();
                parque.setIdParque(rs.getInt(1));
                parque.setParque(rs.getString(2));
                ubicacion = new Ubicacion();
                ubicacion.setIdUbicacion(rs.getInt(3));
                ubicacion.setCiudad(rs.getString(4));
                ubicacion.setPais(rs.getString(5));
                parque.setIdUbicacion(ubicacion);
                lp.add(parque);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            drivenFinally(con);
        }
        return lp;
    }

    public static void eliminarHotel(Integer idHotel) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketplace", "root", "root");
            Statement statement = con.createStatement();
            statement.executeUpdate("delete from hotel where id_hotel = " + idHotel);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            drivenFinally(con);
        }
    }

    public static void eliminarParque(Integer id) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketplace", "root", "root");
            Statement statement = con.createStatement();
            statement.executeUpdate("delete from parque where id_parque = " + id);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            drivenFinally(con);
        }
    }

    public static List<Proveedor> getProveedores() {
        List<Proveedor> lp = new ArrayList<Proveedor>();
//        try {
//            PreparedStatement ps = con.prepareStatement("select p.id_parque, p.parque, p.id_ubicacion from parque p");
//            ResultSet rs = ps.executeQuery();
//            Proveedor proveedor = null;
//            while (rs.next()) {
//                proveedor = new Proveedor();
//                proveedor.setIdProvedor(rs.getInt(1));
//                proveedor.setProveed(rs.getString(2));
//                proveedor.setIdUbicacion(new Ubicacion(rs.getInt(3)));
//                lp.add(parque);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            drivenFinally(con);
//        }
        return lp;
    }

    public static List<Plan> getPlanes() {
        List<Plan> lp = new LinkedList<>();
        try {
            StringBuilder sb = new StringBuilder();
            sb.append("select p.ID_PLAN, p.NOMBRE_PLAN, p.COSTO, p.DESCRIPCION, p.DIAS, p.NOCHES, p.ID_PARQUE, p.ID_HOTEL from plan p");
            PreparedStatement ps = con.prepareStatement(sb.toString());
            ResultSet rs = ps.executeQuery();
            Plan plan = null;
            while (rs.next()) {
                plan = new Plan();
                plan.setIdPlan(rs.getInt(1));
                plan.setNombrePlan(rs.getString(2));
                plan.setCosto(rs.getInt(3));
                plan.setDescripcion(rs.getString(4));
                plan.setDias(rs.getInt(rs.getInt(5)));
                plan.setNoches(rs.getInt(6));
                plan.setHotel(getHotel());
                plan.setParque(getParque());
                lp.add(plan);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            drivenFinally(con);
        }
        return lp;
    }

    private static Hotel getHotel() {
        Hotel hotel = null;
        try {
            StringBuilder sb = new StringBuilder();
            sb.append("select h.id_hotel,h.nombre,h.nivel,h.direccion,h.id_ubicacion from hotel h");
            PreparedStatement ps = con.prepareStatement(sb.toString());
            ResultSet rs = ps.executeQuery();
            hotel = new Hotel(rs.getInt(1));
            hotel.setNombre(rs.getString(2));
            hotel.setNivel(rs.getInt(3));
            hotel.setDireccion(rs.getString(4));
            hotel.setIdUbicacion(new Ubicacion(rs.getInt(5)));
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return hotel;
    }
    
    private static Parque getParque() {
        Parque parque = null;
        try {
            StringBuilder sb = new StringBuilder();
            sb.append("select p.id_parque, p.parque, u.id_ubicacion, u.ciudad, u.pais from parque p inner join ubicacion u on p.id_ubicacion = u.id_ubicacion");
            PreparedStatement ps = con.prepareStatement(sb.toString());
            ResultSet rs = ps.executeQuery();
            parque = new Parque(rs.getInt(1));
            parque.setParque(rs.getString(2));
            Ubicacion ubicacion = new Ubicacion(rs.getInt(3));
            ubicacion.setCiudad(rs.getString(4));
            ubicacion.setPais(rs.getString(5));
            parque.setIdUbicacion(ubicacion);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return parque;
    }

    private static void drivenFinally(Connection con) {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public List<Hotel> getLh() {
        return lh;
    }

    public void setLh(List<Hotel> lh) {
        this.lh = lh;
    }

    public List<Parque> getLp() {
        return lp;
    }

    public void setLp(List<Parque> lp) {
        this.lp = lp;
    }
}
