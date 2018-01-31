package CONTROLADOR;

import DAO.DAOUSUARIO;
import DTO.DTOUSUARIO;
import java.io.IOException;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DAO.DAOVALIDA;


@WebServlet(name = "SerLoginRegistrarse", urlPatterns = {"/SerLoginRegistrarse"})
public class SerLoginRegistrarse extends HttpServlet {

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
            Calendar calendario = Calendar.getInstance();
            HttpSession ses = request.getSession();
            int opc=Integer.parseInt(request.getParameter("opc"));  
            //JOptionPane.showMessageDialog(null,opc+"");
        
        if (opc==1){
            String user = request.getParameter("txtuser");
            String password = request.getParameter("passwordpassword");
            String passwordencript = DAOUSUARIO.encriptarContraseña(password);
            int hora = calendario.get(Calendar.HOUR_OF_DAY);
            int min = calendario.get(Calendar.MINUTE);
            //JOptionPane.showMessageDialog(null,user+" "+password);
            DTOUSUARIO usuarioencontrado = DAOUSUARIO.buscarUsuario(user, passwordencript);
            if(usuarioencontrado!=null){
                ses.setAttribute("usuarioEncontrado",usuarioencontrado);
                if ((hora==0&&min>=0)||(hora>0&&hora<12)){
                    ses.setAttribute("resultadoLogin", ("¡BUENOS DÍAS " + usuarioencontrado.getApellido_pat() + " " + usuarioencontrado.getApellido_mat() + ", " + usuarioencontrado.getNombre()+"!").toUpperCase());                    
                }else if ((hora==12&&min>=0)||(hora>12&&hora<18)){
                    ses.setAttribute("resultadoLogin", ("¡BUENAS TARDES " + usuarioencontrado.getApellido_pat() + " " + usuarioencontrado.getApellido_mat() + ", " + usuarioencontrado.getNombre()+"!").toUpperCase());
                }else{
                    ses.setAttribute("resultadoLogin", ("¡BUENAS NOCHES " + usuarioencontrado.getApellido_pat() + " " + usuarioencontrado.getApellido_mat() + ", " + usuarioencontrado.getNombre()+"!").toUpperCase());
                }
                String pag = "./inicio.jsp";
                response.sendRedirect(pag);
                String[] arregloDatos = {usuarioencontrado.getNombre(),usuarioencontrado.getApellido_pat().substring(0,1),usuarioencontrado.getUsuario(),usuarioencontrado.getCodigo().toString(),usuarioencontrado.getApellido_pat(),usuarioencontrado.getApellido_mat(),usuarioencontrado.getFechaNacimiento(),usuarioencontrado.getDireccion(),usuarioencontrado.getTelefono(),usuarioencontrado.getPertenencia(),usuarioencontrado.getFoto()};                
                ses.setAttribute("datosUsuario",arregloDatos);
                ses.setAttribute("codigoUsuario",usuarioencontrado.getCodigo());
            }else{
                ses.setAttribute("resultadoLogin","INTÉNTELO NUEVAMENTE...");
                String pag = "./login.jsp";                
                response.sendRedirect(pag);
            }
        }else{
            String nombre = request.getParameter("txtnombres");
            String apellido_pat = request.getParameter("txtapellidopat");
            String apellido_mat = request.getParameter("txtapellidomat");
            String fechaNacimiento = request.getParameter("datefechanacimiento");
            String direccion= request.getParameter("txtdireccion");
            String telefono = request.getParameter("teltelefono");
            String usuario = request.getParameter("txtusuario");
            String contraseña = request.getParameter("passwordcontraseña1");
            String contraseñaencript = DAOUSUARIO.encriptarContraseña(contraseña);
            String foto = request.getParameter("URL_1");
            //String foto = request.getParameter("lblfoto");
            
            //JOptionPane.showMessageDialog(null,foto);
           
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
            //JOptionPane.showMessageDialog(null,nombre+" "+apellido_pat+" "+apellido_mat+" "+fechaNacimiento+" "+direccion+" "+telefono+" "+usuario+" "+contraseña+" "+foto);
            int filasafectadas = DAOUSUARIO.agregarNuevoUsuario(dtousuario);
            
            DAOVALIDA obj=new DAOVALIDA();
            
            if(filasafectadas>0){
                ses.setAttribute("resultadoRegistro","SE HA REGITRADO CORRECTAMENTE. ¡BIENVENIDO "+ obj.primeraLetraMayuscula(dtousuario.getUsuario()) +" A NUESTRO EQUIPO!");
            }else{
                ses.setAttribute("resultadoRegistro","ALGO OCURRIÓ FALLIDO. INTÉNTELO NUEVAMENTE...");
            }
            
            //JOptionPane.showMessageDialog(null,ses.getAttribute("resultadoRegistro").toString());
            
            String pag = "./login.jsp";
            response.sendRedirect(pag);
            }
            
        } catch (NullPointerException e) {
            System.out.println(e.toString());
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
