package DAO;

import DTO.DTODENUNCIA;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAODENUNCIA {
     
 public int denunciaAdd(DTODENUNCIA d) throws SQLException  {
        CallableStatement cst;
        int res = 0 ;
        try { 
            cst = Conexion.getConexion().prepareCall("{call sp_inserta_Denuncia(?,?,?,?,?,?)}");
            
            cst.setString(1, d.getTitulo_den());
            cst.setString(2, d.getDir_den() );
            cst.setString(3, d.getTel_cont() );
            cst.setString(4, d.getDescrip_den());
            cst.setInt(5 ,d.getCod_raza());
            cst.setInt(6 ,d.getCodigo());
            
            res = cst.executeUpdate();

         }catch (SQLException ex) {
            Logger.getLogger(DAODENUNCIA.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
          Conexion.getConexion().close();
         }
        return res;
 }
 
  public int denunciaFotoAdd(String foto_den) throws SQLException  {
        CallableStatement cst;
        int res = 0;
        try { 
            cst = Conexion.getConexion().prepareCall("{call sp_FotoDenuncia(?)}");
            
            cst.setString(1, foto_den);
            
            res = cst.executeUpdate();

         }catch (SQLException ex) {
            Logger.getLogger(DAODENUNCIA.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
          Conexion.getConexion().close();
         }
         return res;
 }
 
 public List<DTODENUNCIA> readAll() throws SQLException {
         CallableStatement cst;
         List<DTODENUNCIA> denuncia = new ArrayList<>();
         ResultSet res;
        
         try {
            cst = Conexion.getConexion().prepareCall("select cod_den,titulo_den,descrip_den  from Denuncia where estado_den = 'En tratamiento'");
            res = cst.executeQuery();
            
            while(res.next()){
               denuncia.add(new DTODENUNCIA(res.getInt(1),res.getString(2), res.getString(3)));
            }

         } catch (SQLException ex) {
            Logger.getLogger(DAODENUNCIA.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             Conexion.getConexion().close();
         }
         return denuncia;
     }
 
  public List<DTODENUNCIA> readAllSolucionados() throws SQLException {
         CallableStatement cst;
         List<DTODENUNCIA> denuncia = new ArrayList<>();
         ResultSet res;
        
         try {
            cst = Conexion.getConexion().prepareCall("select cod_den,titulo_den,descrip_den  from Denuncia where estado_den = 'Solucionada'");
            res = cst.executeQuery();
            
            while(res.next()){
               denuncia.add(new DTODENUNCIA(res.getInt(1),res.getString(2), res.getString(3)));
            }

         } catch (SQLException ex) {
            Logger.getLogger(DAODENUNCIA.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             Conexion.getConexion().close();
         }
         return denuncia;
     }
 
 
 
  public List<DTODENUNCIA> readImgAll(int cod_den) throws SQLException {
         CallableStatement cst;
         List<DTODENUNCIA> denuncia = new ArrayList<>();
         ResultSet res;
        
         try {
            cst = Conexion.getConexion().prepareCall("{call sp_listImageDenuncia(?)}");
            cst.setInt(1, cod_den);
            
            res = cst.executeQuery();
            
            while(res.next()){
               denuncia.add(new DTODENUNCIA(res.getString(1)));
            }

         } catch (SQLException ex) {
            Logger.getLogger(DAODENUNCIA.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             Conexion.getConexion().close();
         }
         return denuncia;
     }
 
    public List<DTODENUNCIA> buscarDetalleDenuncia(int cod_den) throws SQLException{
           List<DTODENUNCIA> list=new ArrayList();   
           PreparedStatement pst; 
       
         try{
             pst = Conexion.getConexion().prepareStatement("{call sp_detalle_Denuncia(?)}");
    
             pst.setInt(1, cod_den);
            
            ResultSet  res=pst.executeQuery();
             while(res.next()){
               DTODENUNCIA obj=new DTODENUNCIA(res.getString(1),res.getString(2), res.getString(3));
            list.add(obj);        
            }
         }catch(SQLException ex){
             Logger.getLogger(DAODENUNCIA.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             Conexion.getConexion().close();
         }
         
         return list;
     } 
    
       public List<DTODENUNCIA> buscarImgDetalleAdopcion(int cod_mas) throws SQLException{
           List<DTODENUNCIA> list=new ArrayList();   
           PreparedStatement pst; 
       
         try{
             pst = Conexion.getConexion().prepareStatement("{call sp_detalle_img_Denuncia(?)}");
    
             pst.setInt(1, cod_mas);
            
            ResultSet  res=pst.executeQuery();
             while(res.next()){
               DTODENUNCIA obj=new DTODENUNCIA(res.getString(1));
          list.add(obj);        
      }
         }catch(SQLException ex){
             Logger.getLogger(DAODENUNCIA.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             Conexion.getConexion().close();
         }
         
         return list;
     } 
            
   public List<DTODENUNCIA> readAllDenunciaMaltrato() throws SQLException {
         CallableStatement cst;
         List<DTODENUNCIA> denuncia = new ArrayList<>();
         ResultSet res;
        
         try {
            cst = Conexion.getConexion().prepareCall("select cod_den,titulo_den,tel_cont,CAST(DAY(fecha_reg) as varchar) + '/' + CAST(MONTH(fecha_reg) as varchar) + '/' + CAST(YEAR(fecha_reg) as varchar) as fecha_reg ,r.nom_raza ,estado_den,u.usuario from Denuncia d inner join Usuario u on u.cod_usu = d.cod_usu inner join Raza r on r.cod_raza = d.cod_raza");
            res = cst.executeQuery();
            
            while(res.next()){
               denuncia.add(new DTODENUNCIA(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5),res.getString(6),res.getString(7)));
            }
         } catch (SQLException ex) {
            Logger.getLogger(DAODENUNCIA.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             Conexion.getConexion().close();
         }
         return denuncia;
     }
   
       public void actualizaEstadoDenuncia(int codigo, String estado) throws SQLException  {
        CallableStatement cst;
        try { 
            cst = Conexion.getConexion().prepareCall("{call sp_actualiza_estado_denuncia(?,?)}");
            
            cst.setInt(1, codigo);
            cst.setString(2, estado);
            
            cst.executeQuery();

         }catch (SQLException ex) {
            Logger.getLogger(DAOADOPCION.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
          Conexion.getConexion().close();
         }
     }
           public static ResultSet cantidadDenunciasRegistradaPor(int codigoUsuario){
        ResultSet rs = null;
        try {
            CallableStatement cst = Conexion.getConexion().prepareCall("{call cantidadDenunciasRegistradaPor(?)}");
            cst.setInt(1, codigoUsuario);
            rs = cst.executeQuery();
        } catch (Exception e) {
            System.err.println(e.toString());
        }
        return rs;
    }
           
           public static ResultSet cantidadDenunciasRegistrada(){
        ResultSet rs = null;
        try {
            CallableStatement cst = Conexion.getConexion().prepareCall("{call cantidadDenunciasRegistrada()}");
            rs = cst.executeQuery();
        } catch (Exception e) {
            System.err.println(e.toString());
        }
        return rs;
    }
}
