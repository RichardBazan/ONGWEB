package DAO;

import DTO.DTORAZA;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author bruno
 */
public class DAORAZA {
    
    public List<DTORAZA> ListRaza() throws SQLException{
                List<DTORAZA> lis=new ArrayList();    
                String sql="select * from raza";     
        try{
                PreparedStatement st=Conexion.getConexion().prepareStatement(sql);
                ResultSet rs=st.executeQuery();
        while(rs.next()){
              DTORAZA obj=new DTORAZA(rs.getInt(1), rs.getString(2));
              lis.add(obj);
          }
    }catch(SQLException ex){
     Logger.getLogger(DAORAZA.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
          Conexion.getConexion().close();
         }
    return lis;    
    }
}
