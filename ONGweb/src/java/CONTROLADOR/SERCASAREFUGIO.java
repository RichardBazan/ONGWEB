package CONTROLADOR;

import DAO.DAOCASAREFUGIO;
import DTO.DTOCASAREFUGIO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SERCASAREFUGIO", urlPatterns = {"/SERCASAREFUGIO"})
public class SERCASAREFUGIO extends HttpServlet {

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
        
        try {
            String nombre = request.getParameter("txtnombre");
            String direccion = request.getParameter("txtdireccion");
            String telefono = request.getParameter("teltelefono");
            String descripcion = request.getParameter("txtdescripcion");
            
            //JOptionPane.showMessageDialog(null,nombre+" "+direccion);
            HttpSession ses = request.getSession();
            int codigoUsuario = (Integer)ses.getAttribute("codigoUsuario");
            DTOCASAREFUGIO dtocasarefugio = new DTOCASAREFUGIO(0,nombre, direccion, telefono, descripcion, telefono, codigoUsuario);
            int filasafectadas = DAOCASAREFUGIO.agregarCasaRefugio(dtocasarefugio);
            
                String f1 = request.getParameter("URL_1C");
                String f2 = request.getParameter("URL_2C");
                String f3 = request.getParameter("URL_3C");                   

                if(f1.equalsIgnoreCase("") && f2.equalsIgnoreCase("") && f3.equalsIgnoreCase("")){
                f1 = "assets/images/cr6.jpg";
                filasafectadas = DAOCASAREFUGIO.casaRefugioFotoAdd(f1);
                }else{
                if(!f1.equals("")){
                     String ff1 = request.getParameter("URL_1C");
                     filasafectadas = DAOCASAREFUGIO.casaRefugioFotoAdd(ff1);
                }
                
                if(!f2.equals("")){
                     filasafectadas = DAOCASAREFUGIO.casaRefugioFotoAdd(f2);
                }
                
                if(!f3.equals("")){
                     filasafectadas = DAOCASAREFUGIO.casaRefugioFotoAdd(f3);
                }
                }
            
            if(filasafectadas>0){
                ses.setAttribute("resultadoRegistroCR", "CASA REFUGIO GUARDADA CORRECTAMENTE. ¡GRACIAS POR SUMARNOS TU AYUDA!");
            }else{
                ses.setAttribute("resultadoRegistroCR", "ALGO OCURRIÓ FALLIDO. INTÉNTELO NUEVAMENTE...");
            }
            String pag = "./RegistrarCasaRefugio.jsp";
            response.sendRedirect(pag);
        } catch (Exception e) {
            System.err.println(e.toString());
        }
         
//@nombre varchar(50),@direccion varchar(50),@telefono varchar(50),@descripcion varchar(max),@codigoUsuario int   
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
