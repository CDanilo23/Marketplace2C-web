<%-- 
    Document   : ModificarPlan
    Created on : 16/09/2016, 11:18:48 AM
    Author     : cristian.ordonez
--%>

<%@page import="co.com.uniminuto.entities.Hotel"%>
<%@page import="co.com.uniminuto.util.Conexion"%>
<%@page import="co.com.uniminuto.util.AccionesEnum"%>
<%@page import="co.com.uniminuto.entities.Parque"%>
<%@page import="java.util.List"%>
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
        <title>Modificar Plan</title>
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
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Configuracion Planes <span class="fa arrow"></span></a>
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
                <br>    
                <caption><h1>Configuracion Planes</h1></caption>
                <br>
                <div class="panel-group">
                    <form action="../../Controlador" method="post">
                        <div class="form-group">
                            <input class="form-control" name='nombre' type="text" placeholder='Nombre Plan' value="<%=((Plan) request.getSession().getAttribute("plan")).getNombrePlan()%>"><br>
                            <input class="form-control" name='costo' type="text" placeholder='Costo' value="<%=((Plan) request.getSession().getAttribute("plan")).getCosto()%>"><br>
                            <input class="form-control" name='descripcion' type="text" placeholder='Descripcion'><br>
                            <input class="form-control" name='dias' type="text" placeholder='Dias'><br>
                            <input class="form-control" name='noches' type="text" placeholder='Noches'><br>
                            <div class="form-group">
                                <label>Parque</label><br>
                                <select class="form-control" name="idParque">
                                    <%
                                        List<Parque> lista = new Conexion(AccionesEnum.ConsultarParques).getLp();
                                        Plan plan = (Plan) request.getSession().getAttribute("plan");
                                        for (Parque p : lista) {
                                            if (p.getIdParque() == plan.getIdParque().getIdParque()) {
                                                continue;
                                            } else {
                                                out.println("<option value='" + p.getIdParque() + "'><" + p.getParque() + "></option>");
                                            }
                                        }
                                    %>
                                </select>
                            </div><br>
                            <div class="form-group">
                                <label>Hotel</label><br>
                                <select class="form-control" name="idHotel">
                                    <%
                                        Plan plan1 = (Plan) request.getSession().getAttribute("plan");
                                        List<Hotel> lista1 = new Conexion(AccionesEnum.ConsultarHoteles).getLh();
                                        for (Hotel h : lista1) {
                                            if (h.getIdHotel() == plan1.getIdHotel().getIdHotel()) {
                                                continue;
                                            } else {
                                                out.println("<option value='" + h.getIdHotel() + "'><" + h.getNombre() + "></option>");
                                            }
                                        }
                                    %>
                                </select>
                            </div><br>
                            <div class="form-group">
                                <label>Imagen plan</label>
                                <input class="form-control" type="file" name="photo" size="50">
                            </div>
                        </div>
                        <input type="hidden" name="accion" value="ModificarPlan" /><br>
                        <input type="submit" class="btn btn-default" value="Modificar"/>
                    </form>
                </div>
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
