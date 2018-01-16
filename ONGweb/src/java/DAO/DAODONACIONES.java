package DAO;

import DTO.DTODONACIONES;
import DTO.DTOPRODUCTO;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAODONACIONES {
   
    public List<DTODONACIONES> readAllDonaciones() throws SQLException{
           
           List<DTODONACIONES> list=new ArrayList();   
           CallableStatement cst;
           ResultSet res;
           
         try {
            cst = Conexion.getConexion().prepareCall("select cod_don,u.usuario,cr.nom_casa,estado_don from Donaciones d inner join Usuario u on u.cod_usu = d.cod_usu inner join CasaRefugio cr on cr.cod_casa = d.cod_casa");
            res = cst.executeQuery();
            
            while(res.next()){
               list.add(new DTODONACIONES(res.getInt(1),res.getString(2), res.getString(3),res.getString(4)));
            }

         }catch (SQLException ex) {
            Logger.getLogger(DAODONACIONES.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             Conexion.getConexion().close();
         }
         return list;
     }
    
    
    
      public List<DTOPRODUCTO> buscarDonacion (int cod_donacion) throws SQLException{
           List<DTOPRODUCTO> list=new ArrayList();   
           CallableStatement cst;
       
         try{
             cst = Conexion.getConexion().prepareCall("{call sp_detalle_Donacion(?)}");
    
             cst.setInt(1, cod_donacion);
            
            ResultSet  res=cst.executeQuery();
             while(res.next()){
               DTOPRODUCTO obj=new DTOPRODUCTO(res.getString(1) ,res.getInt(2));
          list.add(obj);        
      }
         }catch(SQLException ex){
             Logger.getLogger(DAODONACIONES.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             Conexion.getConexion().close();
         }
         return list;
     } 
      
       public void actualizaEstadoDonacion(int codigo, String estado) throws SQLException  {
        CallableStatement cst;
        try { 
            cst = Conexion.getConexion().prepareCall("{call sp_actualiza_estado_donacion(?,?)}");
            
            cst.setInt(1, codigo);
            cst.setString(2, estado);
            
            cst.executeQuery();

         }catch (SQLException ex) {
            Logger.getLogger(DAODONACIONES.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
          Conexion.getConexion().close();
         }
     }   
}
