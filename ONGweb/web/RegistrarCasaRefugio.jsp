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
    <style>.contenedor {position: relative;height: 125px;width: 220px;margin: 50px 20px;float: left;margin: 10px 5px 0 0;}
                       .contenedor img {position: absolute;left: 0;transition: opacity 0.5s ease-in-out;}
                       .contenedor img.top:hover {opacity: 0.50;}</style>    
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
    if(ses.getAttribute("resultadoRegistroCR")!=null){
        String msje = ses.getAttribute("resultadoRegistroCR").toString();
        if (msje.substring(0,1).equalsIgnoreCase("C")){
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
    
    ses.setAttribute("resultadoRegistroCR",null);
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
                    
                    <li  class="active">
                        <a href="#"><i class="fa fa-edit fa-fw"></i>CASA REFUGIO<span class="fa arrow"></span></a> 
                        <ul class="nav nav-second-level">
                            <li class="selected">
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
                    <h1 class="page-header">Registro de Casas Refugio</h1>
                </div>
                <!--End Page Header -->
            </div>

              <div class="row">
                <div class="col-lg-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Datos de Casa Refugio
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form name="frmRegistrarCasaRefugio" id="frmRegistrarCasaRefugio" role="form" method="post" action="SERCASAREFUGIO">
                                        <div class="form-group">
                                            <label>Nombre</label>
                                            <input type="text" name="txtnombre" id="txtnombre" class="form-control" onkeypress="return soloLetras(event)" placeholder="Ingrese nombre" required>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>Dirección</label>
                                            <input type="text" name="txtdireccion" id="txtdireccion" class="form-control" placeholder="Ingrese dirección" required>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>Teléfono Contacto</label>
                                            <input type="tel" name="teltelefono" id="teltelefono" pattern="[0-9]{9}" class="form-control" onkeypress="return valida(event)" maxlength="9" placeholder="Ejm : 012571231 / 912720251" required>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>Descripción</label>
                                            <textarea class="form-control" name="txtdescripcion" id="txtdescripcion" placeholder="Escriba la descripción aqui!" rows="5" cols="25" onkeypress="return soloLetrasConSignos(event)"  required></textarea>
                                            <p>Máximo 330 caractéres</p>
                                        </div>
                                        <!--
                                        <div class="form-group">
                                            <label>Static Control</label>
                                            <p>email@example.com</p>
                                        </div>
                                        -->
                                        <div class="form-group">
                                            <label>Foto/Imagen de referencia</label>
                                        </div>    
                                        <div class="form-group">
                                            <!-- PARA INPUT FILE -->
                                            <input type="file" name="files[]" id="files" class="inputfile inputfile-4" data-multiple-caption="{count} Fotos seleccionadas" multiple />
                                            <label for="files"> <figure><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg></figure><span>Seleccionar imagen&hellip;</span></label>
                                            <!-- PARA INPUT FILE -->
                                        </div>
                                        
                                        <div class="form-group">
                                            <button type="button" class="btn btn-primary" onclick="valid()">Registrar</button>
                                            &nbsp;
                                            <button type="reset" class="btn btn-primary">Cancelar</button>
                                        </div>
                                        
                                        <div class="form-group">      
                                            <input type="hidden" id="URL_1" name="URL_1" size="100"  value ="">
                                            <input type="hidden" id="URL_2" name="URL_2" size="100"  value ="">
                                            <input type="hidden" id="URL_3" name="URL_3" size="100"  value ="">
                                            <input type="hidden" id="URL_4" name="URL_4" size="100"  value ="">
                                            <input type="hidden" id="delete" name="delete" size="100"  value ="imgdelete">
                                        </div>
                                        
                                        <div class="form-group">      
                                            <input type="hidden" id="URL_1" name="URL_1" size="100"  value ="">
                                            <input type="hidden" id="URL_2" name="URL_2" size="100"  value ="">
                                            <input type="hidden" id="URL_3" name="URL_3" size="100"  value ="">
                                            <input type="hidden" id="URL_4" name="URL_4" size="100"  value ="">
                                            <input type="hidden" id="delete" name="delete" size="100"  value ="imgdelete">
                                        </div>
                                        <div class="form-group">      
                                <input type="hidden" id="URL_1" name="URL_1" size="100"  value ="">
                                <input type="hidden" id="URL_2" name="URL_2" size="100"  value ="">
                                <input type="hidden" id="URL_3" name="URL_3" size="100"  value ="">
                                <input type="hidden" id="URL_4" name="URL_4" size="100"  value ="">
                            </div>
                                    </form>
                                </div>
                                <div class="row text-center">
                                    <img src="assets/images/casa.png" width="450" height="450">
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
</body>

<style>
  .thumb {
    height: 75px;
    border: 1px solid #000;
    margin: 10px 5px 0 0;
  }
</style>

    <!-- PARA INPUT FILE -->
    <script src="assets/js/custom-file-input.js"></script>
    <!-- /PARA INPUT FILE -->
    <script src="assets/plugins/jquery-1.10.2.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="assets/plugins/pace/pace.js"></script>
    <script src="assets/scripts/siminta.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <script type="text/javascript">
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
        if(files.length > 3){
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
          span.innerHTML = ['<div class="contenedor"><img src="assets/img/delete.png" title = "Eliminar" height= "125" width="220" id="imgdelete"/>\n\
                            <a><img class="top" src="', e.target.result,'" id="', e.target.result, '" title="', escape(theFile.name), '" height= "125" width="220" name="imagen"/></a></div>'].join('');
          document.getElementById('list').insertBefore(span, null);      
         
                    if(!f){
                                                  
                         if(document.getElementById('URL_1').value.length === 0){
                             document.frmRegistrarCasaRefugio.URL_1.value = e.target.result;
                           
                         }else{                          
                            if(document.getElementById('URL_2').value.length === 0){
                             document.frmRegistrarCasaRefugio.URL_2.value = e.target.result;
                          
                         }else{
                             if(document.getElementById('URL_3').value.length === 0){
                             document.frmRegistrarCasaRefugio.URL_3.value = e.target.result;
                             
                          }}}
                         if(document.getElementById('URL_1').value.length > 0 && document.getElementById('URL_2').value.length > 0 && document.getElementById('URL_3').value.length > 0 ){
                              document.getElementById("files").disabled = true;
                         }else{
                               document.getElementById("files").disabled = false;
                         }
                      }               
                      
                      
        $(document).ready(function(){
	$("img[name=imagen]").click(function () {
	//alert("has hecho click en la imagen");       
        var img1 = document.frmRegistrarCasaRefugio.URL_1.value;
        var img2 = document.frmRegistrarCasaRefugio.URL_2.value;
        var img3 = document.frmRegistrarCasaRefugio.URL_3.value;
        var imagenes = [img1,img2,img3];  
        
                  if(!f){
                         //Eliminando value de los input text
                            if(imagenes[0].length > 0){
                                eliminaFotos(imagenes[0]);
                                document.frmRegistrarCasaRefugio.URL_1.value = "";
                                eliminaFotoDelete()[0];
                               }  
                               
                             if(imagenes[1].length > 0){
                                eliminaFotos(imagenes[1]);
                                document.frmRegistrarCasaRefugio.URL_2.value = "";
                                eliminaFotoDelete()[1];
                               }   
                         
                            if(imagenes[2].length > 0){
                                eliminaFotos(imagenes[2]);
                                document.frmRegistrarCasaRefugio.URL_3.value = "";
                                eliminaFotoDelete()[2];
                               }
                        } 
                             /*var con = files.length;
                             alert(contador(con));*/
	});
        });
        
        
        };
      })(f);
      // Read in the image file as a data URL.
      reader.readAsDataURL(f); 
    }
}         

  document.getElementById('files').addEventListener('change', handleFileSelect, false);    
    
    
    
    function valida(e){
    tecla = (document.all) ? e.keyCode : e.which;
   //Tecla de retroceso para borrar, siempre la permite
    if (tecla===8){
        return true;
    }        
    // Patron de entrada, en este caso solo acepta numeros
    patron =/[0-9]/;
    tecla_final = String.fromCharCode(tecla);
    return patron.test(tecla_final);
    }
    
    function alerta(msje){
        swal(msje);
    }
    
    function alertaok(msje){
        swal("¡Registro de Casa Refugio Correctamente!",msje,"success");
    }
    
    function alertanot(msje){
        swal("¡ERROR!",msje,"error");
    }
    
    function soloLetras(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = ' áéíóúabcdefghijklmnñopqrstuvwxyz."';
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

    function soloLetrasConSignos(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = 'áéíóúabcdefghijklmnñopqrstuvwxyz.;,:" ';
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
        var val = document.getElementById('txtnombre').value;
        var tam = val.length;
        for(i = 0; i < tam; i++) {
                if(!isNaN(val[i]))
                document.getElementById('txtnombre').value = '';
            }
        }
        
    function limpia2(){
        var val = document.getElementById('txtdescripcion').value;
        var tam = val.length;
        for(i = 0; i < tam; i++) {
                if(!isNaN(val[i]))
                document.getElementById('txtdescripcion').value = '';
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
     
    function valid(){
       var nombre = document.getElementById("txtnombre").value;
       var direccion = document.getElementById("txtdireccion").value;
       var telefono = document.getElementById("teltelefono").value;
       var descripcion = document.getElementById("txtdescripcion").value;
       
       if(nombre=="" || direccion=="" || telefono=="" || descripcion == ""){     
       
       if(descripcion==""){
           swal("Falta descripción casa refugio","", "warning");
       }
       
        if(telefono==""){
          swal("Falta teléfono casa refugio","", "warning");
       }
       
       if(direccion == ""){
          swal("Falta dirección casa refugio","", "warning");
       }
       
       if(nombre==""){
           swal("Falta nombre de casa refugio","", "warning");
       }
   }else{
         if(telefono.length<9 || telefono.length>9){
            swal("El número de contacto debe tener 9 digitos","INGRESE CORRECTAMENTE EL NÚMERO DE CONTACTO." ,"error");
            telefono.focus();
            return (false);
         }else{
       document.getElementById("frmRegistrarCasaRefugio").submit();
   }
   }        
  }
    </script>
</html>

