
<!DOCTYPE html>
<%@page import="java.sql.ResultSet , DAO.DAOCASAREFUGIO , DTO.DTOCASAREFUGIO" %>
<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bootsrtap Free Admin Template - SIMINTA | Admin Dashboad Template</title>
    <!-- Core CSS - Include with every page -->
    <link href="assets/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/main-style.css" rel="stylesheet" />
    <!-- PARA INPUT FILE -->
    <link rel="stylesheet" type="text/css" href="assets/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/component.css" />
    
    <link rel="stylesheet" href="assets/css/owl.carousel.css">
    
    <!-- Page-Level CSS -->
    <link href="assets/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
	
		<!-- remove this if you use Modernizr -->
		<script>(function(e,t,n){var r=e.querySelectorAll("html")[0];r.className=r.className.replace(/(^|\s)no-js(\s|$)/,"$1js$2")})(document,window,0);</script> 
    <!-- /PARA INPUT FILE -->            
</head>

<%!
     String nombreUsuario="", primeraLetraApellidoPat="",usernameUsuario="";
%>

<%
    HttpSession ses = request.getSession();
    if (ses.getAttribute("datosUsuario")!=null){
         String[] datosUsuario = (String[])ses.getAttribute("datosUsuario");
         nombreUsuario = datosUsuario[0];
         primeraLetraApellidoPat = datosUsuario[1];
         usernameUsuario = datosUsuario[2];
     }
%>
   
<body>
    <!--  wrapper -->
    <div id="wrapper">
        <!-- navbar top -->
<nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar">
            <!-- navbar-header -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">
                    <img src="assets/img/logo.png" alt="" />
                </a>
            </div>
            <!-- end navbar-header -->
            <!-- navbar-top-links -->
            <ul class="nav navbar-top-links navbar-right">
                <!-- main dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-3x"></i>
                    </a>
                    <!-- dropdown user-->
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i>User Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i>Logout</a>
                        </li>
                    </ul>
                    <!-- end dropdown-user -->
                </li>
                <!-- end main dropdown -->
            </ul>
            <!-- end navbar-top-links -->

        </nav>
        <!-- end navbar top -->

        <!-- navbar side -->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <!-- sidebar-collapse -->
            <div class="sidebar-collapse">
                <!-- side-menu -->
                <ul class="nav" id="side-menu">
                    <li>
                        <!-- user image section-->
                        <div class="user-section">
                            <div class="user-section-inner">
                                <img src="assets/img/user.jpg" alt="">
                            </div>
                            <div class="user-info">
                                <div><%=nombreUsuario%> <strong><%=primeraLetraApellidoPat%>.</strong></div>
                                <div style="font-size: 14px; text-align: center;">( <i><%=usernameUsuario%></i> )</div>
                                <div class="user-text-online">
                                    <span class="user-circle-online btn btn-success btn-circle "></span>&nbsp;Online
                                </div>
                            </div>
                        </div>
                        <!--end user image section-->
                    </li>
                    <li class="sidebar-search">
                        <!-- search section-->
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                        <!--end search section-->
                    </li>
                    <li class="">
                        <a href="inicio.jsp"><i class="fa fa-dashboard fa-fw"></i>Dashboard</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Charts<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="flot.html">Flot Charts</a>
                            </li>
                            <li>
                                <a href="morris.html">Morris Charts</a>
                            </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>
                     <li>
                        <a href="timeline.html"><i class="fa fa-flask fa-fw"></i>Timeline</a>
                    </li>
                    <li>
                        <a href="tables.html"><i class="fa fa-table fa-fw"></i>Tables</a>
                    </li>
                    <li>
                        <a href="forms.html"><i class="fa fa-edit fa-fw"></i>Forms</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-wrench fa-fw"></i>UI Elements<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="panels-wells.html">Panels and Wells</a>
                            </li>
                            <li>
                                <a href="buttons.html">Buttons</a>
                            </li>
                            <li>
                                <a href="typography.html">Typography</a>
                            </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>
                      <li  class="active">
                        <a href="#"><i class="fa fa-edit fa-fw"></i>Formularios<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                        <a href="#"><i class="fa fa-fw"></i>Adopción<span class="fa arrow"></span></a> 
                        <ul class="nav nav-third-level">
                        <li>
                                <a href="registrarDarAdopcion.jsp">RegistrarDarEnAdopción</a>
                            </li>
                            <li>
                                <a href="listaAdopcion.jsp">ListaPerrosenAdopcion</a>
                            </li>    
                        </ul>
                            </li>
                            
                             <li  class="active">
                        <a href="#"><i class="fa fa-fw"></i>Casa Refugio<span class="fa arrow"></span></a> 
                        <ul class="nav nav-third-level">
                            <li>
                            <a href="RegistrarCasaRefugio.jsp">RegistrarCasaRefugio</a>
                            </li>
                            <li class="selected">
                                <a href="ListadoCasaRefugio.jsp">ListadoCasaRefugio</a>
                            </li>
                        </ul>
                            </li>
                            
                            <li>
                        <a href="#"><i class="fa fa-fw"></i>Maltrato<span class="fa arrow"></span></a> 
                        <ul class="nav nav-third-level">
                         <li>
                                <a href="registrarMaltrato.jsp">RegistrarMaltrato</a>
                            </li>
                            <li>
                                <a href="listaMaltrato.jsp">ListadoMaltrato</a>
                            </li>
                        </ul>
                            </li>                         
                        </ul>
                        <!-- second-level-items -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-files-o fa-fw"></i>Sample Pages<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li class="selected">
                                <a href="blank.html">Blank Page</a>
                            </li>
                            <li>
                                <a href="login.html">Login Page</a>
                            </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>
                </ul>
                <!-- end side-menu -->
            </div>
            <!-- end sidebar-collapse -->
        </nav>
        <!-- end navbar side -->
        <!--  page-wrapper -->
        <div id="page-wrapper">

            <div class="row">
                 <!--  page header -->
                <div class="col-lg-12">
                    <h1 class="page-header">Listado de Casas Refugio</h1>
                </div>
                 <!-- end  page header -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading" style="text-align: center">
                            <p>"Los malos días no existen si en casa te espera un perro&hellip;"</p>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>NOMBRE</th>                 
                                            <th>DESCRIPCIÓN</th>    
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                        ResultSet rs = DAOCASAREFUGIO.listarCasasRefugio();
                                        int cont=4;
                                        while(rs.next()){
                                            String src = "assets/images/cr"+ (++cont) +".jpg";
                                            System.out.println(cont);
                                            %>
                                            <tr>
                                                <td style="text-align: center;" ><h4><strong><%=rs.getString(2).toUpperCase()%></strong></h4>
                                                    <img src="<%=src%>" width="350" height="200"/>
                                                </td>
                                            <%
                                            if (cont%2>0){
                                            if (rs.getString(5).length()>150){
                                            %>
                                            <td width="500" title="Ver más&hellip;" onclick="redireccionarA('./DetalleCasaRefugio.jsp?codigoCR=<%=rs.getInt(1)%>')">
                                                <br><br><br><br><br>
                                                <%=rs.getString(5).substring(0,150)%>&hellip;
                                            </td>
                                            <%
                                            }else{
                                            %>    
                                                <td width="500" title="Ver más&hellip;" onclick="redireccionarA('./DetalleCasaRefugio.jsp?codigoCR=<%=rs.getInt(1)%>')">
                                                <br><br><br><br><br>
                                                <%=rs.getString(5)%>
                                                </td>       
                                           <%
                                            }
                                            }else{
                                            if (rs.getString(5).length()>150){
                                            %>
                                            <td width="500" title="Ver más&hellip;" onclick="redireccionarA('./DetalleCasaRefugio.jsp?codigoCR=<%=rs.getInt(1)%>')">
                                                   <br><br><br><br><br>
                                                <%=rs.getString(5).substring(0,150)%>&hellip;
                                            </td>
                                            <%
                                            }else{
                                            %>    
                                                <td  width="500" title="Ver más&hellip;" onclick="redireccionarA('./DetalleCasaRefugio.jsp?codigoCR=<%=rs.getInt(1)%>')">
                                                    <br><br><br><br><br>
                                                    <%=rs.getString(5)%>
                                                </td>       
                                           <%
                                            }    
                                            }
                                        }
                                           %>
                                        </tr>                                 
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
            
        </div>
     </div>
    <!-- end wrapper -->

    <!-- Core Scripts - Include with every page -->
    <!-- PARA INPUT FILE -->
    <script src="assets/js/custom-file-input.js"></script>
    <!-- /PARA INPUT FILE -->
    <script src="assets/plugins/jquery-1.10.2.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="assets/plugins/pace/pace.js"></script>
    <script src="assets/scripts/siminta.js"></script>
    <!-- Page-Level Plugin Scripts-->
    <script src="assets/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="assets/plugins/dataTables/dataTables.bootstrap.js"></script>
    
    <script>
        $(document).ready(function () {
            $('#dataTables-example').dataTable();
        });
    </script>
    
    <script type="text/javascript">
        function redireccionarA(pagina){
            location.href =pagina;
        }
        
        function cambiaColor(idelemento,color){
            obj = document.getElementById(idelemento);
            obj.style.backgroundColor = color;
        }
    </script>
    
    
</body>

</html>

