<%@page import="DTO.DTOADOPCION"%>
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
    <link href="assets/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet" />

        <script langiage="javascript" type="text/javascript">
            function CrearEnlace(url) {
            location.href=url;}
        </script>
</head>

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
                                <div>Jonny <strong>Deen</strong></div>
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
                        <a href="inicio.html"><i class="fa fa-dashboard fa-fw"></i>Dashboard</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Charts<span class="fa arrow"></span></a>
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
                    <li class="selected">
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
                     <li>
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
                            
                             <li>
                        <a href="#"><i class="fa fa-fw"></i>Casa Refugio<span class="fa arrow"></span></a> 
                        <ul class="nav nav-third-level">
                        <li>
                            <a href="RegistrarCasaRefugio.jsp">RegistrarCasaRefugio</a>
                            </li>
                            <li>
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
                            <li>
                                <a href="blank.html">Blank Page</a>
                            </li>
                            <li>
                                <a href="login.html">Login Page</a>
                            </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>
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
                    <h1 class="page-header">Lista de Adopción</h1>
                </div>
                 <!-- end  page header -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Lista de Perros en Adopción
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <form name="listaxUsuario" method="POST">
                                   
                                        <div class="form-group">
                                              <label>Buscar por :</label>      
                                        <select class="form-control" style="width:150px" name="cboTenencia" onchange= "valida()">
                                                <option value="#"  >:: Seleccionar ::</option>
                                                <option value="Ong">ONG</option>
                                                <option value="Usuario">Usuario</option>
                                                <option value="Ambos">Ambos</option>
                                        </select>
                                        </div> 
                                    
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                     <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Descripción</th>
                                        </tr>
                                     </thead>
                                     
                                     <tbody>
                                         <% String descrip_adop,tenencia;
                                            tenencia = request.getParameter("valor");
                                            DAO.DAOADOPCION  obj=new DAO.DAOADOPCION();
                                            for(DTO.DTOMASCOTA x:obj.buscar_x_ONG_User(tenencia)){
                                            for(DTO.DTODARADOPCION y:obj.readImgAll(x.getCod_mas())){
                                            if(x.getDescrip_mas().length() <= 147){ 
                                                descrip_adop = x.getDescrip_mas().substring(0,x.getDescrip_mas().length());}
                                            else{
                                                descrip_adop = x.getDescrip_mas().substring(0,x.getDescrip_mas().length()/2)+"...";}%>
                                       
                                          <tr class="odd gradeX" onClick="CrearEnlace('detalleAdopcion.jsp?cod_mas=<%=x.getCod_mas()%>')"> 
                                           
                                              <td><h3><%=x.getNom_mas()%></h3><center><img src="<%=y.getFoto()%>" width="180" height="154"></center></td>
                                
                                              <td width="500"><br><br><%=descrip_adop%></td>
                                              
                                          </tr><%}}%>  
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
        
            function valida(){ 
            valor=document.listaxUsuario.cboTenencia.value; 
            if(valor==='Ong'){
             location.href = 'listaxONG.jsp?valor=Ong';}
            if (valor ==='Usuario'){
             location.href = 'listaxUsuario.jsp?valor=Usuario';}
            if (valor ==='Ambos'){
            location.href  = 'listaAdopcion.jsp';}}
   </script>
</body>
</html>
