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

 public int darAdopcionAdd(DTODARADOPCION a) throws SQLException  {
        CallableStatement cst;
        int res=0;
        try { 
            cst = Conexion.getConexion().prepareCall("{call sp_inserta_DarAdopcion(?,?,?,?,?,?)}");
            
            cst.setString(1, a.getNom_mas());
            cst.setString(2, a.getSexo_mas());
            cst.setString(3, a.getEdad_mas());
            cst.setString(4, a.getDescrip_mas());
            cst.setInt(5,a.getCod_raza());
            cst.setInt(6,a.getCodigo());
            
            res = cst.executeUpdate();

         }catch (SQLException ex) {
            Logger.getLogger(DAOADOPCION.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
          Conexion.getConexion().close();
         }
        return res;
     }
 
  public int darAdopcionFotoAdd(DTODARADOPCION a) throws SQLException  {
        CallableStatement cst;
        int res=0;
        try { 
            cst = Conexion.getConexion().prepareCall("{call sp_FotoAdopcion(?)}");
            
            cst.setString(1, a.getFoto());
            
           res = cst.executeUpdate();

         }catch (SQLException ex) {
            Logger.getLogger(DAOADOPCION.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
          Conexion.getConexion().close();
         }
        return  res;
     }
 
 
public int adopcionAdd(int cod_mas, int cod_usu) throws SQLException  {
        CallableStatement cst;
        int res = 0;
        try { 
            cst = Conexion.getConexion().prepareCall("{call sp_registra_Adopcion(?,?)}");
            
            cst.setInt(1, cod_mas);
            cst.setInt(2, cod_usu);
            res = cst.executeUpdate();

         }catch (SQLException ex) {
            Logger.getLogger(DAOADOPCION.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
          Conexion.getConexion().close();
         }
        return res;
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

public List<DTODARADOPCION> readAllAdoptados() throws SQLException {
         CallableStatement cst;
         List<DTODARADOPCION> adopcion = new ArrayList<>();
         ResultSet res;
        
         try {
            cst = Conexion.getConexion().prepareCall("select cod_mas,nom_mas,descrip_mas from Mascota where estado_mas = 'Adoptado'");
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
               DTODARADOPCION obj=new DTODARADOPCION(res.getString(1), res.getString(2),res.getString(3),res.getString(4));
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
   
   public List<DTOADOPCION> readAllPerrosAdoptados() throws SQLException {
         CallableStatement cst;
         List<DTOADOPCION> adoptados = new ArrayList<>();
         ResultSet res;
        
         try {
            cst = Conexion.getConexion().prepareCall("select cod_adop,CAST(DAY(fecha_solic) as varchar) + '/' + CAST(MONTH(fecha_solic) as varchar) + '/' + CAST(YEAR(fecha_solic) as varchar) as fecha_solic, estado_adop,u.usuario,m.nom_mas,m.cod_mas from Adopcion a inner join Usuario u on u.cod_usu = a.cod_usu inner join Mascota m on m.cod_mas = a.cod_mas");
            res = cst.executeQuery();
            
            while(res.next()){
               adoptados.add(new DTOADOPCION(res.getInt(1),res.getString(2), res.getString(3),res.getString(4),res.getString(5),res.getInt(6)));
               
            }
         } catch (SQLException ex) {
            Logger.getLogger(DAOADOPCION.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             Conexion.getConexion().close();
         }
         return adoptados;
     }
   
    public void actualizaEstadoAdoptado(int codigo, String estado, int codmascota) throws SQLException  {
        CallableStatement cst;
        try { 
            cst = Conexion.getConexion().prepareCall("{call sp_actualiza_estado_adopcion(?,?,?)}");
            
            cst.setInt(1, codigo);
            cst.setString(2, estado);
            cst.setInt(3, codmascota);
            cst.executeQuery();

         }catch (SQLException ex) {
            Logger.getLogger(DAOADOPCION.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
          Conexion.getConexion().close();
         }
     }
    
    public static ResultSet cantidadPerrosDadosenAdopcionPor(int codigoUsuario){
        ResultSet rs = null;
        try {
            CallableStatement cst = Conexion.getConexion().prepareCall("{call cantidadPerrosDadosenAdopcionPor(?)}");
            cst.setInt(1, codigoUsuario);
            rs = cst.executeQuery();
        } catch (Exception e) {
            System.err.println(e.toString());
        }
        return rs;
    }
    
    public static ResultSet cantidadPerrosAdoptadosPor(int codigoUsuario){
        ResultSet rs = null;
        try {
            CallableStatement cst = Conexion.getConexion().prepareCall("{call cantidadPerrosAdoptadosPor(?)}");
            cst.setInt(1, codigoUsuario);
            rs = cst.executeQuery();
        } catch (Exception e) {
            System.err.println(e.toString());
        }
        return rs;
    }
    
    public static ResultSet cantidadPerrosDadosenAdopcion(){
        ResultSet rs = null;
        try {
            CallableStatement cst = Conexion.getConexion().prepareCall("{call cantidadPerrosDadosenAdopcion()}");
            rs = cst.executeQuery();
        } catch (Exception e) {
            System.err.println(e.toString());
        }
        return rs;
    }
    
    public static ResultSet cantidadPerrosAdoptados(){
        ResultSet rs = null;
        try {
            CallableStatement cst = Conexion.getConexion().prepareCall("{call cantidadPerrosAdoptados()}");
            rs = cst.executeQuery();
        } catch (Exception e) {
            System.err.println(e.toString());
        }
        return rs;
    }
    
     public List<DTOREPORTEMASCOTA> list_meses_x_año(int año) throws SQLException{
           List<DTOREPORTEMASCOTA> list=new ArrayList();   
           PreparedStatement pst; 
       
         try{
             pst = Conexion.getConexion().prepareStatement("{call buscar_x_año(?)}");
    
             pst.setInt(1, año);
            
            ResultSet  res=pst.executeQuery();
             while(res.next()){
               DTOREPORTEMASCOTA obj=new DTOREPORTEMASCOTA(res.getString(1));
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
