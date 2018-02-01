
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
    <style>.thumb {width: 380px; border: 1px solid #000;margin: 10px 5px 0 0;}
    .XD {width: 25%;height: 34px;padding: 6px 12px;font-size: 14px;line-height: 1.42857143;color: #555;background-color: #fff;background-image: none;border: 1px solid #ccc;-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;}.XD:focus {border-color: #66afe9;outline: 0;-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);}.XD::-moz-placeholder {color: #999;opacity: 1;}.XD:-ms-input-placeholder {color: #999;}.XD::-webkit-input-placeholder {color: #999;}    
    </style>
   </head>
   
   <%!
     String nombreUsuario="", primeraLetraApellidoPat="",usernameUsuario="",codigoUsuario="",apellidoPat="",apellidoMat="",fechaNacimiento="",direccion="",telefono="",pertenenciaUsuario="",fotoUsuario="";
     int cantidadDenuncias,cantidadCasas,cantidadAdoptados,cantidadDadosAdopcion,cantidadDenunciasTotal,cantidadCasasTotal,cantidadAdoptadosTotal,cantidadDadosAdopcionTotal;

   %>
    <%
     HttpSession ses = request.getSession();
     String msje="";
     //JOptionPane.showMessageDialog(null,ses.getAttribute("resultadoRegistro"));
     if (ses.getAttribute("resultadoLogin")!=null || ses.getAttribute("resultadoActualizacion")!=null ){
         if (ses.getAttribute("resultadoLogin")!=null){
             msje = ses.getAttribute("resultadoLogin").toString();
             %>
             <body onload="alerta('<%=msje%>')">
             <%
         }else if(ses.getAttribute("resultadoActualizacion")!=null){
             msje = ses.getAttribute("resultadoActualizacion").toString();
             if (msje.substring(0,1).equalsIgnoreCase("S")){
                 %>
                 <body onload="alertaok('<%=msje%>')">
                 <%
             }else{
                 %>
                 <body onload="alertanot('<%=msje%>')">
                 <%
             }
         }
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
         fotoUsuario=datosUsuario[10];
     }
     ses.setAttribute("resultadoLogin",null);
     ses.setAttribute("resultadoActualizacion",null);
     
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
     
     rs = DAOADOPCION.cantidadPerrosDadosenAdopcion();
     if(rs.next()){
         cantidadDadosAdopcionTotal=rs.getInt(1);
     }
     
     rs = DAOADOPCION.cantidadPerrosAdoptados();
     if(rs.next()){
         cantidadAdoptadosTotal=rs.getInt(1);
     }
     
     rs = DAOCASAREFUGIO.cantidadCasasRefugioRegistrada();
     if(rs.next()){
         cantidadCasasTotal=rs.getInt(1);
     }
     
     rs = DAODENUNCIA.cantidadDenunciasRegistrada();
     if(rs.next()){
         cantidadDenunciasTotal=rs.getInt(1);
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
                        <div><i class="fa fa-user fa-3x" ></i></div>
                    </a>
                    <!-- dropdown user-->
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="inicio.jsp"><i class="fa fa-user fa-fw"></i>User Profile</a>
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
                                    <span class="user-circle-online btn btn-success btn-circle "></span>&nbsp;En línea   
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
                <div class="col-lg-12">
                    <h3>RÉCORDS GENERALES</h3>
                </div>
                <div class="col-lg-3">
                    <div class="alert alert-danger text-center">
                        <i class="fa fa-3x"><img src="assets/images/pataperro.png" width="50" height="40"></i>&nbsp;<b><%=cantidadDadosAdopcionTotal%> </b>
                        <%
                        if (cantidadDadosAdopcionTotal==1){
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
                    <div class="alert alert-success text-center" style="height: 96px;">
                        <i class="fa fa-3x"><img src="assets/images/pataperro.png" width="50" height="40"></i>&nbsp;<b><%=cantidadAdoptadosTotal%> </b>
                        <%
                        if (cantidadAdoptadosTotal==1){
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
                        <i class="fa fa-3x"><img src="assets/images/casarefugio.png" width="50" height="40"></i>&nbsp;<b><%=cantidadCasasTotal%> </b>
                        
                        <%
                        if (cantidadCasasTotal==1){
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
                    <div class="alert alert-warning text-center" style="height: 96px;">
                        <i class="fa fa-3x"><img src="assets/images/denuncia.png" width="50" height="40"></i>&nbsp;<b><%=cantidadDenunciasTotal%> </b>
                        
                        <%
                        if (cantidadDenunciasTotal==1){
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
                <!--quick info section -->
                <div class="col-lg-12">
                    <h3>RÉCORDS PERSONALES</h3>
                </div>
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
                    <div class="alert alert-success text-center" style="height: 96px;">
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
                    <div class="alert alert-warning text-center" style="height: 96px;">
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
                            <form name="frmDatosUsuario" id="frmDatosUsuario" action="./SERACTUALIZADATOSUSUARIO" method="post" onload="alerta('HOLA')">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    DATOS PERSONALES
                                </div>
                                <div class="panel-body">
                                    <div class="col-lg-12">
                                    <div class="row">
                                        
                                        <div class="col-lg-12">
                                            <table>
                                                <tr><td><img src="<%=fotoUsuario%>" width="300" height="300">
                                                        <input type="hidden" value="<%=fotoUsuario%>" name="txtFotoUsuario" id="txtFotoUsuario">
                                                        <input type="hidden" value="<%=codigoUsuario%>" name="txtCodigo" id="txtCodigo">
                                                        <input type="hidden" value="<%=pertenenciaUsuario%>" name="txtPertenencia" id="txtPertenencia">
                                                        <input type="hidden" value="<%=usernameUsuario%>" name="txtUserName" id="txtUserName">
                                                    <td style="width: 187px">
                                                            <!-- PARA INPUT FILE -->
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <input type="file" name="files[]" id="files" class="inputfile inputfile-4" data-multiple-caption="{count} Fotos seleccionadas" multiple onclick="activar2();"/>
                                                            <label for="files"><figure><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg></figure><strong>Seleccionar imagen</strong><label>&hellip;</label>
                                                            <!-- PARA INPUT FILE -->
                                                    </td>
                                                    <td>
                                                        <output id="list"></output>
                                                    </td>
                                            </table>
                                        </div>
                                        
                                                    <div class="col-lg-12">
                                                        &nbsp;
                                                    </div>
                                                    
                                        <div class="col-lg-12">
                                        <div class="form-group">
                                        <label>Nombre(s) :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                                        <input type="text" class="XD" id="txtNombres" name="txtNombres" disabled value="<%=nombreUsuario%>">
                                        &nbsp;
                                        <a onclick="activar('txtNombres')" style="cursor: pointer"><small><i><u>Editar</u></i></small></a>
                                        </div>
                                        </div>
                                        
                                        <div class="col-lg-12">
                                        <div class="form-group">
                                        <label>Apellido Paterno :</label>&nbsp;&nbsp;
                                        <input type="text" class="XD" id="txtApellidoPat" name="txtApellidoPat" disabled value="<%=apellidoPat%>">
                                        &nbsp;
                                        <a onclick="activar('txtApellidoPat')" style="cursor: pointer"><small><i><u>Editar</u></i></small></a>
                                        </div>
                                        </div>
                                        
                                        <div class="col-lg-12">
                                        <div class="form-group">
                                        <label>Apellido Materno :</label>&nbsp; 
                                        <input type="text" class="XD" id="txtApellidoMat" name="txtApellidoMat" disabled value="<%=apellidoMat%>">
                                        &nbsp;
                                        <a onclick="activar('txtApellidoMat')" style="cursor: pointer"><small><i><u>Editar</u></i></small></a>
                                        </div>
                                        </div>
                                        
                                        <div class="col-lg-12">
                                        <div class="form-group">
                                        <label>Fecha Nacimiento :</label>
                                        <input type="text" class="XD" name="dateFechaNacimiento" id="dateFechaNacimiento" disabled value="<%=fechaNacimiento%>">
                                        &nbsp;&nbsp;
                                        <a onclick="activar('dateFechaNacimiento')" style="cursor: pointer"><small><i><u>Editar</u></i></small></a>
                                        </div>
                                        </div>
                                        
                                        <div class="col-lg-12">
                                        <div class="form-group">
                                            <label>Dirección :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="text" class="XD" id="txtDireccion" name="txtDireccion" disabled value="<%=direccion%>">
                                            &nbsp;&nbsp;
                                        <a onclick="activar('txtDireccion')" style="cursor: pointer"><small><i><u>Editar</u></i></small></a>
                                        </div>
                                        </div>
                                        
                                        <div class="col-lg-12">
                                        <div class="form-group">
                                        <label>Teléfono :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="text" class="XD" id="txtTelefono" name="txtTelefono" disabled value="<%=telefono%>">
                                        &nbsp;&nbsp;
                                        <a onclick="activar('txtTelefono')" style="cursor: pointer"><small><i><u>Editar</u></i></small></a>
                                        </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <input type="button" class="btn btn-primary" name="btnGuardarCambios" value="Guardar cambios" id="btnGuardarCambios" disabled title="No se han realizado cambios. BOTÓN DESACTIVADO." style="cursor: text" onclick="guardarCambios()">
                                            &nbsp;
                                            <button type="button" class="btn btn-primary" name="btnCancelar" id="btnCancelar" disabled title="No se han realizado cambios. BOTÓN DESACTIVADO." style="cursor: text">Cancelar</button>                                            
                                        </div>
                                        
                                         <div class="col-lg-12">      
                                            <input type="hidden" id="URL_1" name="URL_1" size="100"  value ="">
                                            <input type="hidden" id="URL_2" name="URL_2" size="100"  value ="">
                                            <input type="hidden" id="URL_3" name="URL_3" size="100"  value ="">
                                        </div>    
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        </div>
                    </div>
            </div>
        </div>
        <!-- end page-wrapper -->
    <!-- end wrapper -->

    <!-- Core Scripts - Include with every page -->
    
</body>
    
<style>
  .thumb {
    height: 75px;
    border: 1px solid #000;
    margin: 10px 5px 0 0;
  }
</style>

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
    
    function activar2(){
        btnGuardar = document.getElementById("btnGuardarCambios");
        btnCancelar = document.getElementById("btnCancelar");
        btnGuardar.disabled=false;
        btnCancelar.disabled = false;
        btnGuardar.setAttribute("style","cursor: pointer");
        btnCancelar.setAttribute("style","cursor: pointer");
        btnGuardar.setAttribute("title","");
        btnCancelar.setAttribute("title","");
    }
    
  function handleFileSelect(evt) {
    var files = evt.target.files; // FileList object
     var resultado = [];
    // Loop through the FileList and render image files as thumbnails.
 
    for (var i = 0, f; f = files[i]; i++) {
        
        if (files.length > 3) {
            swal("Como máximo 3 fotos","", "error");
            limpiar();
            return;
            }

      if (!window.FileReader) {
         swal("La página no soporta la lectura de archivos","", "error");
         limpiar();
         return;
        }
      // Only process image files.
      if (!f.type.match('image.*')) {
          swal("El archivo a adjuntar no es una imagen","","error");
          limpiar();
        continue;
      }

      var reader = new FileReader();

      // Closure to capture the file information.
      reader.onload = (function(theFile) {
        return function(e) {
          // Render thumbnail.
          var span = document.createElement('span');
          
          resultado.push(e.target.result);
          for(var y = 0 ; y < resultado.length; y++){
          
          span.innerHTML = ['<img class="thumb" style="height: 250px" src="', resultado[y],'" title="', escape(theFile.name), '"/>'].join('');
          document.getElementById('list').insertBefore(span, null);
       
         }
                     if(resultado[0] != null){
                         
                         if(document.getElementById('URL_1').value.length == 0){
                             //alert('URL1 campo vacio');
                             document.frmDatosUsuario.URL_1.value = resultado[0];
                             
                         }else{
                             //alert('URL1 campo lleno');
                          
                            if(document.getElementById('URL_2').value.length == 0){
                             //alert('URL2 campo vacio');
                             document.frmDatosUsuario.URL_2.value = resultado[1];
                          
                         }else{
                             //alert('URL2 campo lleno');
                             
                             if(document.getElementById('URL_3').value.length == 0){
                             //alert('URL3 campo vacio');
                             document.frmDatosUsuario.URL_3.value = resultado[2];
                             
                          }else{
                             //alert('URL3 campo lleno');
                             document.frmDatosUsuario.URL_4.value = resultado[3];
                            } 
                           }
                         }  
                      }    
              /*  alert(resultado[0]);
                  alert(resultado[1]);
                  alert(resultado[2]);
                  alert(resultado[3]);
              */               
        };
      })(f);
      // Read in the image file as a data URL.
      reader.readAsDataURL(f);    
    }
  }
  document.getElementById('files').addEventListener('change', handleFileSelect, false);

 function guardarCambios(){
    activar('txtNombres');
    activar('txtApellidoPat');
    activar('txtApellidoMat');
    activar('dateFechaNacimiento');
    activar('txtDireccion');
    activar('txtTelefono');
    document.frmDatosUsuario.submit();
 }
    </script> 
</html>
