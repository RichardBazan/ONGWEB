package DAO;

import DTO.DTOCOMENTARIO;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOCOMENTARIO {
    
     public List<DTOCOMENTARIO> buscaComentario(int cod_den) throws SQLException {
         CallableStatement cst;
         List<DTOCOMENTARIO> comentario = new ArrayList<>();
         ResultSet res;
        
         try {
            cst = Conexion.getConexion().prepareCall("{call sp_busca_comentario(?)}");
            
            cst.setInt(1, cod_den);
            res = cst.executeQuery();
            
            while(res.next()){
               comentario.add(new DTOCOMENTARIO(res.getString(1),res.getString(2)));
            }

         } catch (SQLException ex) {
            Logger.getLogger(DAOCOMENTARIO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             Conexion.getConexion().close();
         }
         return comentario;
     }
     
     public void comentarioAdd(String comentario,int cod_den) throws SQLException  {
        CallableStatement cst;
        try { 
            cst = Conexion.getConexion().prepareCall("{call sp_inserta_comentario(?,?)}");
            
            cst.setString(1, comentario);
            cst.setInt(2, cod_den);
            
            cst.executeQuery();

         }catch (SQLException ex) {
            Logger.getLogger(DAOCOMENTARIO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
          Conexion.getConexion().close();
         }
     }
}
