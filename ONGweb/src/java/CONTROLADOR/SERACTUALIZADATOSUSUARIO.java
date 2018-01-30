package CONTROLADOR;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.*;
import DTO.*;
import javax.servlet.http.HttpSession;

public class SERACTUALIZADATOSUSUARIO extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int cod;
        String nombres,apellidoPat,apellidoMat,fechaNac,direccion,telefono,foto,pertenencia,username;
        HttpSession ses = request.getSession();

        cod = Integer.parseInt(request.getParameter("txtCodigo"));
        nombres = request.getParameter("txtNombres");
        apellidoPat = request.getParameter("txtApellidoPat");
        apellidoMat = request.getParameter("txtApellidoMat");
        fechaNac = request.getParameter("dateFechaNacimiento");
        direccion = request.getParameter("txtDireccion");
        telefono = request.getParameter("txtTelefono");
        pertenencia = request.getParameter("txtPertenencia");
        username = request.getParameter("txtUserName");
        
        if (request.getParameter("URL_1").length()>0){
            foto = request.getParameter("URL_1");
        }else{
            foto = request.getParameter("txtFotoUsuario");
        }
        
        DTOUSUARIO dtousuario = new DTOUSUARIO();
        dtousuario.setCodigo(cod);
        dtousuario.setNombre(nombres);
        dtousuario.setApellido_pat(apellidoPat);
        dtousuario.setApellido_mat(apellidoMat);
        dtousuario.setFechaNacimiento(fechaNac);
        dtousuario.setDireccion(direccion);
        dtousuario.setTelefono(telefono);
        dtousuario.setFoto(foto);
        
        int res = DAOUSUARIO.actualizaDatosUsuario(dtousuario);
        
        if(res>0){
            ses.setAttribute("resultadoActualizacion","SUS DATOS HAN SIDO ACTUALIZADOS CORRECTAMENTE");
            String[] arregloDatos = {dtousuario.getNombre(),dtousuario.getApellido_pat().substring(0,1),username,dtousuario.getCodigo().toString(),dtousuario.getApellido_pat(),dtousuario.getApellido_mat(),dtousuario.getFechaNacimiento(),dtousuario.getDireccion(),dtousuario.getTelefono(),pertenencia,dtousuario.getFoto()};                
            ses.setAttribute("datosUsuario",arregloDatos);
        }else{
            ses.setAttribute("resultadoActualizacion","ALGO OCURRIÓ FALLIDO. INTÉNTELO NUEVAMENTE...");
        }
        
        response.sendRedirect("./inicio.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
