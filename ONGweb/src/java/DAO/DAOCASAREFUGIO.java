package DAO;

import java.sql.*;
import DTO.DTOCASAREFUGIO;

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
}