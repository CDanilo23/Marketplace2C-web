<%-- 
    Document   : ModificarParque
    Created on : 5/09/2016, 05:50:53 PM
    Author     : cristian.ordonez
--%>

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
        <title>Modificar Parque</title>
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
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Configuracion Parques <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">

                                <li>
                                    <a href="ConfiguracionParques.jsp">Consultar Parques</a>
                                </li>
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
                <div class="row">
                    <div class="col-lg-12">
                        <form action="../../Controlador" method="post">
                            <div class="form-group">
                                <br>    
                                <caption><h1>Configuracion Parques</h1></caption>
                                <br>
                                <%
                                    Parque parque = (Parque) session.getAttribute("parque");
                                    out.println("<label>Nombre Parque</label><br>");
                                    out.println("<input name='nombreParque' value=" + parque.getParque() + " /><br>");
                                    out.println("<label>Ciudad</label><br>");
                                    out.println("<input name='ciudadParque' value=" + parque.getIdUbicacion().getCiudad() + " disabled /><br>");
                                    out.println("<label>Pais</label><br>");
                                    out.println("<input name='paisParque' value=" + parque.getIdUbicacion().getPais() + " disabled /><br>");
//                                    out.println("<label>Imagen</label><br>");
//                                    out.println("<input name='img' value=" + parque.getImg() + " /><br>");
                                    out.println("<input type='hidden' name='idParque' value=" + parque.getIdParque() + " /><br>");
                                %>
                            </div>
                            <input type="hidden" name="accion" value="ModificarParque" /><br>
                            <input type="submit" class="btn btn-default" value="Modificar"/>
                        </form>
                    </div>
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
