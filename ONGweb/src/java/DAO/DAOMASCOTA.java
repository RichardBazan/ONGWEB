package DAO;

import DTO.DTOMASCOTA;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOMASCOTA {
    
public List<DTOMASCOTA> readAllPerros() throws SQLException {
         CallableStatement cst;
         List<DTOMASCOTA> mascota = new ArrayList<>();
         ResultSet res;
        
         try {
            cst = Conexion.getConexion().prepareCall("select cod_mas,nom_mas,sexo_mas,edad_mas,estado_mas,tenencia,r.nom_raza,u.usuario from Mascota m inner join Usuario u on u.cod_usu = m.cod_usu inner join Raza r on r.cod_raza = m.cod_raza");
            res = cst.executeQuery();
            
            while(res.next()){
               mascota.add(new DTOMASCOTA(res.getInt(1),res.getString(2), res.getString(3),res.getString(4),res.getString(5), res.getString(6), res.getString(7), res.getString(8)));
            }
         } catch (SQLException ex) {
            Logger.getLogger(DAOMASCOTA.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             Conexion.getConexion().close();
         }
         return mascota;
     }

    public void actualizaEstadoMascota(int codigo, String estado) throws SQLException  {
        CallableStatement cst;
        try { 
            cst = Conexion.getConexion().prepareCall("{call sp_actualiza_estado_mascota(?,?)}");
            
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
