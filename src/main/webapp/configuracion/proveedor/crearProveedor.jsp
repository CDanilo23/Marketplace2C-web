<%-- 
    Document   : CrearProveedor
    Created on : 13/09/2016, 09:00:51 PM
    Author     : cristian.ordonez
--%>

<%@page import="co.com.uniminuto.util.TipoDocumentoEnum"%>
<%@page import="java.util.List"%>
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
                                    <a href="configuracionProveedores.jsp">Consultar proveedores</a>
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
                    <form action="../../Controlador" method="post">
                        <div class="form-group">
                            <input class="form-control" name='usuario' type="text" placeholder="Usuario"><br>
                            <input class="form-control" name='empresa' type="text" placeholder="Empresa"> <br>
                            <input class="form-control" name='nombreProveedor' type="text" placeholder="Nombre proveedor"><br>
                            <input class="form-control" name='password' type="password" placeholder="Password"><br>
                            <div class="form-group">
                                <label>Tipo Documento</label><br>
                                <select class="form-control" name="tipoDocumento">
                                    <%
                                        for (TipoDocumentoEnum tp : TipoDocumentoEnum.values()) {
                                    %>
                                    <option value="<%=tp.getValor()%>"><%=tp.getDescripcion()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <input class="form-control" name='numDocumento' type="text" placeholder="Numero de documento"><br>
                            <input class="form-control" name='direccion' type="text" placeholder="Direccion"><br>
                            <input class="form-control" name='telefono' type="text" placeholder="Telefono"><br>
                            <div class="input-group">
                                <span class="input-group-addon">@</span>
                                <input name="correo" id="email" type="email" class="form-control" placeholder="Correo"/>
                            </div>
                        </div>
                        <input type="hidden" name="accion" value="CrearProveedor" /><br>
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

