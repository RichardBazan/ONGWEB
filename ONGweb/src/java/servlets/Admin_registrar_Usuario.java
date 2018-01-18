package servlets;

import DAO.DAOUSUARIO;
import DTO.DTOUSUARIO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bruno
 */
@WebServlet(name = "Admin_registrar_Usuario", urlPatterns = {"/Admin_registrar_Usuario"})
public class Admin_registrar_Usuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            String nombre = request.getParameter("txtnombres_usu");
            String apellido_pat = request.getParameter("txtapellidopat_usu");
            String apellido_mat = request.getParameter("txtapellidomat_usu");
            String fechaNacimiento = request.getParameter("datefechanacimiento_usu");
            String direccion= request.getParameter("txtdireccion_usu");
            String telefono = request.getParameter("teltelefono_usu");
            String usuario = request.getParameter("txtusuario_usu");
            String contraseña = request.getParameter("passwordcontraseña1_usu");
            String contraseñaencript = DAOUSUARIO.encriptarContraseña(contraseña);
            String foto = request.getParameter("URL_1");
            
            HttpSession ses = request.getSession();
           
            DTOUSUARIO dtousuario = new DTOUSUARIO();
            dtousuario.setNombre(nombre);
            dtousuario.setApellido_pat(apellido_pat);
            dtousuario.setApellido_mat(apellido_mat);
            dtousuario.setFechaNacimiento(fechaNacimiento);
            dtousuario.setDireccion(direccion);
            dtousuario.setTelefono(telefono);
            dtousuario.setUsuario(usuario);
            dtousuario.setContraseña(contraseñaencript);
            dtousuario.setFoto(foto);
            
            int filasafectadas = DAOUSUARIO.agregarUsuario(dtousuario);
            
            if(filasafectadas==0){
                 ses.setAttribute("mensaje","ALGO OCURRIÓ FALLIDO. INTÉNTELO NUEVAMENTE...");
            }else{
                ses.setAttribute("mensaje","REGISTRADO CORRECTAMENTE!.");
                 String pag = "AdminRegistrarUsuario.jsp";
                 response.sendRedirect(pag);
                
            }
        } catch (IOException e) {
            Logger.getLogger(Admin_registrar_Usuario.class.getName()).log(Level.SEVERE, null, e);
        }
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
