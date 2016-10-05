<%-- 
    Document   : CrearProveedor
    Created on : 13/09/2016, 09:00:51 PM
    Author     : cristian.ordonez
--%>

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
        <title>Crear Proveedor</title>
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
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Configuracion proveedores <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="ConfiguracionProveedores.jsp">Consultar proveedores</a>
                                </li>
                                <li>
                                    <a href="EliminarProveedor.jsp">Eliminar Proveedor</a>
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
                <caption><h1>Configuracion Proveedores</h1></caption>
                <br>
                <div class="panel-group">
                    <form action="../Controlador" method="post">
                        <div class="form-group">
                            <label>Empresa</label><br>
                            <input name='empresa' type="text"><br>
                            <label>Nombre proveedor</label><br>
                            <input name='nombreProveedor' type="text"><br>
                            <label>Nit</label><br>
                            <input name='nit' type="text"><br>
                            <label>Direccion</label><br>
                            <input name='direccion' type="text"><br>
                            <label>Telefono</label><br>
                            <input name='telefono' type="text"><br>
                        </div>
                        <input type="hidden" name="accion" value="CrearProveedor" /><br>
                        <input type="submit" class="btn btn-default" value="Crear" />
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

