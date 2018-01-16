package CONTROLADOR;

import DAO.DAOCASAREFUGIO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SERDONACION", urlPatterns = {"/SERDONACION"})
public class SERDONACION extends HttpServlet {

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
        
        HttpSession ses = request.getSession();
        int cantf = Integer.parseInt(request.getParameter("txtcantfilas"));
        int codigoCasa = Integer.parseInt(request.getParameter("txtcodcasa"));
        int codigoUsuario = Integer.parseInt(request.getParameter("txtcodusuario"));
        
        int res = DAOCASAREFUGIO.agregarDonacion(codigoCasa,codigoUsuario);
       
        for(int i=1;i<=cantf;i++){
            int codigoprod = Integer.parseInt(request.getParameter("txtcodigoproducto"+String.valueOf(i)));
            int cant = Integer.parseInt(request.getParameter("txtcantidad"+String.valueOf(i)));
            res+= DAOCASAREFUGIO.agregarDetalleDonacion(codigoprod,cant);
        }
        
        if(res==cantf+1){
           ses.setAttribute("resultadoDonacion","MUCHAS GRACIAS POR REGISTRAR TU DONACIÓN. NOS ESTAREMOS COMUNICANDO CONTIGO...");
        }else{
           ses.setAttribute("resultadoDonacion","ALGO OCURRIÓ FALLIDO. INTÉNTELO NUEVAMENTE..."); 
        }
        
        response.sendRedirect("./Donaciones.jsp?codigoCR="+String.valueOf(codigoCasa));
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
