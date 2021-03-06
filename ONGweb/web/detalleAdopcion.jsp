<%@page import="DTO.DTODARADOPCION"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DAOADOPCION"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DOGLOVERS</title>
    <!-- Core CSS - Include with every page -->
    <link href="assets/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/main-style.css" rel="stylesheet" />
    <link href="style.css" rel="stylesheet" type="text/css"/>
    <!-- PARA INPUT FILE -->
    <link rel="stylesheet" type="text/css" href="assets/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/component.css" />
	
		<!-- remove this if you use Modernizr -->
		<script>(function(e,t,n){var r=e.querySelectorAll("html")[0];r.className=r.className.replace(/(^|\s)no-js(\s|$)/,"$1js$2")})(document,window,0);</script> 
    <!-- /PARA INPUT FILE -->      
</head>

<%!
     String nombreUsuario="", primeraLetraApellidoPat="",usernameUsuario="",codigoUsuario="",pertenenciaUsuario="",fotoUsuario="";
   %>

<%
    HttpSession ses = request.getSession();
    if (ses.getAttribute("datosUsuario")!=null){
         String[] datosUsuario = (String[])ses.getAttribute("datosUsuario");
         nombreUsuario = datosUsuario[0];
         primeraLetraApellidoPat = datosUsuario[1];
         usernameUsuario = datosUsuario[2];
         codigoUsuario = datosUsuario[3];
         pertenenciaUsuario=datosUsuario[9];
         fotoUsuario=datosUsuario[10];
     }
%>

<body>
    <!--  wrapper -->
    <div id="wrapper" style="background: #115C9B">
        <!-- navbar top -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar" style="background: #115C9B">
            <!-- navbar-header -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                &nbsp;&nbsp;<a href="inicio.jsp"><img src="assets/images/logooficial2.png" width="180" height="60" alt=""></a>
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
                        <li><a href="inicio.jsp"><i class="fa fa-user fa-fw"></i>Perfil (Principal)</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="SERLOGOUT"><i class="fa fa-sign-out fa-fw"></i>Cerrar Sesi�n</a>
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
                <ul class="nav" id="side-menu" style="background: #1F76BD">
                    <li>
                        <!-- user image section-->
                        <div class="user-section" style="background: #115C9B">
                            <div class="user-section-inner">
                                <img src="<%=fotoUsuario%>" alt="">
                            </div>
                            <div class="user-info">
                                <div style="color: #ffffff"><%=nombreUsuario%> <strong><%=primeraLetraApellidoPat%>.</strong></div>
                                <div style="font-size: 14px; text-align: center;color: #ffffff">( <i><%=usernameUsuario%></i> )</div>
                                <div class="user-text-online">
                                    <span class="user-circle-online btn btn-success btn-circle "></span>&nbsp;En l�nea
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
                    <li class="active">
                        <a href="#"><i class="fa fa-edit fa-fw"></i>ADOPCI�N<span class="fa arrow"></span></a> 
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="registrarDarAdopcion.jsp">Dar en adopci�n</a>
                            </li>
                            <li>
                                <a href="listaAdopcion.jsp">Perros en adopcion</a>
                            </li>  
                            <li>
                                <a href="listaAdoptados.jsp">Perros adoptados</a>
                            </li> 
                        </ul>
                    </li>
                    
                    <li>
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
                            if (pertenenciaUsuario.equalsIgnoreCase("ONG")){
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
                                <li>
                                    <a href="#"><i class="fa fa-wrench fa-fw"></i>REPORTES<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                        <li>
                                            <a href="reporteMascota.jsp">Mascotas</a>
                                        </li>
                                        <li>
                                            <a href="reporteAdopcion.jsp">Adopciones</a>
                                        </li>
                                        <li>
                                            <a href="reporteCasaRefugio.jsp">Casas refugio</a>
                                        </li>
                                        <li>
                                            <a href="reporteDenuncia.jsp">Denuncias de casos de maltrato</a>
                                        </li>
                                        <li>
                                            <a href="reporteDonaciones.jsp">Donaciones</a>
                                        </li>
                                        <li>
                                            <a href="reporteUsuarios.jsp">Usuarios</a>
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
                    <h1 class="page-header">Detalle de Adopci�n</h1>
                </div>
                <!--End Page Header -->
            </div>

              <div class="row">
                <div class="col-lg-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a href="listaAdopcion.jsp">
                                <img src="assets/images/retornar.png" width="25px" alt=""/>
                            </a>
                        </div>
                        
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                <form role="form" name="frmDarAdopcion_" method="POST">          
                                    
                                    <div class="col-lg-6">
                         <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <tbody>
                                        <%  int cod  = Integer.parseInt(request.getParameter("cod_mas")); 
                                            DAOADOPCION obj= new DAOADOPCION();
                                            for(DTODARADOPCION x:obj.buscarDetalleAdopcion(cod)){%> 
                                       
                                            <tr class="odd gradeX"><br>
                                            <td><h1><center><b><%=x.getNom_mas()%></b></center></h1></td>
                                            </tr>
                                           
                                            <tr class="odd gradeX">
                                                <td width="500" colspan="2" ><center>Descripci�n</center></td><tr></tr>
                                            <td colspan="3" style="height: 225px"><%=x.getDescrip_mas()%></td>
                                            </tr>
                                            
                                            <tr class="odd gradeX">
                                            <td><center>Raza</center></td>
                                            <td colspan="2"><center><%=x.getNom_raza()%></center></td>
                                            </tr>
                                            
                                            <input type="hidden" name="tenen" value="<%=x.getTendencia_mas()%>">  
 
                                    </tbody>
                                </table>
                                </div>
                                    <div class="col-lg-6">
                                        <br>
                                        <br>
                                        <br>
                                <table>
                                         <!-- CARRUSEL -->
                                         <tbody>
                                             <div id="homeCarousel" class="carousel slide carousel-home" data-ride="carousel">
                                                <ol class="carousel-indicators">
                                                    
                                                    <%}int con=0;
                                                      for (DTODARADOPCION y:obj.buscarImgDetalleAdopcion(cod)){
                                                        if (con==0){
                                                            %>
                                                             <li data-target="#homeCarousel" data-slide-to="0" class="active"></li>
                                                            <%
                                                        }else{
                                                            %>
                                                            <li data-target="#homeCarousel" data-slide-to="<%=con%>"></li>
                                                            <%
                                                        }
                                                        con++;
                                                    }
                                                    con=0;
                                                    %>
                                                </ol>
                                              
                                                <div class="carousel-inner" role="listbox" >
                                                
                                                    <% String foto;
                                                    for (DTODARADOPCION y:obj.buscarImgDetalleAdopcion(cod)){
                                                        foto = y.getFoto();
                                                      if (con==0){
                                                          %>
                                                          <div class="item active">
                                                              <img src="<%=foto%>" style="height: 350px" alt="">
                                                </div>           
                                                          <%
                                                      }else{
                                                          %>
                                                            <div class="item">
                                                               <img src="<%=foto%>" style="height: 350px" alt="">
                                                </div>           
                                                 <%
                                                      }  
                                                      con++;
                                                    }
                                                    con=0;
                                                    foto=null;
                                                    %>
                                                </div>
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
                                        </tbody>
                                    </table>
                                             </div>
                                                
                                                <div class="row">
                                                    <div class="col-lg-12">
                            <div class="col-lg-12">
                                <%
                                                    if(!pertenenciaUsuario.equalsIgnoreCase("ONG")){
                                                        %>
                                                        <input type="button" class="btn btn-primary" onclick="valida('<%=cod%>')" value="Adoptar">
                                                        <%
                                                    }
                                %>
                                            
                            </div>
                                                </div>                    
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
            <script langiage="javascript" type="text/javascript">
            function valida(codigo) {
                valor=document.frmDarAdopcion_.tenen.value;
                if(valor === 'Usuario'){
                    location.href='confirmaAdopcionUsuario.jsp?id_mascot='+codigo;
                }else{
                    location.href='confirmaAdopcionONG.jsp?id_mascot='+codigo;
                }} 
        </script>
</body>
</html>


