<%-- 
    Document   : configuracionClientes
    Created on : 4/10/2016, 03:10:01 PM
    Author     : cristian.ordonez
--%>

<%@page import="co.com.uniminuto.util.ListaUsuario"%>
<%@page import="java.util.List"%>
<%@page import="co.com.uniminuto.entities.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
         <!-- Bootstrap Core CSS -->
        <link href="../../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../../dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <title>Configuracion Clientes</title>
    </head>
    <body>
         <div id="wrapper">
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="../indexConfig.jsp"><i class="fa fa-dashboard fa-fw"></i> Index</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <div id="page-wrapper">
                <form action="datosModificarHotel.jsp" method="get"> 
                    <table class='table table-hover'>
                        <br>    
                        <caption><h1>Configuracion Clientes</h1></caption>
                        <br>
                        <tr>
                            <th>Usuario</th>  
                            <th>Nombre</th> 
                            <th>Numero de documento</th> 
                            <th>Correo</th> 
                        </tr>
                        <%
                            List<Usuario> lu = new ListaUsuario().getLu();
                            for (Usuario user : lu) {
                                out.println("<tr>");
                                out.println("<td>" + user.getUsuario() + "</td>");
                                out.println("<td>" + user.getNombre() + "</td>");
                                out.println("<td>" + user.getNumeroDocumento() + "</td>");
                                out.println("<td>" + user.getCorreo() + "</td>");
                                out.println("<td><a href='datosAceptarCliente.jsp?idCliente="+user.getIdUsuario()+
                                        "&nombre="+user.getNombre()+
                                        "&usuario="+user.getUsuario()+
                                        "&contrasena="+user.getContrasena()+"'><img src='../../img/ok.jpg'/></a></td>");
                                out.println("</tr>");
                            }
                        %>

                    </table>
                </form>
            </div>
        </div>
         <script src="../../bower_components/jquery/dist/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../../bower_components/metisMenu/dist/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../../dist/js/sb-admin-2.js"></script>
    </body>
</html>
