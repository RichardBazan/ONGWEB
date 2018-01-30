<%@page import="javax.swing.JOptionPane"%>
<!DOCTYPE html>
<%@page import="CONTROLADOR.*" %>
<html class="no-js">
    <head>
        <meta charset="utf-8">
        <title>Contact | Charity / Non-profit responsive Bootstrap HTML5 template</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Dosis:400,700' rel='stylesheet' type='text/css'>

        <!-- Bootsrap -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Font awesome -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!-- Template main Css -->
        <link rel="stylesheet" href="assets/css/style.css">
        
        <!-- Modernizr -->
        <script src="assets/js/modernizr-2.6.2.min.js"></script>

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
    
    <!-- JAVA -->
    <%
     HttpSession ses = request.getSession();
     //JOptionPane.showMessageDialog(null,ses.getAttribute("resultadoRegistro"));
     if (ses.getAttribute("resultadoRegistro")!=null){
         String msje = ses.getAttribute("resultadoRegistro").toString();
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
     else if(ses.getAttribute("resultadoLogin")!=null){
         String msje = ses.getAttribute("resultadoLogin").toString();   
         %>
        <body onload="alertanot('<%=msje%>')">
    <%
        }
     else{
    %>
         <body>
    <%
        }
     ses.setAttribute("resultadoRegistro",null);
     ses.setAttribute("resultadoLogin",null);
    %>
    
    <!-- NAVBAR
    ================================================== -->
   <header class="main-header"> 
        
    
        <nav class="navbar navbar-static-top">

            <div class="navbar-top">

              <div class="container">
                  <div class="row">

                    <div class="col-sm-6 col-xs-12">

                        <ul class="list-unstyled list-inline header-contact">
                            <li> <i class="fa fa-phone"></i> <a href="tel:">945929934</a> </li>
                             <li> <i class="fa fa-envelope"></i> <a href="mailto:jmoralesrolando@salvandoangeles.org">jmoralesrolando@salvandoangeles.org</a> </li>
                       </ul> <!-- /.header-contact  -->
                      
                    </div>

                    <div class="col-sm-6 col-xs-12 text-right">

                        <ul class="list-unstyled list-inline header-social">

                            <li> <a href="#"> <i class="fa fa-facebook"></i> </a> </li>
                            <li> <a href="#"> <i class="fa fa-twitter"></i>  </a> </li>
                            <li> <a href="#"> <i class="fa fa-youtube"></i>  </a> </li>
                       </ul> <!-- /.header-social  -->
                      
                    </div>


                  </div>
              </div>

            </div>

            <div class="navbar-main">
              
              <div class="container">

                <div class="navbar-header">
                  
                 <!--
                  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">

                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>

                  </button>
                  -->
                  
                  <!-- LOGO -->
                  <a class="navbar-brand" href="index.html"><img src="assets/images/sadaka-logo.png" alt=""></a>
                  
                </div>

                <div id="navbar" class="navbar-collapse collapse pull-right">

                  <ul class="nav navbar-nav">

                    <li><a href="index.html">INICIO</a></li>
                    <li><a href="about.html">NOSOTROS</a></li>
                     <!--
                    <li class="has-child"><a href="#">CAUSAS</a>
                      <ul class="submenu">
                         <li class="submenu-item"><a href="causes.html">Causes list </a></li>
                         <li class="submenu-item"><a href="causes-single.html">Single cause </a></li>
                         <li class="submenu-item"><a href="causes-single.html">Single cause </a></li>
                         <li class="submenu-item"><a href="causes-single.html">Single cause </a></li>
                      </ul>
                    </li>
                     -->
                    <li><a href="gallery.html">GALERIA</a></li>
                    <!-- <li><a href="contact.html">CONTACTANOS</a></li> -->
                    
                  </ul>

                </div> <!-- /#navbar -->

              </div> <!-- /.container -->
              
            </div> <!-- /.navbar-main -->


        </nav> 

    </header> <!-- /. main-header -->

    <div style="background:url(assets/images/backdivperro4.png)" class="page-heading text-center">

		<div class="container zoomIn animated">
			
			<h1 class="page-title">S� PARTE DE NOSOTROS <span class="title-under"></span></h1>
			<p class="page-description">
				S� parte de nuestro equipo ingresando a tu cuenta o registr�ndote.
			</p>
			
		</div>

	</div>

	<div class="main-container fadeIn animated">

		<div class="container">

			<div class="row">

				<div class="col-md-7 col-sm-12 col-form">

					<h2 class="title-style-2">INICIO DE SESI�N <span class="title-under"></span></h2>

                                        <form action="SerLoginRegistrarse?opc=1" method="post" name="formLogin" id="formLogin">

			                    <div class="row">
                                                <div class="form-group col-md-6">
                                                    <i class="fa fa-user"></i>
                                                    <input type="text" name="txtuser" id="txtuser" class="form-control" placeholder="Usuario*" required>
                                                </div> 
                                            </div>
                            
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <i class="fa fa-key"></i>
                                                    <input type="password" name="passwordpassword" id="passwordpassword" class="form-control" placeholder="Contrase�a*" required>
                                                </div>
                                            </div>
<!--OLVIDASTE CONTRASE�A?                                                            
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <a href="#">�Olvidaste tu contrase�a?</a>
                                                </div>
                                            </div>
-->
<!--                                            
                        <div class="form-group alerts">
                        
                        	<div class="alert alert-success" role="alert">
							  
							</div>

							<div class="alert alert-danger" role="alert">
							  
							</div>
							
                        </div>	
-->
                         <div class="row">
                             <div class="form-group col-md-4">
                                 <button type="submit" class="btn btn-primary pull-right">INGRESAR</button>
                             </div>
                         </div>

                        <div class="clearfix"></div>
                                        
                                        </form>
                                            
                                </div>
                            
                            
                            

				<div class="col-md-4 col-md-offset-1 col-contact">

					<h2 class="title-style-2"> REGISTRARSE <span class="title-under"></span></h2>
					<p>
						<b>Sadaka</b> necesita personas que amen y quieran ayudar a perros que lo necesiten, s� parte de nuestro equipo registr�ndote .
					</p>

                                        <form action="SerLoginRegistrarse?opc=2" method="post" id="formRegistrarse" name="formRegistrarse"id="formRegistrarse">
                                        
                                            <div class="row">
							<div class="form-group col-md-11">
                                                        <input type="text" name="txtnombres" class="form-control" id="txtnombres" placeholder="Nombres*" required>
	                        </div>
							     </div>
                                            
                                        <div class="row">
							<div class="form-group col-md-11">
                                                        <input type="text" name="txtapellidopat" id="txtapellidopat" class="form-control" placeholder="Apellido Paterno*" required>
	                        </div>
							     </div>
                                        <div class="row">
							<div class="form-group col-md-11">
                                                        <input type="text" name="txtapellidomat" id="txtapellidomat" class="form-control" placeholder="Apellido Materno*" required>
	                        </div>
							     </div>    
                                            <div class="row">
							<div class="form-group col-md-11">
                                                            <i class="fa fa-calendar"></i>
                                                            <input type="date" name="datefechanacimiento" id="datefechanacimiento" class="form-control" min="1937-01-01" max="2000-12-31" value="2000-01-01" required>
							     </div>
                                            </div>
                                            <div class="row">
							<div class="form-group col-md-11">
                                                            <input type="text" name="txtdireccion" id="txtdireccion" class="form-control" placeholder="Direcci�n*" required>
                                                            <i style="font-size: 12px">*Ejm: Av. Sucre 525 Int. 204</i>
	                        </div>
							     </div>
                                            <div class="row">
							<div class="form-group col-md-11">
                                                            <input type="tel" name="teltelefono" id="teltelefono" class="form-control" placeholder="Tel�fono*" title="El n�mero debe tener 9 d�gitos (a los n�meros telef�nicos antecederle '01' como en el ejemplo)." maxlength="9" onkeypress="return valida(event)">
                                                            <i style="font-size: 12px">*Ejm: 012461254 / 945929934</i> 
	                        </div>
							     </div>
                                            
                                            
                                            <div class="row">
							<div class="form-group col-md-11">
                                                            <i class="fa fa-user"></i> 
                                                            <input type="text" name="txtusuario" id="txtusuario" class="form-control" placeholder="Usuario*" required>
				        	        </div>
                                            </div>
                            
                                            <div class="row">
                                                 <div class="form-group col-md-11">
                                                     <i class="fa fa-key"></i>
                                                     <input type="password" name="passwordcontrase�a1" id="passwordcontrase�a1" class="form-control" placeholder="Contrase�a*" required>
	                                     </div>
                                             </div>
                                            <div class="row">
                                            <div class="form-group col-md-11">
                                            <i class="fa fa-key"></i>
                                            <input type="password" name="passwordcontrase�a2" id="passwordcontrase�a2" class="form-control" placeholder="Repita contrase�a*" required>
	                                    </div>
                                            </div>
                                            
                                            <div class="row">
                                            <div class="form-group col-md-11">
                                                         <!-- PARA INPUT FILE -->             
                                            <input type="file" name="files[]" id="files" class="inputfile inputfile-4" data-multiple-caption="{count} Fotos seleccionadas"/>
                                            <label for="files"> <figure><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg></figure><span>Seleccionar imagen&hellip;</span></label>
                                            <!-- PARA INPUT FILE -->
                                            <input type="hidden" name="URL_1" id="URL_1" size="100" value="">
                                            <input type= "hidden" id="delete" name="delete" size="100"  value ="imgdelete">          
                                            <output id="list"></output>
	                        </div>
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
                                 <input class="btn btn-primary pull-right" onclick="comprobarCampos()" type="button" id="btnRegistrar" name="btnRegistrar" value="REGISTRARSE"/>
                            </div>
                        </div>

                        <div class="clearfix"></div>

					</form>

				</div>
			</div> <!-- /.row -->
		</div>
	</div>

    <!--
	<div id="contact-map" class="contact-map">
		
	</div>
-->

        <footer class="main-footer">

        <div class="footer-top">
            
        </div>


        <div class="footer-main">
            <div class="container">
                
                <div class="row">
                    <div class="col-md-4">

                        <div class="footer-col">
<!--
                            <h4 class="footer-title">About us <span class="title-under"></span></h4>
-->
                            <div class="footer-content">
<!--                                
                                <p>
                                    <strong>Sadaka</strong> ipsum dolor sit amet, consectetur adipiscing elit. Ut at eros rutrum turpis viverra elementum semper quis ex. Donec lorem nulla, aliquam quis neque vel, maximus lacinia urna.
                                </p> 

                                <p>
                                    ILorem ipsum dolor sit amet, consectetur adipiscing elit. Ut at eros rutrum turpis viverra elementum semper quis ex. Donec lorem nulla, aliquam quis neque vel, maximus lacinia urna.
                                </p>
-->
                            </div>
                            
                        </div>

                    </div>

                    <div class="col-md-4">

                        <div class="footer-col">
<!--
                            <h4 class="footer-title">LAST TWEETS <span class="title-under"></span></h4>
-->
                            <div class="footer-content">
                                <ul class="tweets list-unstyled">
                                    <li class="tweet"> 
<!--
                                        20 Surprise Eggs, Kinder Surprise Cars 2 Thomas Spongebob Disney Pixar  http://t.co/fTSazikPd4 

                                    </li>

                                    <li class="tweet"> 

                                        20 Surprise Eggs, Kinder Surprise Cars 2 Thomas Spongebob Disney Pixar  http://t.co/fTSazikPd4 

                                    </li>

                                    <li class="tweet"> 

                                        20 Surprise Eggs, Kinder Surprise Cars 2 Thomas Spongebob Disney Pixar  http://t.co/fTSazikPd4 
-->
                                    </li>

                                </ul>
                            </div>
                            
                        </div>

                    </div>


                    <div class="col-md-4">

                        <div class="footer-col">

                            <h4 class="footer-title">Cont�ctanos <span class="title-under"></span></h4>

                            <div class="footer-content">

                                <div class="footer-form" >
                                    
                                    <form action="php/mail.php" class="ajax-form">

                                        <div class="form-group">
                                            <input type="text" name="name" class="form-control" placeholder="Nombre" required>
                                        </div>

                                         <div class="form-group">
                                            <input type="email" name="email" class="form-control" placeholder="E-mail" required>
                                        </div>

                                        <div class="form-group">
                                            <textarea name="message" class="form-control" placeholder="Mensaje" required></textarea>
                                        </div>

                                        <div class="form-group alerts">
                        
                                            <div class="alert alert-success" role="alert">
                                              
                                            </div>

                                            <div class="alert alert-danger" role="alert">
                                              
                                            </div>
                                            
                                        </div>

                                         <div class="form-group">
                                             <button  type="submit" class="btn btn-submit pull-right">ENVIAR MENSAJE</button>
                                        </div>
                                        
                                    </form>

                                </div>
                            </div>
                            
                        </div>

                    </div>
                    <div class="clearfix"></div>



                </div>
                
                
            </div>

            
        </div>

        <div class="footer-bottom">

            <div class="container text-right">
                Sadaka @ copyrights 2015 - by <a href="http://www.ouarmedia.com" target="_blank">Ouarmedia</a>
            </div>
        </div>
        
    </footer>  
        
        <!-- jQuery -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="assets/js/jquery-1.11.1.min.js"><\/script>')</script>

        <!-- Bootsrap javascript file -->
        <script src="assets/js/bootstrap.min.js"></script>


        <!-- Google map  -->
        <script src="http://maps.google.com/maps/api/js?sensor=false&amp;libraries=places" type="text/javascript"></script>
        
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


        <!-- Template main javascript -->
        <script src="assets/js/main.js"></script>

        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
        <script>
            (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
            e.src='//www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
            ga('create','UA-XXXXX-X');ga('send','pageview');
        </script>
        
        <!-- PARA INPUT FILE -->
    <script src="assets/js/custom-file-input.js"></script>
    <!-- /PARA INPUT FILE -->
    
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
        if(files.length > 1){
            swal("Como m�ximo 1 fotos","", "error");
            return;
        }

      if (!window.FileReader) {
        swal("La p�gina no soporta la lectura de archivos","", "error");
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
                            <a><img class="top" src="', e.target.result,'" id="', e.target.result, '" title="', escape(theFile.name), '" height= "125" width="220" name="imagen" /></a></div>'].join('');
          document.getElementById('list').insertBefore(span, null);      
         
                    if(!f){
                                                  
                         if(document.getElementById('URL_1').value.length === 0){
                                 document.formRegistrarse.URL_1.value = e.target.result;
                                 document.getElementById("files").disabled = true;
                                 
                                 }
                             }    
                  
        $(document).ready(function(){
	$("img[name=imagen]").click(function () {
	//alert("has hecho click en la imagen");       
        var img1 = document.formRegistrarse.URL_1.value;
                  if(!f){
                         //Eliminando value de los input text
                            if(img1[0].length > 0){
                                document.getElementById("files").disabled = false;
                                eliminaFotos(img1);
                                document.formRegistrarse.URL_1.value = "";
                                eliminaFotoDelete()[0];                                	
                                limpia();
                                $("img").remove(e.target.result);
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
    
    function comprobarCampos(){
        var nombre = document.getElementById("txtnombres").value;
        var apellidopat=document.getElementById("txtapellidopat").value;
        var apellidomat=document.getElementById("txtapellidomat").value;
        var fechanac=document.getElementById("datefechanacimiento").value;
        var direccion=document.getElementById("txtdireccion").value;
        var telefono=document.getElementById("teltelefono").value;
        var usuario=document.getElementById("txtusuario").value;
        var pwd1 = document.getElementById("passwordcontrase�a1").value;
        var pwd2 = document.getElementById("passwordcontrase�a2").value;
        var foto = document.getElementById("files").value;
        
        if(foto.length == 0 || apellidopat == "" || apellidomat == "" || fechanac.length == 0 || direccion == "" || telefono == "" || usuario == "" || pwd1 == "" || pwd2 == ""){
         if(foto.length == 0){
             swal("Falta seleccionar foto","SELECCIONE UNA IMAGEN.", "warning"); 
         }
         
         if(pwd2 == ""){
             swal("Falta ingresar contrase�a de confirmaci�n","", "warning"); 
         }
            
         if(pwd1 == ""){
             swal("Falta ingresar contrase�a","", "warning"); 
         }
            
            if(usuario == ""){
           swal("Falta ingresar su nombre de usuario","", "warning");
         }
            
            if(telefono == ""){
           swal("Falta ingresar tel�fono","", "warning");
         }else{
            if(telefono.length<9 || telefono.length>9){
            swal("El n�mero de contacto debe tener 9 digitos","INGRESE CORRECTAMENTE EL N�MERO DE CONTACTO." ,"error");
            telefono.focus();
            return (false);
         }}
       
         if(direccion==""){
           swal("Falta ingresar direcci�n","", "warning");
       
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
   	clave1 = document.getElementById("passwordcontrase�a1");
   	clave2 = document.getElementById("passwordcontrase�a2");
        botonregistrar = document.getElementById("btnRegistrar");
        formularioregistrarse = document.getElementById("formRegistrarse");
        if (clave1.value.length<6){
        swal("La contrase�a debe contener al menos 6 d�gitos","INGRESE CONTRASE�A CORRECTAMENTE.","error");
        return (false);
        }
   	if (clave1.value !== clave2.value){ 
      	swal("Las contrase�as no coinciden","INGRESE CONTRASE�AS CORRECTAMENTE","error");
        clave1.focus();
        return (false);
        }
        if (clave1.value === clave2.value){
            formularioregistrarse.submit();
        }
    }
    
    function alerta(msje){
        swal(msje);
    }
    
    function alertanot(msje){
       swal("�Usuario o contrase�a incorrecto!",msje,"error"); 
    }
    
    function alertaok(msje){
        swal("�Usuario registrado correctamente!",msje,"success");
    }
    
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
    </body>
</html>
