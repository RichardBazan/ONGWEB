<!DOCTYPE html>
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
                  <style>.thumb {width: 450px; border: 1px solid #000;margin: 10px 5px 0 0;}</style>  
</head>

<%!
     String nombreUsuario="", primeraLetraApellidoPat="",usernameUsuario="",codigoUsuario="";
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

        if(ses.getAttribute("mensaje")!=null){
          String msje = ses.getAttribute("mensaje").toString();
          
          if (msje.substring(0,1).equalsIgnoreCase("A")){
          %>
          <body onload="alertanot('<%=msje%>')">
                <%
        }else{
            %>
          <body onload="alertaok('<%=msje%>')">
                <%
        }
    }else{
        %>
        <body>
            <%
      }
            ses.setAttribute("mensaje",null);
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
                                        <li class="selected">
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
                    <h1 class="page-header">Registro de Colaboradores</h1>
                </div>
                <!--End Page Header -->
            </div>

              <div class="row">
                <div class="col-lg-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Datos de Colaborador 
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                   <form name="formRegistrarseUsu"  id="formRegistrarseUsu"  method="post" action="Admin_registrar_Usuario">
                                        
                                              <div class="form-group">
                                                    <label>Nombre</label>
                                                            <input type="text" name="txtnombres_usu" class="form-control" id="txtnombres_usu" placeholder="Ingrese nombre usuario" onkeypress="return soloLetras(event)" onblur="limpia()" required>
							     </div>
                                            
                                        <div class="form-group">
                                            <label>Apellido Paterno</label>
                                                        <input type="text" name="txtapellidopat_usu" id="txtapellidopat_usu" class="form-control" placeholder="Ingrese apellido paterno " onkeypress="return soloLetras(event)" onblur="limpia2()" required>
	                        </div>
							     
                                        <div class="form-group">
                                                <label>Apellido Materno</label>
                                                        <input type="text" name="txtapellidomat_usu" id="txtapellidomat_usu" class="form-control" placeholder="Ingrese apellido materno" onkeypress="return soloLetras(event)"  onblur="limpia3()" required>
	                        </div>
							         
                                            <div class="form-group">

                                                            <i class="fa fa-calendar"></i>&nbsp;<label>Fecha de nacimiento</label>
                                                            <input type="date" name="datefechanacimiento_usu" id="datefechanacimiento_usu" class="form-control" min="1937-01-01" max="2000-12-31" value="2000-01-01" required>
							     </div>
                                            
                                            <div class="form-group">
                                                            <label>Dirección</label>
                                                            <input type="text" name="txtdireccion_usu" id="txtdireccion_usu" class="form-control" placeholder="Ejm: Av. Sucre 525 Int. 204" required>
	                        </div>
							     
                                            <div class="form-group">
                                                            <label>Teléfono</label>
                                                            <input type="tel" name="teltelefono_usu" id="teltelefono_usu" class="form-control" placeholder="Ejm: 012461254 / 945929934" title="El número debe tener 9 dígitos (a los números telefónicos antecederle '01' como en el ejemplo)." maxlength="9" onkeypress="return valida(event)">
	                        </div>      
                                            
                                            <div class="form-group">
                                                <i class="fa fa-user"></i>&nbsp;<label>Usuario</label>
                                                            <input type="text" name="txtusuario_usu" id="txtusuario_usu" class="form-control" placeholder="Ingrese usuario" onblur="limpia4()" required>
                                            </div>
                            
                                            <div class="form-group">
                                                     <i class="fa fa-key"></i>&nbsp;<label>Contraseña</label>
                                                     <input type="password" name="passwordcontraseña1_usu" id="passwordcontraseña1_usu" class="form-control" placeholder="Ingrese contraseña" required>
	                                     </div>
                        
                        
                                            <div class="form-group">
                                            <i class="fa fa-key"></i>&nbsp;<label>Confirmar contraseña</label>
                                            <input type="password" name="passwordcontraseña2_usu" id="passwordcontraseña2_usu" class="form-control" placeholder="Confirmar contraseña" required>
                                            </div>
                                            
                                            <div class="form-group">
                                                         <!-- PARA INPUT FILE -->             
                                            <input type="file" name="files[]" id="files" class="inputfile inputfile-4" data-multiple-caption="{count} files selected"/>
                                            <label for="files"> <figure><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg></figure><span>Escoge una foto&hellip;</span></label>
                                            <!-- PARA INPUT FILE -->
                            </div>   
                                           
                                            
                  <!--                                            
                        <div class="form-group alerts">
                        
                        	<div class="alert alert-success" role="alert">
							  
							</div>

							<div class="alert alert-danger" role="alert">
							  
							</div>
							
                        </div>	
-->
                         <div class="row">
                             <div class="form-group col-md-6">
                                 <input class="btn btn-primary" onclick="comprobarCampos()" type="button" id="btnRegistrar" name="btnRegistrar" value="Registrarse"/>
                            </div>
                        </div>
                        <input type="hidden" name="URL_1" id="URL_1" size="100" value="">
                        <div class="clearfix"></div>

					</form>
                                    
                                    <form name="frmAdminListUsuario" method="post">
                                        
                                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                         <tr class="odd gradeX">
                                            <th>Nombres</th>
                                            <th>Apellidos</th>
                                            <th>Fecha&nbsp;Nacimiento</th>
                                            <th>Dirección</th>
                                            <th>Teléfono</th>
                                            <th>Usuario</th>
                                            <th>Pertenencia</th>
                                            <th>Foto</th>
                                        </tr>
                                     </thead>
                                     
                                     <tbody>
                                          <% DAO.DAOUSUARIO obj=new DAO.DAOUSUARIO();DAO.DAOVALIDA v=new DAO.DAOVALIDA();
                                            for(DTO.DTOUSUARIO x:obj.readAll()){%>   
                                            <tr class="odd gradeX">
                                             <td><%=v.primeraLetraMayuscula(x.getNombre())%></td>
                                             <td><%=v.primeraLetraMayuscula(x.getApellidos())%></td>
                                             <td><%=x.getFechaNacimiento()%></td>
                                             <td><%=v.primeraLetraMayuscula(x.getDireccion())%></td>
                                             <td><%=x.getTelefono()%></td>
                                             <td><%=x.getUsuario()%></td>
                                             <td><%=x.getPertenencia()%></td>
                                             <td><img src="<%=x.getFoto()%>" height="70"></a></td>
                                         </tr>
                                         <%}%> 
                                     </tbody>
                                        </table>
                                    </form>
                                    
                                </div>
                                <div class="row text-center">
                                    <br><br>
                                    <img  src="assets/img/user-1633249_960_720.png" alt="" width="350">
                                        </div>
                            </div>
                              <output id="list"></output> 
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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</body>

<style>
  .thumb {
    height: 75px;
    border: 1px solid #000;
    margin: 10px 5px 0 0;
  }
</style>
<script>
  
  function alerta(msje){
        swal(msje);
    }
    
    function alertaok(msje){
        swal("¡BIEN HECHO!",msje,"success");
    }
    
    function alertanot(msje){
        swal("¡ERROR!",msje,"error");
    }
    
    function handleFileSelect(evt) {
    var files = evt.target.files; // FileList object
     var resultado = [];
    // Loop through the FileList and render image files as thumbnails.
 
    for (var i = 0, f; f = files[i]; i++) {
        
        if (files.length > 3) {
            swal("Como máximo 1 foto","", "error");
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
                             document.formRegistrarseUsu.URL_1.value = resultado[0];  
                         } 
                      }                 
        };
      })(f);
      // Read in the image file as a data URL.
      reader.readAsDataURL(f);    
    }
  }
  document.getElementById('files').addEventListener('change', handleFileSelect, false);
  
    

  
   function soloLetras(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = 'áéíóúabcdefghijklmnñopqrstuvwxyz. ';
       especiales = "8-37-39-46";

       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
    }
    
    function limpia(){
        var val = document.getElementById('txtnombres_usu').value;
        var tam = val.length;
        for(i = 0; i < tam; i++) {
                if(!isNaN(val[i]))
                document.getElementById('txtnombres_usu').value = '';
            }
        }
        
    function limpia2(){
        var val = document.getElementById('txtapellidopat_usu').value;
        var tam = val.length;
        for(i = 0; i < tam; i++) {
                if(!isNaN(val[i]))
                document.getElementById('txtapellidopat_usu').value = '';
            }
        }
        
      function limpia3(){
        var val = document.getElementById('txtapellidomat_usu').value;
        var tam = val.length;
        for(i = 0; i < tam; i++) {
                if(!isNaN(val[i]))
                document.getElementById('txtapellidomat_usu').value = '';
            }
        }
        
        function limpia4(){
        var val = document.getElementById('txtusuario_usu').value;
        var tam = val.length;
        for(i = 0; i < tam; i++) {
                if(!isNaN(val[i]))
                document.getElementById('txtusuario_usu').value = '';
            }
        }
    
      function limpiar(){
        input=document.getElementById("files");
        input.value = ''}
    
     function comprobarCampos(){
        nombre = document.getElementById("txtnombres_usu");
        apellidopat=document.getElementById("txtapellidopat_usu");
        apellidomat=document.getElementById("txtapellidomat_usu");
        fechanac=document.getElementById("datefechanacimiento_usu");
        direccion=document.getElementById("txtdireccion_usu");
        telefono=document.getElementById("teltelefono_usu");
        usuario=document.getElementById("txtusuario_usu");
        foto = document.getElementById("files");
        
        if(apellidopat.value.length===0 || apellidomat.value.length===0 || fechanac.value.length===0 || direccion.value.length===0 || telefono.value.length===0 || usuario.value.length===0 || foto.value.length===0){
           alertanot("COMPLETE TODOS LOS CAMPOS. TODOS SON NECESARIOS.");
           nombre.focus();
           return (false);
        }
        if(telefono.value.length<9 || telefono.value.length>9){
           alertanot("EL NÚMERO DE CONTACTO DEBE TENER 9 DIGITOS COMO EN EL EJM.");
           telefono.focus();
           return (false);
        }
        comprobarClave();
    }
     
    function comprobarClave(){ 
   	clave1 = document.getElementById("passwordcontraseña1_usu");
   	clave2 = document.getElementById("passwordcontraseña2_usu");
        botonregistrar = document.getElementById("btnRegistrar");
        formularioregistrarse = document.getElementById("formRegistrarseUsu");
        if (clave1.value.length<6){
        alertanot("LA CONTRASEÑA DEBE CONTENER AL MENOS 6 DÍGITOS.");
        return (false);
        }
   	if (clave1.value !== clave2.value){ 
      	alertanot("LAS CONTRASEÑAS NO COINCIDEN.");
        clave1.focus();
        return (false);
        }
        if (clave1.value === clave2.value){
            formularioregistrarse.submit();
        }
    }
    
</script>
</html>




