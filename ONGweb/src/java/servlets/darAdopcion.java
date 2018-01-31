package servlets;

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
import javax.servlet.http.HttpSession;
import DAO.DAOVALIDA;

/**
 *
 * @author bruno
 */
@WebServlet(name = "darAdopcion", urlPatterns = {"/darAdopcion"})
public class darAdopcion extends HttpServlet {

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
       
         DTO.DTODARADOPCION DTOADOP =new DTO.DTODARADOPCION(); 
         DAO.DAOADOPCION    DAOADOP =new DAO.DAOADOPCION();
         DTO.DTODARADOPCION DTOADOP1=new DTO.DTODARADOPCION(); 
         DTO.DTODARADOPCION DTOADOP2=new DTO.DTODARADOPCION(); 
         DTO.DTODARADOPCION DTOADOP3=new DTO.DTODARADOPCION(); 
         DTO.DTODARADOPCION DTOADOP4=new DTO.DTODARADOPCION(); 
       
          String pag ="registrarDarAdopcion.jsp";
       
        try {   
            DAOVALIDA valid=new DAOVALIDA();
            int res = 0;
                int ed1 = Integer.parseInt(request.getParameter("edad1"));
                int ed2 = Integer.parseInt(request.getParameter("edad2"));
                String edad = null;
                String año,mes;
                if(ed1 > 1){
                    año = " años y ";
                }else{
                    año = " año y ";
                }
                if(ed2 > 1){
                    mes = " meses";
                }else{
                    mes = " mes";
                }
                
                edad = String.valueOf(ed1)+ año + String.valueOf(ed2) + mes;
                
                DTOADOP.setNom_mas(valid.primeraLetraMayuscula(request.getParameter("name").substring(0,1))+request.getParameter("name").substring(1,request.getParameter("name").length()));
                DTOADOP.setCod_raza(Integer.parseInt(request.getParameter("cboBR")));            
                DTOADOP.setSexo_mas(request.getParameter("cboBS"));
                DTOADOP.setEdad_mas(edad);            
                DTOADOP.setDescrip_mas(valid.primeraLetraMayuscula(request.getParameter("descripcion").substring(0,1))+request.getParameter("descripcion").substring(1,request.getParameter("descripcion").length()));
                DTOADOP.setCodigo(Integer.parseInt(request.getParameter("cod_usu")));
                
                HttpSession ses = request.getSession();
                
                res = DAOADOP.darAdopcionAdd(DTOADOP);
                
                String f1 = request.getParameter("URL1");
                String f2 = request.getParameter("URL2");
                String f3 = request.getParameter("URL3");                
                String f4 = request.getParameter("URL4");   

                
                if(!f1.equals("")){ 
                     DTOADOP1.setFoto(f1);
                     res = DAOADOP.darAdopcionFotoAdd(DTOADOP1);}
                
                if(!f2.equals("")){
                     DTOADOP2.setFoto(f2);
                     res = DAOADOP.darAdopcionFotoAdd(DTOADOP2);}
                
                if(!f3.equals("")){
                     DTOADOP3.setFoto(f3);
                     res = DAOADOP.darAdopcionFotoAdd(DTOADOP3);}
                
                if(!f4.equals("")){
                    
                     DTOADOP4.setFoto(f4);
                     res = DAOADOP.darAdopcionFotoAdd(DTOADOP4);}         

                if(res==0){
                    ses.setAttribute("men",("No se registro con exito...Intentelo de nuevo!").toUpperCase());
                }else{
                ses.setAttribute("men",("Su mascota ha sido registrado correctamente. Gracias por confiar en nosotros!").toUpperCase());    
                response.sendRedirect(pag);
                }        
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
