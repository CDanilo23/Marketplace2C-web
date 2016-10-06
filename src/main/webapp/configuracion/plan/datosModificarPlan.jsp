<%-- 
    Document   : datosModificarPlan
    Created on : 17/09/2016, 04:41:00 PM
    Author     : cristian.ordonez
--%>

<%@page import="co.com.uniminuto.entities.Parque"%>
<%@page import="co.com.uniminuto.entities.Plan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String id = (String)request.getParameter("id");
            String nombre = (String) request.getParameter("nombre");
            String descripcion = (String) request.getParameter("descripcion");
            String costo = (String) request.getParameter("costo");
            String dias = (String) request.getParameter("dias");
            String noches = (String) request.getParameter("noches");
            Integer idParque = Integer.valueOf(request.getParameter("idParque"));
            String parque = (String) request.getParameter("parque");
            Plan plan = new Plan();
            plan.setIdPlan(Integer.valueOf(id));
            plan.setNombrePlan(nombre);
            plan.setCosto(Integer.valueOf(costo));
            plan.setDescripcion(descripcion);
            plan.setDias(Integer.valueOf(dias));
            plan.setNoches(Integer.valueOf(noches));
            Parque parque1 = new Parque();
            parque1.setIdParque(idParque);
            parque1.setParque(parque);
            plan.setParque(parque1);
            session.setAttribute("plan", plan);
            response.sendRedirect("ModificarPlan.jsp");
        %>
    </body>
</html>
