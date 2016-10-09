<%-- 
    Document   : datosModificarEliminarPlan
    Created on : 8/10/2016, 01:51:50 PM
    Author     : pc
--%>

<%@page import="co.com.uniminuto.entities.Hotel"%>
<%@page import="co.com.uniminuto.entities.Parque"%>
<%@page import="co.com.uniminuto.entities.Plan"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.com.uniminuto.entities.Archivo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <%
                if (request.getParameter("nombrePlan") == null) {
                    session.setAttribute("idPlan", Integer.valueOf(request.getParameter("idPlan")));
                    session.setAttribute("eliminarPlan", "eliminarPlan");
                    response.sendRedirect("../../Controlador");
                } else {
                    String id = (String) request.getParameter("idPlan");
                    String nombre = (String) request.getParameter("nombrePlan");
                    String descripcion = (String) request.getParameter("descripcion");
                    String costo = (String) request.getParameter("costo");
                    String dias = (String) request.getParameter("dias");
                    String noches = (String) request.getParameter("noches");
                    Integer idParque = Integer.valueOf(request.getParameter("idParque"));
                    String nomParque = (String) request.getParameter("parque");
                    Integer idHotel = Integer.valueOf(request.getParameter("idHotel"));
                    String nomHotel = request.getParameter("nomHotel");
                    Plan plan = new Plan();
                    plan.setIdPlan(Integer.valueOf(id));
                    plan.setNombrePlan(nombre);
                    plan.setCosto(Integer.valueOf(costo));
                    plan.setDescripcion(descripcion);
                    plan.setDias(Integer.valueOf(dias));
                    plan.setNoches(Integer.valueOf(noches));
                    
                    Parque parque = new Parque();
                    parque.setIdParque(idParque);
                    parque.setParque(nomParque);
                    plan.setIdParque(parque);

                    Hotel hotel = new Hotel();
                    hotel.setIdHotel(idHotel);
                    hotel.setNombre(nomHotel);
                    plan.setIdHotel(hotel);

                    session.setAttribute("plan", plan);
                    response.sendRedirect("modificarPlan.jsp");
                }
            %>
    </body>
</html>
