<%-- 
    Document   : datosModificarProveedor
    Created on : 18/09/2016, 01:09:12 AM
    Author     : cristian.ordonez
--%>

<%@page import="co.com.uniminuto.modelo.Proveedor"%>
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
            String empresa = (String) request.getParameter("empresa");
            String nombre = (String) request.getParameter("nombre");
            String nit = (String) request.getParameter("nit");
            String telefono = (String) request.getParameter("telefono");
            String direccion = (String) request.getParameter("direccion");
            Proveedor proveedor = new Proveedor();
            proveedor.setIdProveedor(Integer.valueOf(id));
            proveedor.setEmpresa(empresa);
            proveedor.setNombre(nombre);
            proveedor.setNit( nit);
            proveedor.setDireccion(direccion);
            proveedor.setTelefono(Integer.valueOf(telefono));
            session.setAttribute("proveedor", proveedor);
            response.sendRedirect("ModificarProveedor.jsp");
        %>
    </body>
</html>
