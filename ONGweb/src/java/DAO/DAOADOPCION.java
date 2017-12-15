package DAO;

import DTO.*;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOADOPCION {

 public void darAdopcionAdd(DTODARADOPCION a) throws SQLException  {
        CallableStatement cst;
        try { 
            cst = Conexion.getConexion().prepareCall("{call sp_inserta_DarAdopcion(?,?,?,?,?)}");
            
            cst.setString(1, a.getNom_mas());
            cst.setString(2, a.getSexo_mas());
            cst.setString(3, a.getEdad_mas());
            cst.setString(4, a.getDescrip_mas());
            cst.setInt(5,a.getCod_raza());
            
            cst.executeQuery();

         }catch (SQLException ex) {
            Logger.getLogger(DAOADOPCION.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
          Conexion.getConexion().close();
         }
     }
 
public void adopcionAdd(int cod_mas) throws SQLException  {
        CallableStatement cst;
        try { 
            cst = Conexion.getConexion().prepareCall("{call sp_registra_Adopcion(?)}");
            
            cst.setInt(1, cod_mas);
            cst.executeQuery();

         }catch (SQLException ex) {
            Logger.getLogger(DAOADOPCION.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
          Conexion.getConexion().close();
         }
     } 

  public List<DTOMASCOTA> buscar_x_ONG_User(String tenencia) throws SQLException{
           List<DTOMASCOTA> list=new ArrayList();   
           CallableStatement cst;
       
         try{
             cst = Conexion.getConexion().prepareCall("{call sp_busca_ONG_User(?)}");
    
             cst.setString(1, tenencia);
            
            ResultSet  res=cst.executeQuery();
             while(res.next()){
               DTOMASCOTA obj=new DTOMASCOTA(res.getInt(1) ,res.getString(2),res.getString(3));
          list.add(obj);        
      }
         }catch(SQLException ex){
             Logger.getLogger(DAOADOPCION.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             Conexion.getConexion().close();
         }
         
         return list;
     } 
 
public List<DTODARADOPCION> readAll() throws SQLException {
         CallableStatement cst;
         List<DTODARADOPCION> adopcion = new ArrayList<>();
         ResultSet res;
        
         try {
            cst = Conexion.getConexion().prepareCall("select cod_mas,nom_mas,descrip_mas from Mascota where estado_mas = 'En Adopcion'");
            res = cst.executeQuery();
            
            while(res.next()){
               adopcion.add(new DTODARADOPCION(res.getInt(1),res.getString(2), res.getString(3)));
            }

         } catch (SQLException ex) {
            Logger.getLogger(DAOADOPCION.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             Conexion.getConexion().close();
         }
         return adopcion;
     }


  public List<DTODARADOPCION> readImgAll(int cod_mas) throws SQLException{
           List<DTODARADOPCION> list=new ArrayList();   
           CallableStatement cst;
       
         try{
             cst = Conexion.getConexion().prepareCall("{call sp_listImageAdopcion(?)}");
    
             cst.setInt(1, cod_mas);
            
            ResultSet  res=cst.executeQuery();
             while(res.next()){
               DTODARADOPCION obj=new DTODARADOPCION(res.getString(1));
          list.add(obj);        
      }
         }catch(SQLException ex){
             Logger.getLogger(DAOADOPCION.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             Conexion.getConexion().close();
         }
         
         return list;
     } 
  
   public List<DTODARADOPCION> buscarDetalleAdopcion(int cod_mas) throws SQLException{
           List<DTODARADOPCION> list=new ArrayList();   
           PreparedStatement pst; 
       
         try{
             pst = Conexion.getConexion().prepareStatement("{call sp_detalle_Adopcion(?)}");
    
             pst.setInt(1, cod_mas);
            
            ResultSet  res=pst.executeQuery();
             while(res.next()){
               DTODARADOPCION obj=new DTODARADOPCION(res.getString(1), res.getString(2),res.getString(3));
          list.add(obj);        
      }
         }catch(SQLException ex){
             Logger.getLogger(DAOADOPCION.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             Conexion.getConexion().close();
         }
         
         return list;
     } 
   
   public List<DTODARADOPCION> buscarImgDetalleAdopcion(int cod_mas) throws SQLException{
           List<DTODARADOPCION> list=new ArrayList();   
           PreparedStatement pst; 
       
         try{
             pst = Conexion.getConexion().prepareStatement("{call sp_detalle_img_Adopcion(?)}");
    
             pst.setInt(1, cod_mas);
            
            ResultSet  res=pst.executeQuery();
             while(res.next()){
               DTODARADOPCION obj=new DTODARADOPCION(res.getString(1));
          list.add(obj);        
      }
         }catch(SQLException ex){
             Logger.getLogger(DAOADOPCION.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             Conexion.getConexion().close();
         }
         
         return list;
     } 
}
