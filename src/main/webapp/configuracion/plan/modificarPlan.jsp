<%-- 
    Document   : ModificarPlan
    Created on : 16/09/2016, 11:18:48 AM
    Author     : cristian.ordonez
--%>

<%@page import="co.com.uniminuto.modelo.Parque"%>
<%@page import="co.com.uniminuto.dao.ParqueDAO"%>
<%@page import="java.util.List"%>
<%@page import="co.com.uniminuto.modelo.Plan"%>
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
                        <form action="../Controlador" method="post">
                            <div class="form-group">
                                <%
                                    ParqueDAO parqueDAO = new ParqueDAO();
                                    List<Parque> lista = parqueDAO.listarParques();
                                    Plan plan = (Plan) session.getAttribute("plan");
                                    out.println("<label>Nombre Plan</label><br>");
                                    out.println("<input name='nombre' value=" + plan.getNombrePlan() + " /><br>");
                                    out.println("<label>Costo</label><br>");
                                    out.println("<input name='costo' value=" + plan.getCosto() + " /><br>");
                                    out.println("<label>Descripcion</label><br>");
                                    out.println("<input name='descripcion' value=" + plan.getDescripcion() + " /><br>");
                                    out.println("<label>Dias</label><br>");
                                    out.println("<input name='dias' value=" + plan.getDias() + " /><br>");
                                    out.println("<label>Noches</label><br>");
                                    out.println("<input name='noches' value=" + plan.getNoches() + " /><br>");
                                    out.println("<label>Parque</label><br>");
                                    out.println("<select class='form-control' name='idParque'><br>"); 
                                    out.println("<option value="+ plan.getParque().getIdParque() + ">"+ plan.getParque().getParque() +"</option>");
                                    for (Parque p : lista) {
                                        if(plan.getParque().getIdParque()!=p.getIdParque()){
                                             out.println("<option value="+ p.getIdParque() + ">"+ p.getParque() +"</option>");
                                        }
                                    }
                                    out.println("</select>");
                                    out.println("<input type='hidden' name='idPlan' value=" + plan.getIdPlan() + " />");
                                %>
                                
                            </div>
                            <input type="hidden" name="accion" value="ModificarPlan" /><br>
                            <input type="submit" class="btn btn-default" value="Modificar"/>
                        </form>
                </div>
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
