package DAO;

import DTO.DTOCASAREFUGIO;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.*;

public class DAOCASAREFUGIO {
    
    public static int agregarCasaRefugio(DTOCASAREFUGIO dtocasarefugio){
        int filasafectadas=0;
        try {
            CallableStatement cst = Conexion.getConexion().prepareCall("{call agregarCasaRefugio(?,?,?,?,?)}");
            cst.setString(1,dtocasarefugio.getNombre());
            cst.setString(2,dtocasarefugio.getDireccion());
            cst.setString(3,dtocasarefugio.getTelefono());
            cst.setString(4,dtocasarefugio.getDescripcion());
            cst.setInt(5,dtocasarefugio.getCodigoUsuario());
            filasafectadas=cst.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e.toString());
        }
        return filasafectadas;
    }
    
    public static ResultSet listarCasasRefugio(){
        ResultSet rs = null;
        try {
            CallableStatement cst = Conexion.getConexion().prepareCall("{call listarCasasRefugio()}");
            rs = cst.executeQuery();
        } catch (Exception e) {
            System.err.println(e.toString());
        }
        return rs;
    }
    
    public static ResultSet casaRefugioPorCodigo(int codigo){
        ResultSet rs = null;
        try {
            CallableStatement cst = Conexion.getConexion().prepareCall("{call casaRefugioPorCodigo(?)}");
            cst.setInt(1,codigo);
            rs = cst.executeQuery();
        } catch (Exception e) {
            System.err.println(e.toString());
        }
        return rs;
    }
    
    public static ResultSet fotosPorCodigoCR(int codigo){
        ResultSet rs = null;
        try {
            CallableStatement cst = Conexion.getConexion().prepareCall("{call fotosPorCodigoCR(?)}");
            cst.setInt(1, codigo);
            rs = cst.executeQuery();
        } catch (Exception e) {
            System.err.println(e.toString());
        }
        return rs;
    }
    
    public static ResultSet listarDonaciones(int codigoCR){
        ResultSet rs = null;
        try {
            CallableStatement cst = Conexion.getConexion().prepareCall("{call listarDonaciones(?)}");
            cst.setInt(1,codigoCR);
            rs = cst.executeQuery();
        } catch (Exception e) {
            System.err.println(e.toString());
        }
        return rs;
    }
    
    public static ResultSet detalleDonacion(int codDonacion){
        ResultSet rs = null;
        try {
            CallableStatement cst = Conexion.getConexion().prepareCall("{call detalleDonacion(?)}");
            cst.setInt(1,codDonacion);
            rs = cst.executeQuery();
        } catch (Exception e) {
            System.err.println(e.toString());
        }
        return rs;
    }
    
    public static ResultSet listarProductos(){
        ResultSet rs = null;
        try {
            CallableStatement cst = Conexion.getConexion().prepareCall("{call listarProductos()}");
            rs = cst.executeQuery();
        } catch (Exception e) {
            System.err.println(e.toString());
        }
        return rs;
    }
    
    public static int agregarDonacion(int codcasa,int codusu){
        int resultado=0;
        try {
            CallableStatement cst = Conexion.getConexion().prepareCall("{call agregarDonacion(?,?)}");
            cst.setInt(1, codcasa);
            cst.setInt(2, codusu);
            resultado = cst.executeUpdate();
        } catch (Exception e) {
            System.err.println(e.toString());
        }
        return resultado;
    }
    
    public static int agregarDetalleDonacion(int codprod,int cantidad){
        int resultado=0;
        try {
            CallableStatement cst = Conexion.getConexion().prepareCall("{call agregarDetalleDonacion(?,?)}");
            cst.setInt(1, codprod);
            cst.setInt(2, cantidad);
            resultado = cst.executeUpdate();
        } catch (Exception e) {
            System.err.println(e.toString());
        }
        return resultado;
    }
    
    public List<DTOCASAREFUGIO> readAllCasaRefugio() throws SQLException {
         CallableStatement cst;
         List<DTOCASAREFUGIO> casa = new ArrayList<>();
         ResultSet res;
        
         try {
            cst = Conexion.getConexion().prepareCall("select cod_casa,nom_casa,dir_casa,tel_cont,CAST(DAY(fecha_reg) as varchar) + '-' + CAST(MONTH(fecha_reg) as varchar) + '-' + CAST(YEAR(fecha_reg) as varchar) as fecha_reg,estado_casa ,u.usuario from CasaRefugio cr inner join Usuario u on u.cod_usu = cr.cod_usu");
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
        public static ResultSet cantidadCasasRefugioRegistradaPor(int codigoUsuario){
        ResultSet rs = null;
        try {
            CallableStatement cst = Conexion.getConexion().prepareCall("{call cantidadCasasRefugioRegistradaPor(?)}");
            cst.setInt(1, codigoUsuario);
            rs = cst.executeQuery();
        } catch (Exception e) {
            System.err.println(e.toString());
        }
        return rs;
    }
}
