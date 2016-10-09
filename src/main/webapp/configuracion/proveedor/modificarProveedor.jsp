<%-- 
    Document   : ModificarProveedor
    Created on : 13/09/2016, 09:09:51 PM
    Author     : cristian.ordonez
--%>

<%@page import="co.com.uniminuto.util.TipoDocumentoEnum"%>
<%@page import="co.com.uniminuto.entities.Usuario"%>
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
        <title>Modificar Proveedor</title>
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
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Configuracion Proveedores<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">

                                <li>
                                    <a href="crearProveedor.jsp">Crear nuevo Proveedor</a>
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
                <div class="row">
                    <div class="panel-group">
                        <form action="../../Controlador" method="post">
                            <div class="form-group">
                                <%
                                    Usuario proveedor = (Usuario) session.getAttribute("proveedor");
                                %>
                                <div class="form-group">
                                    <label>Usuario</label>
                                    <input class="form-control" name='usuario' value="<%=proveedor.getUsuario()%>" placeholder="Usuario"/><br>
                                </div>
                                <div class="form-group">
                                    <label>Empresa</label>
                                    <input class="form-control" name='empresa' value="<%=proveedor.getEmpresa()%>" placeholder="Empresa"/><br>
                                </div>
                                <div class="form-group">
                                    <label>Nombre</label>
                                    <input class="form-control" name='nombre' value="<%=proveedor.getNombre()%> " placeholder="Nombre Empresa"/><br>
                                </div>
                                <div class="form-group">
                                    <label>Numero de documento</label>
                                    <input class="form-control" name='numDocumento' value="<%=proveedor.getNumeroDocumento()%> " placeholder="Numero de Documento"/><br>
                                </div>
                                <div class="form-group">
                                    <label>Direccion</label>
                                    <input class="form-control" name='direccion' value="<%=proveedor.getDireccion()%>" placeholder="Direccion" /><br>
                                </div>   
                                <div class="form-group">
                                    <label>Telefono</label>
                                    <input class="form-control" name='telefono' value="<%=proveedor.getTelefono()%>" placeholder="Telefono"/><br>
                                </div> 
                                <div class="input-group">
                                    <span class="input-group-addon">@</span>
                                    <input name="correo" id="email" type="email" class="form-control" placeholder="Correo" value="<%=proveedor.getCorreo()%>"/>
                                </div>

                                <input type='hidden' name='idProveedor' value="<%=proveedor.getIdUsuario()%>" />

                                <input type="hidden" name="accion" value="ModificarProveedor" /><br>
                                <input type="submit" class="btn btn-default" value="Modificar" />
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

