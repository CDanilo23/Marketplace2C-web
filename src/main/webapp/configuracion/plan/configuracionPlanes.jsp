<%-- 
    Document   : ConfiguracionPlanes
    Created on : 14/09/2016, 07:26:57 AM
    Author     : cristian.ordonez
--%>

<%@page import="java.util.List"%>
<%@page import="co.com.uniminuto.util.Conexion"%>
<%@page import="java.util.LinkedList"%>
<%@page import="co.com.uniminuto.entities.Plan"%>
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
        <title>Configuracion Planes</title>
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
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Configuracion Planes<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">

                                <li>
                                    <a href="crearPlan.jsp">Crear nuevo Plan</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <div id="page-wrapper">
                <form action="datosModificarPlan.jsp" method="get">
                    <table class='table table-hover table-bordered'>
                        <br>    
                        <caption><h1>Configuracion Planes</h1></caption>
                        <br>
                        <tr>
                            <th>Nombre del plan</th>  
                            <th>Descripcion</th> 
                            <th>Costo</th>
                            <th>Dias</th>
                            <th>Noches</th> 
                            <th></th>
                        </tr>
                        <%
                            List<Plan> lp = Conexion.getPlanes();
                            for (Plan plan : lp) {
                                out.println("<tr>");
                                out.println("<td>" + plan.getNombrePlan() + "</td>");
                                out.println("<td>" + plan.getDescripcion() + "</td>");
                                out.println("<td>" + plan.getCosto() + "</td>");
                                out.println("<td>" + plan.getDias() + "</td>");
                                out.println("<td>" + plan.getNoches() + "</td>");
//                                out.println("<td align='center'><table><tr><td>" + plan.getParque().getParque() + "</td><td><img src='../img/" + plan.getParque().getImg() + "'></img></td></tr></table></td>");
                                out.println("<td><a href='datosModificarPlan.jsp?id=" + plan.getIdPlan()
                                        + "&nombre=" + plan.getNombrePlan()
                                        + "&descripcion=" + plan.getDescripcion()
                                        + "&costo=" + plan.getCosto()
                                        + "&dias=" + plan.getDias()
                                        + "&noches=" + plan.getNoches()
                                        + "&idParque=" + plan.getParque().getIdParque() 
                                        + "&parque="+plan.getParque().getParque()+"'><img src='../../img/modificar.jpg'/></a></td>");
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

