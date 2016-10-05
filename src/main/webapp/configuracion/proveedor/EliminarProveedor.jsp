<%-- 
    Document   : EliminarProvedor
    Created on : 13/09/2016, 09:49:50 PM
    Author     : cristian.ordonez
--%>

<%@page import="co.com.uniminuto.modelo.Proveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <title>Configuracion proveedor</title>
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
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Configuracion <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="ConfiguracionProveedores.jsp">Consultar Proveedores</a>
                                </li>
                                <li>
                                    <a href="CrearProveedor.jsp">Crear nuevo Proveedor</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <div id="page-wrapper">
                <form action="datosEliminarProveedor.jsp" method="get"> 
                    <table class='table table-hover'>
                        <br>    
                        <caption><h1>Configuracion Proveedores</h1></caption>
                        <br>
                        <tr>
                            <th>Empresa</th> 
                            <th>Nombre del Proveedor</th>  
                            <th>Nit</th> 
                            <th>Direcion</th>
                            <th>Telefono</th>
                            <th></th>
                        </tr>
                        <%
                            co.com.uniminuto.dao.ProveedorDAO p = new co.com.uniminuto.dao.ProveedorDAO();
                            for (Proveedor proveedor : p.listarProveedores()) {
                                out.println("<tr>");
                                out.println("<td>" + proveedor.getEmpresa() + "</td>");
                                out.println("<td>" + proveedor.getNombre() + "</td>");
                                out.println("<td>" + proveedor.getNit() + "</td>");
                                out.println("<td>" + proveedor.getDireccion() + "</td>");
                                out.println("<td>" + proveedor.getTelefono() + "</td>");
                                out.println("<td><a href='datosEliminarProveedor.jsp?id="+proveedor.getIdProveedor()+"'><img src='../img/eliminar.jpg'/></a></td>");
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

