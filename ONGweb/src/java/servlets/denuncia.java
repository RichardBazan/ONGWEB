package servlets;

import DAO.DAODENUNCIA;
import DTO.DTODENUNCIA;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author bruno
 */
@WebServlet(name = "denuncia", urlPatterns = {"/denuncia"})
public class denuncia extends HttpServlet {

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
        
           DTODENUNCIA  DTODEN=new DTODENUNCIA(); 
           DAODENUNCIA  DAODEN=new DAODENUNCIA();
       
           String pag ="registrarMaltrato.jsp";
       
        try {   
                DTODEN.setTitulo_den(request.getParameter("titulo"));
                DTODEN.setDir_den(request.getParameter("direccion"));
                DTODEN.setTel_cont(request.getParameter("telefono"));
                DTODEN.setDescrip_den(request.getParameter("descripcion"));
                DTODEN.setCod_raza(Integer.parseInt(request.getParameter("cboR")));
                
                DAODEN.denunciaAdd(DTODEN);
                JOptionPane.showMessageDialog(null, "DATOS REGISTRADOS");
                
                String f1 = request.getParameter("URL_1");
                String f2 = request.getParameter("URL_2");
                String f3 = request.getParameter("URL_3");                
                String f4 = request.getParameter("URL_4");   

                
                if(!f1.equals("")){ 
                     DAODEN.denunciaFotoAdd(f1);}
                
                if(!f2.equals("")){
                     DAODEN.denunciaFotoAdd(f2);}
                
                if(!f3.equals("")){
                     DAODEN.denunciaFotoAdd(f2);}
                
                if(!f4.equals("")){
                     DAODEN.denunciaFotoAdd(f4);}  
                
                JOptionPane.showMessageDialog(null, "FOTO(S) REGISTRADO(S)");
                response.sendRedirect(pag);
                
        } catch (SQLException ex) {
            Logger.getLogger(darAdopcion.class.getName()).log(Level.SEVERE, null, ex);
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
