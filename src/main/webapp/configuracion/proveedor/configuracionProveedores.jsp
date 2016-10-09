<%-- 
    Document   : ConfiguracionProveedor
    Created on : 13/09/2016, 08:38:03 PM
    Author     : cristian.ordonez
--%>

<%@page import="co.com.uniminuto.util.AccionesEnum"%>
<%@page import="java.util.List"%>
<%@page import="co.com.uniminuto.entities.Usuario"%>
<%@page import="co.com.uniminuto.util.Conexion"%>
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
        <title>Configuracion Proveedores</title>
    </head>
    <body>

        <div id="wrapper">
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="../indexConfig.jsp"><i class="fa fa-dashboard fa-fw"></i> Index</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Configuracion Proveedores<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">

                                <li>
                                    <a href="crearProveedor.jsp">Crear nuevo proveedor</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <div id="page-wrapper">
                <form action="datosModificarProveedor" method="get"> 
                    <table class='table table-hover'>
                        <br>    
                        <caption><h1>Configuracion proveedor</h1></caption>
                        <br>
                        <tr>
                            <th>Usuario</th>  
                            <th>Empresa</th>  
                            <th>Nombre proveedor</th>  
                            <th>Numero de documento</th>  
                            <th>Telefono</th> 
                            <th>Direccion</th> 
                            <th>Email</th> 
                            <th></th>
                            <th></th>
                        </tr>
                        <%
                            List<Usuario> lipro = new Conexion(AccionesEnum.ConsultarProveedor).getLpro();
                            for (Usuario userProv : lipro) {
                                out.println("<tr>");
                                out.println("<td>" + userProv.getUsuario() + "</td>");
                                out.println("<td>" + userProv.getEmpresa() + "</td>");
                                out.println("<td>" + userProv.getNombre() + "</td>");
                                out.println("<td>" + userProv.getNumeroDocumento() + "</td>");
                                out.println("<td>" + userProv.getDireccion() + "</td>");
                                out.println("<td>" + userProv.getTelefono() + "</td>");
                                out.println("<td>" + userProv.getCorreo() + "</td>");
                                out.println("<td><a href='datosModificarEliminarProveedor.jsp?idProveedor=" + userProv.getIdUsuario()
                                        + "&usuario=" + userProv.getUsuario()
                                        + "&empresa=" + userProv.getEmpresa()
                                        + "&nombre=" + userProv.getNombre()
                                        + "&numDocumento=" + userProv.getNumeroDocumento()
                                        + "&direccion=" + userProv.getDireccion()
                                        + "&telefono=" + userProv.getTelefono()
                                        + "&correo=" + userProv.getCorreo()
                                        + "'><img src='../../img/modificar.jpg'/></a></td>");
                                out.println("<td><a href='datosModificarEliminarProveedor.jsp?idProveedor=" + userProv.getIdUsuario()
                                         +"'><img src='../../img/eliminar.jpg'/></a></td>");
                                out.println("</tr>");
                            }
                        %>

                    </table>
                </form>
            </div>
        </div>
        <!-- jQuery -->
        <script src="../../bower_components/jquery/dist/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../../bower_components/metisMenu/dist/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../../dist/js/sb-admin-2.js"></script>
    </body>
</html>
