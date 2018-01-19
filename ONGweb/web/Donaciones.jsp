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
     String codigoUsuario="",nombreUsuario="", primeraLetraApellidoPat="",usernameUsuario="",nombreCasa="",pertenenciaUsuario="";
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
         pertenenciaUsuario=datosUsuario[9];
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
                                        
                                            <div class="col-lg-12 text-center">
                                                <h3><i>- 5 ÚLTIMAS DONACIONES REALIZADAS -</i></h3>
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
                                                    <tr><td colspan="6"><h3><%=rsDonaciones.getString(3)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
                                                    <%
                                                    ResultSet rsDetalleDonacion = DAOCASAREFUGIO.detalleDonacion(rsDonaciones.getInt(1));
                                                    while(rsDetalleDonacion.next()){
                                                    %>
                                                    <tr><td><%=rsDetalleDonacion.getString(2)%><td><td><td><td><td><%=rsDetalleDonacion.getString(3)%>
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
