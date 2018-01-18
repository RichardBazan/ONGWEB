
<%@page import="java.util.ArrayList"%>
<%@page import="javax.swing.JOptionPane"%>
<!DOCTYPE html>
<%@page import="java.sql.*, DAO.DAOCASAREFUGIO" %>
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
	
		<!-- remove this if you use Modernizr -->
		<script>(function(e,t,n){var r=e.querySelectorAll("html")[0];r.className=r.className.replace(/(^|\s)no-js(\s|$)/,"$1js$2")})(document,window,0);</script> 
    <!-- /PARA INPUT FILE -->            
</head>

<%!
     String nombreUsuario="", primeraLetraApellidoPat="",usernameUsuario="",nombreCasa="",direccionCasa="",codigoUsuario="";
     String telefonoCasa="",descripcionCasa="",fechaRegistroCasa="";
     int codigoCRseleccionada;
     ArrayList<String> fotos = new ArrayList();
%>

<%
    HttpSession ses = request.getSession();
    if (ses.getAttribute("datosUsuario")!=null){
         String[] datosUsuario = (String[])ses.getAttribute("datosUsuario");
         nombreUsuario = datosUsuario[0];
         primeraLetraApellidoPat = datosUsuario[1];
         usernameUsuario = datosUsuario[2];
         codigoUsuario = datosUsuario[3];
     }

    codigoCRseleccionada = Integer.parseInt(request.getParameter("codigoCR"));
    ResultSet rsDatosCasa = DAOCASAREFUGIO.casaRefugioPorCodigo(codigoCRseleccionada);
    ResultSet rsFotosCasa = DAOCASAREFUGIO.fotosPorCodigoCR(codigoCRseleccionada);
    
    if(rsDatosCasa.next()){
        nombreCasa=rsDatosCasa.getString(2);
        direccionCasa=rsDatosCasa.getString(3);
        telefonoCasa=rsDatosCasa.getString(4);
        descripcionCasa=rsDatosCasa.getString(5);
        fechaRegistroCasa=rsDatosCasa.getString(6);
    }
    
    while (rsFotosCasa.next()){
        fotos.add(rsFotosCasa.getString(2));
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
                        <li><a href="SERLOGOUT"><i class="fa fa-sign-out fa-fw"></i>Logout</a>
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
                    <li>
                       
                    </li>
                    <li>
                        <a href="inicio.jsp"><i class="fa fa-dashboard fa-fw"></i>&nbsp;PRINCIPAL</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-edit fa-fw"></i>ADOPCIÓN<span class="fa arrow"></span></a> 
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="registrarDarAdopcion.jsp">Dar en adopción</a>
                            </li>
                            <li>
                                <a href="listaAdopcion.jsp">Perros en adopcion</a>
                            </li>  
                            <li>
                                <a href="listaAdoptados.jsp">Perros adoptados</a>
                            </li> 
                        </ul>
                    </li>
                    
                    <li class="active">
                        <a href="#"><i class="fa fa-edit fa-fw"></i>CASA REFUGIO<span class="fa arrow"></span></a> 
                        <ul class="nav nav-second-level">
                            <li>
                            <a href="RegistrarCasaRefugio.jsp">Registrar casa refugio nueva</a>
                            </li>
                            <li>
                                <a href="ListadoCasaRefugio.jsp">Casas refugio registradas</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="#"><i class="fa fa-edit fa-fw"></i>CASOS DE MALTRATO<span class="fa arrow"></span></a> 
                        <ul class="nav nav-third-level">
                         <li>
                                <a href="registrarMaltrato.jsp">Denunciar caso nuevo</a>
                            </li>
                            <li>
                                <a href="listaMaltrato.jsp">Casos registrados</a>
                            </li>
                             <li>
                                 <a href="listaDenunciaSolucionada.jsp">Casos atendidos</a>
                            </li>
                        </ul>
                            </li>     
                            <%
                            if (Integer.parseInt(codigoUsuario)<4){
                                %>
                                <li>
                                    <a href="#"><i class="fa fa-wrench fa-fw"></i>ADMINISTRADOR<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                        <li>
                                            <a href="listaAdminMascota.jsp">Mascotas</a>
                                        </li>
                                        <li>
                                            <a href="listaAdminAdoptados.jsp">Adopciones</a>
                                        </li>
                                        <li>
                                            <a href="listaAdminCasaRefugio.jsp">Casas refugio</a>
                                        </li>
                                        <li>
                                            <a href="listaAdminDenuncia.jsp">Denuncias de casos de maltrato</a>
                                        </li>
                                        <li>
                                            <a href="listaAdminDonacion.jsp">Donaciones</a>
                                        </li>
                                        <li>
                                            <a href="AdminRegistrarUsuario.jsp">Registro de Colaboradores</a>
                                        </li>
                                    </ul>
                                </li>
                                <%
                            }
                                %>
                    <!--                              </MENU>                        -->
                </ul>
                <!-- end side-menu -->
            </div>
            <!-- end sidebar-collapse -->
        </nav>
        <!-- end navbar side -->
        <!--  page-wrapper -->
        <div id="page-wrapper">

            <div class="row">
                <!-- Page Header -->
                <div class="col-lg-12">
                    <h1 class="page-header">Detalles de Casa Refugio</h1>
                </div>
                <!--End Page Header -->
            </div>

              <div class="row">
                <div class="col-lg-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a href="ListadoCasaRefugio.jsp"><img src="assets/images/retornar.png" width="30" height="30"></a>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form role="form">
                                        <div class="form-group col-lg-12 text-center">
                                            <h2><%=nombreCasa%></h2>
                                        </div>    
                                        <div class="form-group col-lg-5">
                                            
                                            <!-- CARRUSEL -->
                                            
                                            <div id="homeCarousel" class="carousel slide carousel-home" data-ride="carousel">
                                                <ol class="carousel-indicators">
                                                    
                                                    <%
                                                    int contimgs=0;
                                                    for (String x: fotos){
                                                        if (contimgs==0){
                                                            %>
                                                            <li data-target="#homeCarousel" data-slide-to="0" class="active"></li>
                                                            <%
                                                        }else{
                                                            %>
                                                            <li data-target="#homeCarousel" data-slide-to="<%=contimgs%>"></li>
                                                            <%
                                                        }
                                                        contimgs++;
                                                    }
                                                    contimgs=0;
                                                    %>
                                                </ol>
                                                
                                                <div class="carousel-inner" role="listbox">
                                                    <%
                                                    for (String x: fotos){
                                                      if (contimgs==0){
                                                          %>
                                                <div class="item active">
                                                    <img src="assets/images/<%=x%>" alt="">
                                                </div>           
                                                          <%
                                                      }else{
                                                          %>
                                                <div class="item ">
                                                    <img src="assets/images/<%=x%>" alt="">
                                                </div>           
                                                          <%
                                                      }  
                                                      contimgs++;
                                                    }
                                                    contimgs=0;
                                                    fotos=new ArrayList();
                                                    %>
                                                </div>
                                                <!--
                                                <div class="carousel-inner" role="listbox">
                                                    <div class="item active">
                                                        <img src="assets/images/cr1.jpg" alt="">
                                                    </div> 
                                                    
                                                    <div class="item ">
                                                        <img src="assets/images/cr2.jpg" alt="">
                                                    </div> 
                                                    
                                                    <div class="item ">
                                                        <img src="assets/images/cr3.jpg" alt="">
                                                    </div> 
                                                </div>
                                                -->
                                                <a class="left carousel-control" href="#homeCarousel" role="button" data-slide="prev">
                                                    <span class="fa fa-angle-left" aria-hidden="true"></span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                                
                                                <a class="right carousel-control" href="#homeCarousel" role="button" data-slide="next">
                                                    <span class="fa fa-angle-right" aria-hidden="true"></span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </div>
                                            
                                            <!-- CARRUSEL -->
                                        
                                        </div>
                                        
                                        <div class="form-group col-lg-6">
                                            <textarea class="form-control" rows="8" readonly=""><%=descripcionCasa%> .</textarea>
                                        </div>
                                        
                                        <div class="form-group col-lg-6">
                                             <p>Direccion: <%=direccionCasa%> .</p>
                                             <p>Teléfono contacto: <%=telefonoCasa%> .</p>
                                             <p>Registrado : <%=fechaRegistroCasa%></p>
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <a href="Donaciones.jsp?codigoCR=<%=codigoCRseleccionada%>"><button type="button" class="btn btn-primary">DONACIONES</button></a>
                                        </div>
                                        </form>
                                       </div>
                            </div>
                        </div>
                        </div>
                        
                    </div>
                     <!-- End Form Elements -->
                </div>
            </div>
        </div>
        <!-- end page-wrapper -->

    
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

</body>

</html>

