<%-- 
    Document   : registroCliente
    Created on : 2/10/2016, 10:14:25 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Unimonito</title>

        <!-- Bootstrap Core CSS -->
        <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <script type="text/javascript" src="../js/modernizr.js"></script>

    </head>
    <body>
         <ul class="nav navbar-top-links navbar-right">

            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    
                    <li>
                        <a href="../login.jsp"><i class="fa fa-sign-out fa-fw"></i> Login</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Please Register</h3>
                        </div>
                        <div class="panel-body">
                            <form action="../Controlador" method="post" class="form-group">
                                <input type="hidden" name="accion" value="registro" />
                                <fieldset>
                                    <div>
                                        <input type="text" class="form-control" placeholder="Nombres" name="nombre">
                                    </div>
                                    <div>
                                        <input id="usuario" type="text" class="form-control" placeholder="Usuario" name="usuario"/>
                                    </div>
                                    <div>
                                        <input id="cedula" type="text" class="form-control" placeholder="Cedula" name="cedula"/>
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon">@</span>
                                        <input id="email" type="email" class="form-control" placeholder="Correo" name="correo"/>
                                    </div>
                                    <br>
                                    <input type="submit" class="btn btn btn-lg btn-danger btn-block" >
                                    <br>
                                    <%
                                        HttpSession httpSession = request.getSession();
                                        java.lang.Exception ex = (java.lang.Exception) httpSession.getAttribute("ex");
                                        if (ex != null && ex.getMessage() != null) {
                                            String tipoAlerta="alert-danger";
                                            if(ex.getCause()!=null){
                                                tipoAlerta = "alert-success";
                                            }
                                            out.println("<br>");
                                            out.println("<div align='center'>");
                                            out.println("<label class='"+tipoAlerta+"'>" + ex.getMessage() + "</label>");
                                            out.println("</div>");
                                            httpSession.removeAttribute("ex");
                                        };
                                    %>
                                </fieldset>
                            </form>
                        </div>
                    </div>
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
