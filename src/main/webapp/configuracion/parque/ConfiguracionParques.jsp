<%-- 
    Document   : ConfiguracionParuques
    Created on : 5/09/2016, 03:41:43 PM
    Author     : cristian.ordonez
--%>

<%@page import="co.com.uniminuto.util.Conexion"%>
<%@page import="java.util.List"%>
<%@page import="co.com.uniminuto.util.AccionesEnum"%>
<%@page import="co.com.uniminuto.entities.Parque"%>
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
        <title>Configuracion parques</title>
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
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Configuracion Parques<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                               
                                <li>
                                    <a href="CrearParque.jsp">Crear nuevo Parque</a>
                                </li>
                                <li>
                                    <a href="EliminarParque.jsp">Eliminar Parque</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <div id="page-wrapper">
                <form action="datosModificarParque.jsp" method="get"> 
                    <table class='table table-hover'>
                        <br>    
                        <caption><h1>Configuracion Parques</h1></caption>
                        <br>
                        <tr>
                            <th>Nombre del parque</th>  
                            <th>Ciudad</th> 
                            <th>Pais</th> 
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                        <%
                            List<Parque> lp = new Conexion(AccionesEnum.ConsultarParques).getLp();
                            for (Parque parque : lp) {
                                out.println("<tr>");
                                out.println("<td>" + parque.getParque() + "</td>");
                                out.println("<td>" + parque.getIdUbicacion().getCiudad() + "</td>");
                                out.println("<td>" + parque.getIdUbicacion().getPais() + "</td>");
                                out.println("<td><img src='../img/" + parque.getImg() + "'></img></td>");
                                out.println("<td><a href='datosModificarParque.jsp?id=" + parque.getIdParque()
                                        + "&nombreParque=" + parque.getParque()
                                        + "&idUbicacion=" + parque.getIdUbicacion().getIdUbicacion()
                                        + "&ciudadParque=" + parque.getIdUbicacion().getCiudad()
                                        + "&paisParque=" + parque.getIdUbicacion().getPais()
                                        + "&img=" + parque.getImg()
                                        + "'><img src='../../img/modificar.jpg'/></a></td>");
                                out.println("<td><a href='datosModificarParque.jsp?id=" + parque.getIdParque() + "'><img src='../../img/eliminar.jpg'/></a></td>");
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
