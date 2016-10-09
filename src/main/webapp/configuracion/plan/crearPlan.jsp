<%-- 
    Document   : ConfiguracionPlanes
    Created on : 14/09/2016, 07:12:09 AM
    Author     : cristian.ordonez
--%>

<%@page import="co.com.uniminuto.entities.Hotel"%>
<%@page import="co.com.uniminuto.util.AccionesEnum"%>
<%@page import="co.com.uniminuto.util.Conexion"%>
<%@page import="java.util.List"%>
<%@page import="co.com.uniminuto.entities.Parque"%>
<%@page import="java.util.ArrayList"%>
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
        <link href="../../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../../dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <title>Crear Plan</title>
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
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Configuracion Planes <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="configuracionPlanes.jsp">Consultar Planes</a>
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
                    <form action="../../Controlador" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <input class="form-control" name='nombre' type="text" placeholder='Nombre Plan'><br>
                            <input class="form-control" name='costo' type="text" placeholder='Costo'><br>
                            <input class="form-control" name='descripcion' type="text" placeholder='Descripcion'><br>
                            <input class="form-control" name='dias' type="text" placeholder='Dias'><br>
                            <input class="form-control" name='noches' type="text" placeholder='Noches'><br>
                            <div class="form-group">
                                <label>Parque</label><br>
                                <select class="form-control" name="idParque">
                                    <%
                                        List<Parque> lista = new Conexion(AccionesEnum.ConsultarParques).getLp();
                                        for (Parque p : lista) {
                                    %>
                                    <option value="<%=p.getIdParque()%>"><%=p.getParque()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div><br>
                            <div class="form-group">
                                <label>Hotel</label><br>
                                <select class="form-control" name="idHotel">
                                    <%
                                        List<Hotel> lista1 = new Conexion(AccionesEnum.ConsultarHoteles).getLh();
                                        for (Hotel h : lista1) {
                                    %>
                                    <option value="<%=h.getIdHotel()%>"><%=h.getNombre()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div><br>
                            <div class="form-group">
                                <label>Imagen plan</label><label class="alert-info">Tamaño de imagen 180x140 px</label>
                                <input class="form-control" type="file" name="photo" size="50">
                            </div>
                        </div>
                        <input type="hidden" name="accion" value="CrearPlan" /><br>
                        <input type="submit" class="btn btn-default" value="Crear" />
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

