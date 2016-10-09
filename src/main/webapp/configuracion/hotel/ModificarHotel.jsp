<%-- 
    Document   : ModificarHotel
    Created on : 13/09/2016, 09:01:55 AM
    Author     : cristian.ordonez
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="co.com.uniminuto.dto.NivelHotelDTO"%>
<%@page import="co.com.uniminuto.util.CombosUtil"%>
<%@page import="java.util.List"%>
<%@page import="co.com.uniminuto.entities.Hotel"%>
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
        <title>Modificar Hotel</title>
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
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Configuracion Hoteles<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">

                                <li>
                                    <a href="CrearHotel.jsp">Crear nuevo Hotel</a>
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
                <caption><h1>Configuracion Hoteles</h1></caption>
                <br>
                <div class="panel-group">
                    <form action="../../Controlador" method="post">
                        <div class="form-group">
                            <%
                                Hotel hotel = (Hotel) session.getAttribute("hotel");
                                out.println("<label>Nombre Hotel</label><br>");
                                out.println("<input name='nombre' value=" + hotel.getNombre() + " /><br>");
                                out.println("<label>Nivel Hotel</label><br>");
                                out.println("<select name='nivel' class='form-control' value=" + hotel.getNivel() + " /><br>");
                                LinkedList<NivelHotelDTO> ln = CombosUtil.getNivelesHotel();
                                for (NivelHotelDTO nh : ln) {
                                    out.println("<option value="+nh.getNivel()+">"+nh.getDescripcion()+"</option>");
                                }
                                out.println("</select><br>");
                                out.println("<label>Direccion Hotel</label><br>");
                                out.println("<input name='direccion' value=" + hotel.getDireccion() + " /><br>");
                                out.println("<input type='hidden' name='id' value=" + hotel.getIdHotel() + " />");
                            %>
                        </div>
                        <input type="hidden" name="accion" value="ModificarHotel" /><br>
                        <input type="submit" class="btn btn-default" value="Modificar" />
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
