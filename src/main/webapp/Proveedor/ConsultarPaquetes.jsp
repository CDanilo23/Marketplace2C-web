
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
                    <!-- /.row -->

                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Administrar Paquete
                                </div>

                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Nombre Paquete</th>
                                                    <th>Parque</th>
                                                    <th>Costo</th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    PlanDAO planDAO = new PlanDAO();
                                                    for (Plan p : planDAO.listarPlan() ) {
                                                %>
                                                <tr>
                                                    <td><%=p.getIdPlan()%></td>
                                                    <td><%=p.getNombrePlan()%></td>
                                                    <td><%=p.getParque().getParque()%></td>
                                                    <td><%=p.getCosto()%></td>
                                                    <td><a href="../Proveedor/AdministrarPaquete.jsq" >Administrar</a></td>
                                                    <td><a href="#" >Consultar</a></td>
                                                    <td><a href="#" >Eliminar</a></td>
                                                </tr>
                                                <%
                                                    }
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.panel-body -->

                                <!-- /.panel -->
                            </div>
                            <!-- /.col-lg-6 -->

                            <!-- /.container-fluid -->
                        </div>
                        <!-- /#page-wrapper -->

                    </div>
                    <!-- /#page-wrapper -->

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
