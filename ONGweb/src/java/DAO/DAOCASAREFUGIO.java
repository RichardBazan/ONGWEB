package DAO;

import DTO.DTOCASAREFUGIO;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DAOCASAREFUGIO {
    
       public List<DTOCASAREFUGIO> readAllCasaRefugio() throws SQLException {
         CallableStatement cst;
         List<DTOCASAREFUGIO> casa = new ArrayList<>();
         ResultSet res;
        
         try {
            cst = Conexion.getConexion().prepareCall("select cod_casa,nom_casa,dir_casa,tel_cont,CONCAT(DAY(fecha_reg),'-',MONTH(fecha_reg),'-',YEAR(fecha_reg)) as fecha_reg,estado_casa ,u.usuario from CasaRefugio cr inner join Usuario u on u.cod_usu = cr.cod_usu");
            res = cst.executeQuery();
            //int cod_casa, String nom_casa, String dir_casa, String tel_cont, String fecha_reg, int cod_usu
            while(res.next()){
               casa.add(new DTOCASAREFUGIO(res.getInt(1),res.getString(2), res.getString(3), res.getString(4), res.getString(5), res.getString(6),res.getString(7)));
            }
         } catch (SQLException ex) {
            Logger.getLogger(DAOCASAREFUGIO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             Conexion.getConexion().close();
         }
         return casa;
     }
       
        public void actualizaEstadoCasaRefugio(int codigo, String estado) throws SQLException  {
        CallableStatement cst;
        try { 
            cst = Conexion.getConexion().prepareCall("{call sp_actualiza_estado_casarefugio(?,?)}");
            
            cst.setInt(1, codigo);
            cst.setString(2, estado);
            
            cst.executeQuery();

         }catch (SQLException ex) {
            Logger.getLogger(DAOADOPCION.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
          Conexion.getConexion().close();
         }
     }
}
