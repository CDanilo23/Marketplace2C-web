<%-- 
    Document   : datosModificarHotel
    Created on : 17/09/2016, 10:51:02 PM
    Author     : cristian.ordonez
--%>

<%@page import="co.com.uniminuto.util.Conexion"%>
<%@page import="co.com.uniminuto.util.AccionesEnum"%>
<%@page import="co.com.uniminuto.entities.Hotel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getParameter("nombre")==null) {
                Conexion.eliminarHotel(Integer.valueOf(request.getParameter("id")));
                response.sendRedirect("ConfiguracionHoteles.jsp");
            } else {
                String id = (String) request.getParameter("id");
                String nombre = (String) request.getParameter("nombre");
                Integer nivel = Integer.valueOf(request.getParameter("nivel"));
                String direccion = (String) request.getParameter("direccion");
                Hotel hotel = new Hotel();
                hotel.setIdHotel(Integer.valueOf(id));
                hotel.setNombre(nombre);
                hotel.setNivel(nivel);
                hotel.setDireccion(direccion);
                session.setAttribute("hotel", hotel);
                response.sendRedirect("ModificarHotel.jsp");
            }
        %>
    </body>
</html>
