<%@page import="DAO.DAOCASAREFUGIO"%>
<%@page import="java.sql.ResultSet"%>
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
</head>

<%!
     String codigoUsuario="",nombreUsuario="", primeraLetraApellidoPat="",usernameUsuario="",nombreCasa="";
     int codigoCRseleccionada,codigoCasa;
%>

<%
    HttpSession ses = request.getSession();
    if (ses.getAttribute("datosUsuario")!=null){
         String[] datosUsuario = (String[])ses.getAttribute("datosUsuario");
         nombreUsuario = datosUsuario[0];
         primeraLetraApellidoPat = datosUsuario[1];
         usernameUsuario = datosUsuario[2];
         codigoUsuario= datosUsuario[3];
     }

    codigoCRseleccionada = Integer.parseInt(request.getParameter("codigoCR"));
    ResultSet rsDatosCasa = DAOCASAREFUGIO.casaRefugioPorCodigo(codigoCRseleccionada);
    
    if(rsDatosCasa.next()){
        codigoCasa=rsDatosCasa.getInt(1);
        nombreCasa=rsDatosCasa.getString(2);
    }

    if (ses.getAttribute("resultadoDonacion")!=null){
        String msje = ses.getAttribute("resultadoDonacion").toString();
        if (msje.substring(0,1).equalsIgnoreCase("M")){
            %>
            <body onload="alertaok('<%=msje%>')">
            <%
        }else{
            %>
            <body onload="alertanot('<%=msje%>')">
            <%
        }
    }else{
        %>
        <body>
        <%
    }
        ses.setAttribute("resultadoDonacion",null);
%>
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
                <a class="navbar-brand" href="inicio.jsp">
                    <img src="assets/img/logo.png" alt="" />
                </a>
            </div>
            <!-- end navbar-header -->
            <!-- navbar-top-links -->
            <ul class="nav navbar-top-links navbar-right">
                <!-- main dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="top-label label label-danger">3</span><i class="fa fa-envelope fa-3x"></i>
                    </a>
                    <!-- dropdown-messages -->
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong><span class=" label label-danger">Andrew Smith</span></strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong><span class=" label label-info">Jonney Depp</span></strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong><span class=" label label-success">Jonney Depp</span></strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- end dropdown-messages -->
                </li>

                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="top-label label label-success">4</span>  <i class="fa fa-tasks fa-3x"></i>
                    </a>
                    <!-- dropdown tasks -->
                    <ul class="dropdown-menu dropdown-tasks">
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 1</strong>
                                        <span class="pull-right text-muted">40% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 2</strong>
                                        <span class="pull-right text-muted">20% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                            <span class="sr-only">20% Complete</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 3</strong>
                                        <span class="pull-right text-muted">60% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 4</strong>
                                        <span class="pull-right text-muted">80% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% Complete (danger)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Tasks</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- end dropdown-tasks -->
                </li>

                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="top-label label label-warning">5</span>  <i class="fa fa-bell fa-3x"></i>
                    </a>
                    <!-- dropdown alerts-->
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i>New Comment
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i>3 New Followers
                                    <span class="pull-right text-muted small">12 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i>Message Sent
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i>New Task
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i>Server Rebooted
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- end dropdown-alerts -->
                </li>

                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-3x"></i>
                    </a>
                    <!-- dropdown user-->
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i>User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i>Settings</a>
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
                    <li class="active">
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
                <!-- Page Header -->
                <div class="col-lg-12">
                    <h2 class="page-header">Listado de Donaciones</h2>
                </div>
                <!--End Page Header -->
            </div>

              <div class="row">
                <div class="col-lg-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a href="DetalleCasaRefugio.jsp?codigoCR=<%=codigoCRseleccionada%>"><img src="assets/images/retornar.png" width="30" height="30"></a>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form method="post" action="SERDONACION" name="formDonacion" id="formDonacion">
                                        <input name="txtcantfilas" id="txtcantfilas" type="hidden">
                                        <input name="txtcodusuario" id="txtcodusuario" type="hidden" value="<%=codigoUsuario%>">
                                        <input name="txtcodcasa" id="txtcodusuario" type="hidden" value="<%=codigoCasa%>">
                                        <div class="form-group col-lg-12 text-center">
                                            <h2><%=nombreCasa%></h2>    
                                        </div>
                                        <div class="form-group col-lg-12 text-center">
                                            PRODUCTO A DONAR: 
                                            <select name="cbproductos" id="cbproductos">
                                                <%
                                                ResultSet rsProductos = DAOCASAREFUGIO.listarProductos();
                                                while (rsProductos.next()){
                                                    %>
                                                    <option value="<%=rsProductos.getString(1)%>"><%=rsProductos.getString(2)%></option>        
                                                    <%
                                                }
                                                %>
                                            </select>
                                            &nbsp;&nbsp;
                                            CANTIDAD: <input type="number" min="1" name="txtcantidad" id="txtcantidad" value="1">
                                            &nbsp;&nbsp;
                                            <a><img src="assets/images/botonAgregar.png" height="40" width="50" onclick="agregarFilaTablaTemporal();"></a>
                                        </div>
                                            <div class="col-lg-3">
                                                
                                            </div>
                                         <div class="col-lg-6">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table" id="tablaTemporal">
                                    <tr class="danger"><th>PRODUCTO<th>CANTIDAD<th></th>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--  end  Context Classes  -->
                
                                        <div class="form-group col-lg-12 text-center">
                                            <button type="button" class="btn btn-primary" onclick="contarFilasTablaProductos(); alerta('¿REGISTRAR DONACIÓN?','Por favor, evita registrar donaciones que no serán realizadas, para así poder atender, sin retrasos, las que sí lo son. ¡MUCHAS GRACIAS!','info','¡MUCHAS GRACIAS POR TU AYUDA!','Granito a granito cambiaremos vidas. Nos estaremos comunicando contigo...')">REGISTRAR DONACIÓN</button>
                                        </div>
                                                    </form>
                    </div>                        
                                        <div class="col-lg-3">
                                                
                                        </div>
                                        <div class="col-lg-6">   
                                        <div class="panel panel-default" style="background: url(assets/images/donaciones1.png) center;">
                                        <div class="panel-body">    
                                        
                                            <center>
                                            <table>                                                
                                                <%
                                                ResultSet rsDonaciones = DAOCASAREFUGIO.listarDonaciones(codigoCRseleccionada);
                                                while (rsDonaciones.next()){
                                                    %>
                                                    <tr><td colspan="2"><h3><%=rsDonaciones.getString(3)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
                                                    <%
                                                    ResultSet rsDetalleDonacion = DAOCASAREFUGIO.detalleDonacion(rsDonaciones.getInt(1));
                                                    while(rsDetalleDonacion.next()){
                                                    %>
                                                    <tr><td><%=rsDetalleDonacion.getString(2)%><td><%=rsDetalleDonacion.getString(3)%>
                                                    <%
                                                    }
                                                }
                                                %>
                                            </table>
                                            </center>
                                        </div>
                                            </div>
                                            </div>
                                       </div>
                            </div>
                        </div>
                        </div>
                        
                    </div>
                     <!-- End Form Elements -->
                </div>
                    <!-- end page-wrapper -->
            </div>
    <!-- end wrapper -->

    <!-- Core Scripts - Include with every page -->
    <script src="assets/plugins/jquery-1.10.2.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="assets/plugins/pace/pace.js"></script>
    <script src="assets/scripts/siminta.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <script type="text/javascript">
        function agregarFilaTablaTemporal() {
              var tabla = document.getElementById("tablaTemporal");
              var aux = tabla.rows.length;
              var formDonaciones = document.getElementById("formDonacion");
              var fila = tabla.insertRow(aux);
              var columna1 = fila.insertCell(0);
              var columna2 = fila.insertCell(1);
              var columna3 = fila.insertCell(2);
              //var columna4 = fila.insertCell(3);
              
              var cbproductos = document.getElementById("cbproductos"); 
              var productoselect = cbproductos.options[cbproductos.selectedIndex].text;
              var codigoproductoselect = cbproductos.options[cbproductos.selectedIndex].value;
              
              var cantidadprod = document.getElementById("txtcantidad").value.toString();
              
              var txtcodigoproducto = document.createElement("INPUT");
              txtcodigoproducto.setAttribute("name","txtcodigoproducto"+aux.toString());
              txtcodigoproducto.setAttribute("id","txtcodigoproducto"+aux.toString());
              txtcodigoproducto.setAttribute("type","hidden");
              txtcodigoproducto.setAttribute("value",codigoproductoselect.toString());
              
              var txtcantidad = document.createElement("INPUT");
              txtcantidad.setAttribute("type","hidden");
              txtcantidad.setAttribute("name","txtcantidad"+aux.toString());
              txtcantidad.setAttribute("id","txtcantidad"+aux.toString());
              txtcantidad.setAttribute("value",cantidadprod);
              
              
              var btneliminar = document.createElement("INPUT");
              btneliminar.setAttribute("type","button");
              btneliminar.setAttribute("value","ELIMINAR"); 
              btneliminar.setAttribute("name","btneliminar"+aux.toString());
              btneliminar.setAttribute("id","btneliminar"+aux.toString());
              btneliminar.setAttribute("onclick","eliminarFilaTablaProductos(" + aux.toString() + ")");
             
              columna1.innerHTML=productoselect;
              columna2.innerHTML=cantidadprod;
              columna3.appendChild(btneliminar);
              //columna4.appendChild(txtdescripcion);
              formDonaciones.appendChild(txtcodigoproducto);
              formDonaciones.appendChild(txtcantidad);
              }
                 
              function eliminarFilaTablaProductos(indice){
                  var tabla = document.getElementById("tablaTemporal");
                  var inputprod = document.getElementById("txtcodigoproducto"+indice.toString());
                  var inputcant = document.getElementById("txtcantidad"+indice.toString());
                  
                  if (tabla.rows.length>1){
                  tabla.deleteRow(indice);
                  
                  Nodeinputprod = inputprod.parentNode;
                  Nodeinputcant = inputcant.parentNode;
                  
                  Nodeinputprod.removeChild(inputprod);
                  Nodeinputcant.removeChild(inputcant);
                  
                  var i;
                  for (i=1;i<=tabla.rows.length-indice;i++){
                      var btnaux = document.getElementById("btneliminar"+(indice+i).toString());
                      var txtcodigoproducto = document.getElementById("txtcodigoproducto"+(indice+i).toString());
                      var txtcantidad = document.getElementById("txtcantidad"+(indice+i).toString());
                      
                      txtcodigoproducto.setAttribute("name","txtcodigoproducto"+(indice+i-1).toString());
                      txtcodigoproducto.setAttribute("id","txtcodigoproducto"+(indice+i-1).toString());
                      
                      txtcantidad.setAttribute("name","txtcantidad"+(indice+i-1).toString());
                      txtcantidad.setAttribute("id","txtcantidad"+(indice+i-1).toString());
                      
                      btnaux.setAttribute("name","btneliminar"+(indice+i-1).toString());
                      btnaux.setAttribute("id","btneliminar"+(indice+i-1).toString());
                      btnaux.setAttribute("onclick","eliminarFilaTablaProductos(" + (indice+i-1).toString() + ")");
                  }
                  }else{
                      tabla.deleteRow(indice);
                  }
              }
              
              function alerta(titulo,texto,icono,tituloSI,msjcasoSI,msjecasoNO){
                  formDonacion = document.getElementById("formDonacion");
                  swal({
                      title: titulo,
                      text: texto,
                      icon: icono,
                      buttons: true,
                      dangerMode: false,
                  })
                          .then((willDelete) => {
                              if (willDelete) {
                            formDonacion.submit();
                      } else {
                          
                      }
                  });
              }
              
              function contarFilasTablaProductos(){
                  var tabla = document.getElementById("tablaTemporal");
                  var txtnumregistros = document.getElementById("txtcantfilas");
                  txtcantfilas.value = tabla.rows.length-1;
              }
              /*
              function alerta(msje){
        swal(msje);
    }
    */
    function alertaok(msje){
        swal("¡BIEN HECHO!",msje,"success");
    }
    
    function alertanot(msje){
        swal("¡ERROR!",msje,"error");
    }
    </script>

</body>

</html>
