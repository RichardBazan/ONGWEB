<!DOCTYPE html>
<html>

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

    <!-- Page-Level CSS -->
    <link href="assets/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet" />

     <script langiage="javascript" type="text/javascript">
            function CrearEnlace(url) {
            location.href=url;}
     </script>
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
                    <li>
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
                    
                    <li class="active">
                        <a href="#"><i class="fa fa-edit fa-fw"></i>CASOS DE MALTRATO<span class="fa arrow"></span></a> 
                        <ul class="nav nav-third-level">
                         <li>
                                <a href="registrarMaltrato.jsp">Denunciar caso nuevo</a>
                            </li>
                            <li class="selected">
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
                 <!--  page header -->
                <div class="col-lg-12">
                    <h1 class="page-header">Lista de Denuncias</h1>
                </div>
                 <!-- end  page header -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Registros de Denuncias
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                               <form name="frmlistaDenuncia" method="POST">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                     <thead>
                                         <tr class="odd gradeX">
                                            <th>Nombre</th>
                                            <th>Descripci�n</th>
                                            <th>Acci�n</th>
                                        </tr>
                                     </thead>
                                     
                                     <tbody>
                                         <% String descrip_den;
                                            DAO.DAODENUNCIA  obj=new DAO.DAODENUNCIA(); DAO.DAOCOMENTARIO obj2=new DAO.DAOCOMENTARIO();
                                            for(DTO.DTODENUNCIA x:obj.readAll()){
                                            for(DTO.DTODENUNCIA y:obj.readImgAll(x.getCod_den())){
                                            if(x.getDescrip_den().length() <= 147){ 
                                                descrip_den = x.getDescrip_den();}
                                            else{
                                                descrip_den = x.getDescrip_den().substring(0,150)+"...";}
                                            for(DTO.DTODETALLECOMENTARIO j:obj2.contarComentario(x.getCod_den())){%>     
                                                
                                        <tr class="odd gradeX">
                                            
                                            <td><h4><b><center><%=x.getTitulo_den()%></center></b></h4><center><img src="<%=y.getFoto_den()%>" width="180" height="154"></center></td>
                               
                                             <td width="500" onClick="CrearEnlace('detalleMaltrato.jsp?cod_den=<%=x.getCod_den()%>')" title="Ver m�s&hellip;"><br><br><br><%=descrip_den%></td>
                                            
                                             <td title="Ver comentarios&hellip;" onClick="CrearEnlace('comentariosDenuncia.jsp?cod_den=<%=x.getCod_den()%>')"><center><br><br><a href="#">
                                              <img src="assets/images/commenting_icon-icons.com_70233.png" width="150" alt=""/></a></center>
                                            <%String msj;
                                                if(j.getCant_coment() == 1){
                                                        msj=" comentario";
                                                }else{
                                                        msj=" comentarios";
                                                }
                                            %>
                                    <label><%=j.getCant_coment()+msj%></label>
                                                </td>
                                        </tr><%}}}%> 
                                     </tbody>
                                </table>
                             </form>
                            </div> 
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
        </div>
    </div>
    <!-- Core Scripts - Include with every page -->
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

</body>
</html>
