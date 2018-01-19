
<%@page import="java.sql.ResultSet,DAO.*"%>
<!DOCTYPE html>
<html>
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
    <!-- Page-Level CSS -->
    <link href="assets/plugins/morris/morris-0.4.3.min.css" rel="stylesheet" />
      
    <!-- PARA INPUT FILE -->
    <!-- Modernizr -->
        <script src="assets/js/modernizr-2.6.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="assets/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/component.css" />
	
		<!-- remove this if you use Modernizr -->
		<script>(function(e,t,n){var r=e.querySelectorAll("html")[0];r.className=r.className.replace(/(^|\s)no-js(\s|$)/,"$1js$2")})(document,window,0);</script> 
    <!-- /PARA INPUT FILE -->     

   </head>
   
   <%!
     String nombreUsuario="", primeraLetraApellidoPat="",usernameUsuario="",codigoUsuario="",apellidoPat="",apellidoMat="",fechaNacimiento="",direccion="",telefono="",pertenenciaUsuario="";
     int cantidadDenuncias,cantidadCasas,cantidadAdoptados,cantidadDadosAdopcion;

   %>
    <%
     HttpSession ses = request.getSession();
     //JOptionPane.showMessageDialog(null,ses.getAttribute("resultadoRegistro"));
     if (ses.getAttribute("resultadoLogin")!=null){
         String msje = ses.getAttribute("resultadoLogin").toString();
    %>
        <body onload="alerta('<%=msje%>')">
    <%
        }
     else{
    %>
         <body>
    <%
        }
     if (ses.getAttribute("datosUsuario")!=null){
         String[] datosUsuario = (String[])ses.getAttribute("datosUsuario");
         nombreUsuario = datosUsuario[0];
         primeraLetraApellidoPat = datosUsuario[1];
         usernameUsuario = datosUsuario[2];
         codigoUsuario = datosUsuario[3];
         apellidoPat=datosUsuario[4];
         apellidoMat=datosUsuario[5];
         fechaNacimiento=datosUsuario[6];
         direccion=datosUsuario[7];
         telefono=datosUsuario[8];
         pertenenciaUsuario=datosUsuario[9];
     }
     ses.setAttribute("resultadoLogin",null);
     
     ResultSet rs = DAOADOPCION.cantidadPerrosDadosenAdopcionPor(Integer.parseInt(codigoUsuario));
     if(rs.next()){
         cantidadDadosAdopcion=Integer.parseInt(rs.getString(1));
     }
     
     rs = DAOADOPCION.cantidadPerrosAdoptadosPor(Integer.parseInt(codigoUsuario));
     if(rs.next()){
         cantidadAdoptados=rs.getInt(1);
     }
     
     rs = DAOCASAREFUGIO.cantidadCasasRefugioRegistradaPor(Integer.parseInt(codigoUsuario));
     if(rs.next()){
         cantidadCasas=rs.getInt(1);
     }
     
     rs = DAODENUNCIA.cantidadDenunciasRegistradaPor(Integer.parseInt(codigoUsuario));
     if(rs.next()){
         cantidadDenuncias=rs.getInt(1);
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
                    <!--                              <MENU>                        -->
                    <li class="selected">
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
                    <h1 class="page-header">Principal</h1>
                </div>
                <!--End Page Header -->
            </div>

            <div class="row">
                <!-- Welcome -->
                <div class="col-lg-12">
                    <div class="alert alert-info">
                        <i class="fa fa-folder-open"></i><b>&nbsp;Hola ! </b>Bienvenido <b><%=nombreUsuario+" "+primeraLetraApellidoPat%>. </b>
                    </div>
                </div>
                <!--end  Welcome -->
            </div>


            <div class="row">
                <!--quick info section -->
                <div class="col-lg-3">
                    <div class="alert alert-danger text-center">
                        <i class="fa fa-3x"><img src="assets/images/pataperro.png" width="50" height="40"></i>&nbsp;<b><%=cantidadDadosAdopcion%> </b>
                        <%
                        if (cantidadDadosAdopcion==1){
                            %>
                        perros dado en adopción.
                        <%
                        }else{
                            %>
                            perros dados en adopción.
                            <%
                        }
                        %>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="alert alert-success text-center">
                        <i class="fa fa-3x"><img src="assets/images/pataperro.png" width="50" height="40"></i>&nbsp;<b><%=cantidadAdoptados%> </b>
                        <%
                        if (cantidadAdoptados==1){
                            %>
                        perro adoptado.
                        <%
                        }else{
                            %>
                            perros adoptados.
                            <%
                        }
                        %>                        
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="alert alert-info text-center">
                        <i class="fa fa-3x"><img src="assets/images/casarefugio.png" width="50" height="40"></i>&nbsp;<b><%=cantidadCasas%> </b>
                        
                        <%
                        if (cantidadCasas==1){
                            %>
                        casa refugio registrada.
                        <%
                        }else{
                            %>
                            casas refugio registradas.
                            <%
                        }
                        %>

                    </div>
                </div>
                        
                <div class="col-lg-3">
                    <div class="alert alert-warning text-center">
                        <i class="fa fa-3x"><img src="assets/images/denuncia.png" width="50" height="40"></i>&nbsp;<b><%=cantidadDenuncias%> </b>
                        
                        <%
                        if (cantidadDenuncias==1){
                            %>
                        caso denunciado.
                        <%
                        }else{
                            %>
                            casos denunciados.
                            <%
                        }
                        %>
                    </div>
                </div>
                
            </div>
                    
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    DATOS PERSONALES
                                </div>
                                <div class="panel-body">
                                    <div class="col-lg-12">
                                    <div class="row">
                                        
                                        <div class="col-lg-12">
                                            <img src="assets/images/team/member-1.jpg" width="300" height="300">
                                            <br>
                                            <br>
                                        </div>
                                        <div class="col-lg-12">
                                                         <!-- PARA INPUT FILE -->             
                                            <input type="file" name="file-5[]" id="file-5" class="inputfile inputfile-4" data-multiple-caption="{count} files selected" multiple/>
                                            <label for="file-5"> <figure><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg></figure><span>Cambiar foto&hellip;</span></label>
                                        </div>
                                        
                                        <div class="col-lg-12">
                                        <b>Nombre Completo:  </b> 
                                        <input type="text" id="txtNombreCompleto" name="txtNombreCompleto" disabled value="<%=apellidoPat+" "+apellidoMat+", "+nombreUsuario%>">
                                        &nbsp;
                                        <a onclick="activar('txtNombreCompleto')" style="cursor: pointer"><small><i><u>Editar</u></i></small></a>
                                        <br>
                                        <br>
                                        </div>
                                        
                                        <div class="col-lg-12">
                                        <b>Fecha Nacimiento: </b>
                                        <input type="text" name="dateFechaNacimiento" id="dateFechaNacimiento" disabled value="<%=fechaNacimiento%>">
                                        &nbsp;&nbsp;
                                        <a onclick="activar('dateFechaNacimiento')" style="cursor: pointer"><small><i><u>Editar</u></i></small></a>
                                        <br>
                                        <br>
                                        </div>
                                        
                                        <div class="col-lg-12">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <b>Dirección:  </b>
                                            <input type="text" id="txtDireccion" name="txtDireccion" disabled value="<%=direccion%>">
                                            &nbsp;&nbsp;
                                        <a onclick="activar('txtDireccion')" style="cursor: pointer"><small><i><u>Editar</u></i></small></a>
                                        <br>
                                        <br>
                                        </div>
                                        
                                        <div class="col-lg-12">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <b>Teléfono:  </b>
                                        <input type="text" id="txtTelefono" name="txtTelefono" disabled value="<%=telefono%>">
                                        &nbsp;&nbsp;
                                        <a onclick="activar('txtTelefono')" style="cursor: pointer"><small><i><u>Editar</u></i></small></a>
                                        <br>
                                        <br>
                                        </div>
                                        <div class="col-lg-12">
                                            <button type="button" class="btn-primary" name="btnGuardarCambios" id="btnGuardarCambios" disabled title="No se han realizado cambios. BOTÓN DESACTIVADO." onclick="alerta('H')" style="cursor: text">GUARDAR CAMBIOS</button>
                                            &nbsp;
                                            <button type="button" class="btn-primary" name="btnCancelar" id="btnCancelar" disabled title="No se han realizado cambios. BOTÓN DESACTIVADO." onclick="alerta('H')" style="cursor: text">CANCELAR</button>                                            
                                        </div>
                                    </div>
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </div>
            </div>
        </div>
        <!-- end page-wrapper -->
    <!-- end wrapper -->

    <!-- Core Scripts - Include with every page -->
    <script src="assets/plugins/jquery-1.10.2.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="assets/plugins/pace/pace.js"></script>
    <script src="assets/scripts/siminta.js"></script>
    <!-- Page-Level Plugin Scripts-->
    <script src="assets/plugins/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/plugins/morris/morris.js"></script>
    <script src="assets/scripts/dashboard-demo.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
      <!-- PARA INPUT FILE -->
    <script src="assets/js/custom-file-input.js"></script>
    <!-- /PARA INPUT FILE -->
    
    <script type="text/javascript">
    
    function alerta(msje){
        swal(msje);
    }
    
    function activar(idelemento){
        txt = document.getElementById(idelemento);
        btnGuardar = document.getElementById("btnGuardarCambios");
        btnCancelar = document.getElementById("btnCancelar");
        if (txt.id==="dateFechaNacimiento"){
            txt.setAttribute("type","date");
            txt.setAttribute("min","1937-01-01");
            txt.setAttribute("max","2000-12-31");
        }
        txt.disabled=false;
        txt.focus();
        btnGuardar.disabled=false;
        btnCancelar.disabled = false;
        btnGuardar.setAttribute("style","cursor: pointer");
        btnCancelar.setAttribute("style","cursor: pointer");
        btnGuardar.setAttribute("title","");
        btnCancelar.setAttribute("title","");
    }
    
    function guardarCambios(){
        btn = document.getElementById("btnGuardarCambios");
        if(btn.disabled){
            alerta("NO SE HAN REALIZADO CAMBIOS...");
        }
    }
    
    function Cancelar(){
        
    }
    </script> 

</body>

</html>
