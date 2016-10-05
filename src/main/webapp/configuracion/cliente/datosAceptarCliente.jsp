<%-- 
    Document   : datosAceptarCliente
    Created on : 4/10/2016, 11:25:42 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Integer id = Integer.valueOf( request.getParameter("idCliente"));
            session.setAttribute("idCliente", id);
            session.setAttribute("envioCorreo", "envioCorreo");
            response.sendRedirect("../../Controlador");
        %>
    </body>
</html>
