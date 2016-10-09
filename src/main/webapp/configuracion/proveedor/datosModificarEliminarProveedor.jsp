<%-- 
    Document   : datosModificarProveedor
    Created on : 18/09/2016, 01:09:12 AM
    Author     : cristian.ordonez
--%>

<%@page import="co.com.uniminuto.entities.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getParameter("usuario") == null) {
                Integer idUsuario = Integer.valueOf(request.getParameter("idProveedor"));
                request.getSession().setAttribute("idProveedor", idUsuario);
                response.sendRedirect("../../Controlador");
            } else {
                String idUsuario = (String) request.getParameter("idUsuario");
                String usuario = (String) request.getParameter("usuario");
                String empresa = (String) request.getParameter("empresa");
                String nombre = (String) request.getParameter("nombre");
                Integer numDocumento = Integer.valueOf(request.getParameter("numDocumento"));
                String direccion = (String) request.getParameter("direccion");
                String telefono = (String) request.getParameter("telefono");
                String correo = (String) request.getParameter("correo");
                Usuario userProve = new Usuario();
                userProve.setIdUsuario(Integer.valueOf(idUsuario));
                userProve.setUsuario(usuario);
                userProve.setEmpresa(empresa);
                userProve.setNombre(nombre);
                userProve.setNumeroDocumento(numDocumento);
                userProve.setDireccion(direccion);
                userProve.setTelefono(telefono);
                userProve.setCorreo(correo);
                session.setAttribute("proveedor", userProve);
                response.sendRedirect("modificarProveedor.jsp");
            }
        %>
    </body>
</html>
