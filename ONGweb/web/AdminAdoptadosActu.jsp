<%@page import="javax.swing.JOptionPane"%>
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
            function validar_popup() {
                var valor = document.getElementById("cboEstadoAdoptado").value;
                
             if(valor == "#"){
                  swal("Falta seleccionar estado!","Eliga un estado por favor", "warning");
             }else{
             document.frmActuAdoptado.submit();
             window.opener.location.reload(); 
             swal("�BIEN HECHO!","Ha sido actualizado el estado correctamente","success");                    
                }
            }

     function cerrar_popup(){
         close();
     }
       
        </script>
</head>

<body>
        <div id="page-wrapper">

            
            <div class="row">
                 <!--  page header -->
                <div class="col-lg-12">
                    <h1 class="page-header">Estado Adopci�n</h1>
                </div>
                 <!-- end  page header -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Registro Estado Adopci�n
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <form name="frmActuAdoptado" method="POST" action="actualiza_estAdoptado">
                                    <center>
                                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <td>Estado Actual</td><td><b><%=request.getParameter("estado")%></b></td><tr></tr>
                                            <td>Nuevo Estado</td> 
                                             <td>
                                                 <select class="form-control" name="cboEstadoAdoptado" id="cboEstadoAdoptado">
                                                        <option value="#" disabled selected>:: Seleccionar ::</option>
                                                        <option value="En espera">En espera</option>
                                                        <option value="Confirmada">Confirmada</option>
                                                        <option value="Rechazada">Rechazada</option>
                                                        <option value="Cancelada">Cancelada</option>
                                                     </select>
                                             </td><tr></tr> 
                                            <input type="hidden" name="codigo_adop" value="<%=request.getParameter("cod")%>">
                                            <input type="hidden" name="codigo_mascota" value="<%=request.getParameter("codmascota")%>">
                                            
                                            <td colspan="2"><center>
                                                <input type="button" class="btn btn-primary" onclick="validar_popup()" id="Actualizar" value="Actualizar">
                                                <input type="button" size="20" class="btn btn-primary" onclick="cerrar_popup()" value="Cancelar"></center></td>
                                         </table>
                                    </center>
                             </form>
                            </div> 
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div></div>
    <!-- Core Scripts - Include with every page -->
    <script src="assets/plugins/jquery-1.10.2.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="assets/plugins/pace/pace.js"></script>
    <script src="assets/scripts/siminta.js"></script>
    <!-- Page-Level Plugin Scripts-->
    <script src="assets/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="assets/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#dataTables-example').dataTable();
        });
    </script>

</body>
</html>
