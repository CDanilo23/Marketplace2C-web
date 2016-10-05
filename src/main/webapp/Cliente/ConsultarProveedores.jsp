<%-- 
    Document   : ConfiguracionProveedor
    Created on : 13/09/2016, 08:38:03 PM
    Author     : cristian.ordonez
--%>

<%@page import="co.com.uniminuto.modelo.Proveedor"%>
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
        <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <title>Configuracion Proveedores</title>
    </head>
    <body>

        <div id="wrapper">
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="indexConfig.jsp"><i class="fa fa-dashboard fa-fw"></i> Index</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Configuracion Proveedores<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">

                                <li>
                                    <a href="CrearProveedor.jsp">Crear nuevo proveedor</a>
                                </li>
                                <li>
                                    <a href="EliminarProveedor.jsp">Eliminar proveedor</a>
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
                        <caption><h1>Poveedores Registrados En El Sistema </h1></caption>
                        <br>
                        <tr>
                            <th>Id Proveedor</th>  
                            <th>Nombre</th>  
                            <th>Empresa</th> 
                            <th>Más Datos</th>                              
                            <th></th>
                        </tr>
                        <%
                            co.com.uniminuto.dao.ProveedorDAO p = new co.com.uniminuto.dao.ProveedorDAO();
                            for (Proveedor proveedor : p.listarProveedores()) {
                                out.println("<tr>");
                                out.println("<td>" + proveedor.getIdProveedor() + "</td>");
                                out.println("<td>" + proveedor.getEmpresa() + "</td>");
                                out.println("<td>" + proveedor.getNombre() + "</td>");
                                out.println("<td><a href='datosModificarProveedor.jsp?id=" + proveedor.getIdProveedor()
                                        + "&empresa=" + proveedor.getEmpresa()
                                        + "&nombre=" + proveedor.getNombre()
                                        + "&nit=" + proveedor.getNit()
                                        + "&direccion=" + proveedor.getDireccion()
                                        + "&telefono=" + proveedor.getTelefono());
                                out.println("</tr>");
                            }
                        %>

                    </table>
                </form>
            </div>
        </div>
        <!-- jQuery -->
        <script src="../bower_components/jquery/dist/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../dist/js/sb-admin-2.js"></script>
    </body>
</html>
