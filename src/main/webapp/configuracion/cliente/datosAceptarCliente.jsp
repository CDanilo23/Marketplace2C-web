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
            String id = (String)request.getParameter("id");
            session.setAttribute("idCliente", id);
            response.sendRedirect("../../Controlador");
        %>
    </body>
</html>
