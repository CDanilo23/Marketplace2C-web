<%-- 
    Document   : datosModificarParque
    Created on : 18/09/2016, 12:18:19 AM
    Author     : cristian.ordonez
--%>

<%@page import="co.com.uniminuto.entities.Ubicacion"%>
<%@page import="co.com.uniminuto.util.Conexion"%>
<%@page import="co.com.uniminuto.entities.Parque"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getParameter("nombreParque") == null) {
                Conexion.eliminarParque(Integer.valueOf(request.getParameter("id")));
                response.sendRedirect("ConfiguracionParques.jsp");
            } else {
                String id = (String) request.getParameter("id");
                String nombreParque = (String) request.getParameter("nombreParque");
                String ciudadParque = (String) request.getParameter("ciudadParque");
                String paisParque = (String) request.getParameter("paisParque");
                Integer idUbicacion = Integer.valueOf(request.getParameter("idUbicacion"));
                Parque parque = new Parque();
                parque.setIdParque(Integer.valueOf(id));
                parque.setParque(nombreParque);
                Ubicacion ubicacion = new Ubicacion();
                ubicacion.setIdUbicacion(idUbicacion);
                ubicacion.setCiudad(ciudadParque);
                ubicacion.setPais(paisParque);
                parque.setIdUbicacion(ubicacion);
                session.setAttribute("parque", parque);
                response.sendRedirect("ModificarParque.jsp");
            }
        %>
    </body>
</html>
