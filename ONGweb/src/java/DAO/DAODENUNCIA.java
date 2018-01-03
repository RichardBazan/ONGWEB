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
     
 public void denunciaAdd(DTODENUNCIA d) throws SQLException  {
        CallableStatement cst;
        try { 
            cst = Conexion.getConexion().prepareCall("{call sp_inserta_Denuncia(?,?,?,?,?)}");
            
            cst.setString(1, d.getTitulo_den());
            cst.setString(2, d.getDir_den() );
            cst.setString(3, d.getTel_cont() );
            cst.setString(4, d.getDescrip_den());
            cst.setInt(5 ,d.getCod_raza());
            
            cst.executeQuery();

         }catch (SQLException ex) {
            Logger.getLogger(DAODENUNCIA.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
          Conexion.getConexion().close();
         }
 }
 
 public List<DTODENUNCIA> readAll() throws SQLException {
         CallableStatement cst;
         List<DTODENUNCIA> denuncia = new ArrayList<>();
         ResultSet res;
        
         try {
            cst = Conexion.getConexion().prepareCall("select cod_den,titulo_den,descrip_den  from Denuncia");
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
            
        
}
