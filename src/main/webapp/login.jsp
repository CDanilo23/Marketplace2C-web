<%@page import="co.com.uniminuto.ejb.UsuarioFacadeLocal"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.Properties"%>
<!DOCTYPE html>
<html lang="en">

    <head>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>UNIMONITO - MarketPlace</title>

        <!-- Bootstrap Core CSS -->
        <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

        <ul class="nav navbar-top-links navbar-right">

            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    
                    <li>
                        <a href="registro/register.jsp"><i class="fa fa-sign-out fa-fw"></i> Register</a>
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
                            <h3 class="panel-title">Please Sign In</h3>
                        </div>
                        <div class="panel-body">
                            <form role="form" method="post" action="Controlador">
                                <input type="hidden" name="accion" value="login" />
                                <input type="hidden" name="login" value="0" />
                                <fieldset>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="User" name="user" type="text" autofocus>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Password" name="password" type="password">
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                        </label>
                                    </div>
                                    <!-- Change this to a button or input when using this as a form -->

                                    <input type="submit" class="btn btn-lg btn-success btn-block" value="Login" name="Login"/>
                                </fieldset>
                            </form>
                        </div>
                        <%

                            String S = "none";
                            String value = request.getParameter("men");
                            if (value != null) {
                                S = "block";
                            }
                        %>
                        <div id="Mensaje"  class="alert-success" style="display: <%=S%>">
                            <strong>¡<%=request.getParameter("men")%>!</strong> 
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="bower_components/jquery/dist/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="dist/js/sb-admin-2.js"></script>

    </body>

</html>
