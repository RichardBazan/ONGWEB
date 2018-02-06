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
    <!-- PARA INPUT FILE -->
    <link rel="stylesheet" type="text/css" href="assets/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/component.css" />
		<!-- remove this if you use Modernizr -->
		<script>(function(e,t,n){var r=e.querySelectorAll("html")[0];r.className=r.className.replace(/(^|\s)no-js(\s|$)/,"$1js$2")})(document,window,0);</script> 
    <!-- /PARA INPUT FILE -->     
                   <style>.contenedor {position: relative;height: 125px;width: 220px;margin: 50px 20px;float: left;margin: 10px 5px 0 0;}
                       .contenedor img {position: absolute;left: 0;transition: opacity 0.5s ease-in-out;}
                       .contenedor img.top:hover {opacity: 0.50;}</style>     
</head>

<%!
     String nombreUsuario="", primeraLetraApellidoPat="",usernameUsuario="",codigoUsuario="",fotoUsuario="";
%>

<%
HttpSession ses = request.getSession();
if (ses.getAttribute("datosUsuario")!=null){
         String[] datosUsuario = (String[])ses.getAttribute("datosUsuario");
         nombreUsuario = datosUsuario[0];
         primeraLetraApellidoPat = datosUsuario[1];
         usernameUsuario = datosUsuario[2];
         codigoUsuario = datosUsuario[3];
         fotoUsuario=datosUsuario[10];
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
                        <li><a href="SERLOGOUT"><i class="fa fa-sign-out fa-fw"></i>Cerrar Sesión</a>
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
                                            <input type="file" name="files[]" id="files" class="inputfile inputfile-4"/>
                                            <label for="files"> <figure><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg></figure><span>Seleccionar imagen&hellip;</span></label>
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
                        <input type= "hidden" id="delete" name="delete" size="100"  value ="imgdelete">          
                        <output id="list"></output>
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
                                             <td><%=v.primeraLetraMayuscula(x.getApellido_pat())%>&nbsp;<%=v.primeraLetraMayuscula(x.getApellido_mat())%></td>
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
     function handleFileSelect(evt) { 
    var files = evt.target.files; // FileList object
    
    // Loop through the FileList and render image files as thumbnails.
    for (var i = 0, f; f = files[i]; i++) {        
         //document.getElementById("contador").value = files.length;
        
        if(files.length == 0){
            swal("Por lo menos debe haber 1 foto","", "warning");
            limpiar();
            return;
        }
        if(files.length > 1){
            swal("Como máximo 1 fotos","", "error");
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
          span.innerHTML = ['<div class="contenedor"><img src="assets/img/delete.png" title = "Eliminar" height= "125" width="220" id="imgdelete"/>\n\
                            <a><img class="top" src="', e.target.result,'" id="', e.target.result, '" title="', escape(theFile.name), '" height= "125" width="220" name="imagen" /></a></div><br><br><br><br><br><br><br><br>'].join('');
          document.getElementById('list').insertBefore(span, null);      
         
                    if(!f){
                                                  
                         if(document.getElementById('URL_1').value.length === 0){
                                 document.formRegistrarseUsu.URL_1.value = e.target.result;
                                 document.getElementById("files").disabled = true;
                                 
                                 }
                             }    
                  
        $(document).ready(function(){
	$("img[name=imagen]").click(function () {
	//alert("has hecho click en la imagen");       
        var img1 = document.formRegistrarseUsu.URL_1.value;
        
                  if(!f){
                         //Eliminando value de los input text
                            if(img1[0].length > 0){
                                document.getElementById("files").disabled = false;
                                eliminaFotos(img1);
                                document.formRegistrarseUsu.URL_1.value = "";
                                eliminaFotoDelete()[0];                                	
                                limpia();
                               } 
                        } 
	});
        });
        
        
        };
      })(f);
      // Read in the image file as a data URL.
      reader.readAsDataURL(f); 
    }
}         

  document.getElementById('files').addEventListener('change', handleFileSelect, false);    
    
    
  function alerta(msje){
        swal(msje);
    }
    
    function alertaok(msje){
        swal("¡Usuario registrado correctamente!",msje,"success");
    }
    
    function alertanot(msje){
        swal("¡ERROR!",msje,"error");
    }

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
        var nombre = document.getElementById("txtnombres_usu").value;
        var apellidopat=document.getElementById("txtapellidopat_usu").value;
        var apellidomat=document.getElementById("txtapellidomat_usu").value;
        var fechanac=document.getElementById("datefechanacimiento_usu").value;
        var direccion=document.getElementById("txtdireccion_usu").value;
        var telefono=document.getElementById("teltelefono_usu").value;
        var usuario=document.getElementById("txtusuario_usu").value;
        var pwd1 = document.getElementById("passwordcontraseña1_usu").value;
        var pwd2 = document.getElementById("passwordcontraseña2_usu").value;
        var foto = document.getElementById("files").value;
        
        if(foto.length == 0 || apellidopat == "" || apellidomat == "" || fechanac.length == 0 || direccion == "" || telefono == "" || usuario == "" || pwd1 == "" || pwd2 == ""){
         if(foto.length == 0){
             swal("Falta seleccionar foto","SELECCIONE UNA IMAGEN.", "warning"); 
         }
         
         if(pwd2 == ""){
             swal("Falta ingresar contraseña de confirmación","", "warning"); 
         }
            
         if(pwd1 == ""){
             swal("Falta ingresar contraseña","", "warning"); 
         }
            
            if(usuario == ""){
           swal("Falta ingresar su nombre de usuario","", "warning");
         }
            
            if(telefono == ""){
           swal("Falta ingresar teléfono","", "warning");
         }else{
            if(telefono.length<9 || telefono.length>9){
            swal("El número de contacto debe tener 9 digitos","INGRESE CORRECTAMENTE EL NÚMERO DE CONTACTO." ,"error");
            telefono.focus();
            return (false);
         }}
       
         if(direccion==""){
           swal("Falta ingresar dirección","", "warning");
       
         }
       
         if(fechanac.length == 0){
           swal("Falta fecha de nacimiento","", "warning");
         }
       
         if(apellidomat==""){
          swal("Falta ingresar apellido materno","", "warning");
         }
       
         if(apellidopat == ""){
          swal("Falta ingresar apellido paterno","", "warning");
          }
       
         if(nombre == ""){
           swal("Falta ingresar sus nombres","", "warning");
           nombre.focus();
           return (false);
           
         }
     }else{
         comprobarClave();  
     }
    }
     
    function comprobarClave(){ 
   	clave1 = document.getElementById("passwordcontraseña1_usu");
   	clave2 = document.getElementById("passwordcontraseña2_usu");
        botonregistrar = document.getElementById("btnRegistrar");
        formularioregistrarse = document.getElementById("formRegistrarseUsu");
        if (clave1.value.length<6){
        swal("La contraseña debe contener al menos 6 dígitos","INGRESE CONTRASEÑA CORRECTAMENTE.","error");
        return (false);
        }
   	if (clave1.value !== clave2.value){ 
      	swal("Las contraseñas no coinciden","INGRESE CONTRASEÑAS CORRECTAMENTE","error");
        clave1.focus();
        return (false);
        }
        if (clave1.value === clave2.value){
            formularioregistrarse.submit();
        }
    }
    
         function eliminaFotos(id){       
	imagen = document.getElementById(id);
        document.getElementById(id).setAttribute('name',null);
		padre = imagen.parentNode;
		padre.removeChild(imagen);
            } 
     
    function eliminaFotoDelete(){
	imagen2 = document.getElementById(document.getElementById("delete").value);
        document.getElementById(document.getElementById("delete").value).setAttribute('name',null);
		padre2 = imagen2.parentNode;
		padre2.removeChild(imagen2);
         }   

</script>
</html>




