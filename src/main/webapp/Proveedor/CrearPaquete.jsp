
<%@page import="co.com.uniminuto.modelo.Hotel"%>
<%@page import="co.com.uniminuto.dao.HotelDAO"%>
<%@page import="co.com.uniminuto.dao.ParqueDAO"%>
<%@page import="co.com.uniminuto.modelo.Parque"%>
<%@page import="co.com.uniminuto.modelo.Plan"%>
<%@page import="co.com.uniminuto.dao.PlanDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Marketplace</title>

        <!-- Bootstrap Core CSS -->
        <link href="..\bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="..\bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="..\dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="..\bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <script type="text/javascript">
            function addUbicacion() {
                var idUbic = document.getElementById('idUbic').value;
                sessionStorage.setItem(idUbicacion, idUbic);
            }
        </script>

    </head>

    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Marketplace</a>
                </div>
                <!-- /.navbar-header -->

                <ul class="nav navbar-top-links navbar-right">

                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                            </li>
                            <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                        <!-- /.dropdown-user -->
                    </li>
                    <!-- /.dropdown -->
                </ul>
                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">

                            <li>
                                <a href="../Proveedor/InicioProvedor.jsp"><i class="fa fa-dashboard fa-fw"></i>Inicio</a>
                            </li>
                            <li>
                                <a href="../Proveedor/ConsultarPaquetes.jsp">Consultar Paquetes</a>
                            </li>
                            <li>
                                <a href="../Proveedor/CrearPaquete.jsp">Crear Parquete</a>
                            </li>
                            <li>
                                <a href="../configuracion/CrearParque.jsp">Mensajes</a>
                            </li>
                            <li>
                                <a href="#">otro</a>
                            </li>

                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>

            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Planes</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">

                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <form action="..\Controlador" method="Post" role="form">
                                            <div class="col-lg-6">
                                                <input class="form-control" name="action" value="CrearPaquete" placeholder="Enter text">
                                                <div class="form-group">
                                                    <label>Nombre paquete</label>
                                                    <input class="form-control" name="NombrePaquete" placeholder="Enter text">
                                                </div>
                                                <div class="form-group">
                                                    <label>Hotel</label>
                                                    <select name="Hotel" class="form-control">
                                                        <%
                                                            HotelDAO hotelDAO = new HotelDAO();
                                                            for (Hotel h : hotelDAO.listarHoteles()) {

                                                        %>
                                                        <option  value="<%=h.getIdHotel()%>"><%=h.getNombre()%></option>
                                                        <%
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>Noches</label>
                                                    <input name="Noches" class="form-control" name="noches" placeholder="Enter text">
                                                </div>
                                                <div class="form-group">
                                                    <label>Descripcion</label>
                                                    <textarea name="Descripcion" class="form-control" rows="10"></textarea>
                                                </div>
                                            </div>
                                            <!-- /.col-lg-6 (nested) -->
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label>Imagen Paquete</label>
                                                    <input name="ImagenParque" type="file">
                                                </div>
                                                <div class="form-group">
                                                    <label>Imagen Paquete</label>
                                                    <input name="ImagenPaquete" type="file">
                                                </div>
                                                <div class="radio-inline">
                                                    <label>Estado</label>
                                                    <label><input type="radio" name="Estado" value="1">Activar</label>
                                                    <label><input type="radio" name="Estado" value="0">Inactivar</label>
                                                </div>

                                                <div class="form-group">
                                                    <label>Parque</label>
                                                    <select  name="Parque" class="form-control">
                                                        <%
                                                            ParqueDAO parqueDAO = new ParqueDAO();
                                                            for (Parque p : parqueDAO.listarParques()) {

                                                        %>
                                                        <option  value="<%=p.getIdParque()%>"><%=p.getIdParque()%></option>
                                                        <%
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>Pagina hotel</label>
                                                    <input class="form-control" name="Pagina" placeholder="Enter text">
                                                </div>

                                                <div class="form-group">
                                                    <label>Costo</label>
                                                    <div class="form-group input-group">
                                                        <span class="input-group-addon">@</span>
                                                        <input type="text" name="Costo" class="form-control" placeholder="Username">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Descuento</label>
                                                    <div class="form-group input-group">
                                                        <span class="input-group-addon">@</span>
                                                        <select name="Descuento" class="form-control">
                                                            <option>0</option>
                                                            <option>10</option>
                                                            <option>30</option>
                                                            <option>40</option>
                                                            <option>50</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /.col-lg-6 (nested) -->
                                        </form>
                                    </div>
                                    <!-- /.row (nested) -->
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->


                </div>
                <!-- /#wrapper -->
            </div>
        </div>
        <!-- jQuery -->
        <script src="..\bower_components/jquery/dist/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="..\bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="..\bower_components/metisMenu/dist/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="..\dist/js/sb-admin-2.js"></script>

    </body>

</html>
