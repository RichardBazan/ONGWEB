package DAO;
import DTO.DTOUSUARIO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.codec.digest.DigestUtils;
public class DAOUSUARIO {
    
    public static int agregarNuevoUsuario(DTOUSUARIO dtousuario){
    int res = 0;
    try {
        CallableStatement cst = Conexion.getConexion().prepareCall("{call agregarUsuarioNuevo(?,?,?,?,?,?,?,?,?)}");
        cst.setString(1,dtousuario.getNombre());
        cst.setString(2,dtousuario.getApellido_pat());
        cst.setString(3,dtousuario.getApellido_mat());
        cst.setString(4,dtousuario.getFechaNacimiento());
        cst.setString(5,dtousuario.getDireccion());
        cst.setString(6,dtousuario.getTelefono());
        cst.setString(7,dtousuario.getUsuario());
        cst.setString(8,dtousuario.getContraseña());
        cst.setString(9,dtousuario.getFoto());
        res = cst.executeUpdate();
        } catch (SQLException e) {
        System.err.println(e.toString());;
        }
    return res;
    }
    
    public static DTOUSUARIO buscarUsuario(String usuario,String contraseña){
        ResultSet rs = null;
        DTOUSUARIO user = null;
        try {
            CallableStatement cst = Conexion.getConexion().prepareCall("{call buscarUsuario(?,?)}");
            cst.setString(1, usuario);
            cst.setString(2, contraseña);
            rs = cst.executeQuery();
            if (rs.next()){
                user = new DTOUSUARIO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10));
            }              
        } catch (SQLException e) {
        System.err.println(e.toString());;
        }
        return user;
    }
    
    public static String encriptarContraseña(String contraseña){
        String encriptado=null;
        try {
            encriptado = DigestUtils.md5Hex(contraseña);       
        } catch (NullPointerException e) {
            System.out.println(e.toString());
        }
        return encriptado;
    }
    
    //sp_agregarUsuario
    public static int agregarUsuario(DTOUSUARIO dtousuario){
        int res = 0;
    try {
        CallableStatement cst = Conexion.getConexion().prepareCall("{call sp_agregarUsuario(?,?,?,?,?,?,?,?,?)}");
        cst.setString(1,dtousuario.getNombre());
        cst.setString(2,dtousuario.getApellido_pat());
        cst.setString(3,dtousuario.getApellido_mat());
        cst.setString(4,dtousuario.getFechaNacimiento());
        cst.setString(5,dtousuario.getDireccion());
        cst.setString(6,dtousuario.getTelefono());
        cst.setString(7,dtousuario.getUsuario());
        cst.setString(8,dtousuario.getContraseña());
        cst.setString(9,dtousuario.getFoto());
        res = cst.executeUpdate();
        } catch (SQLException e) {
        System.err.println(e.toString());;
        }
    return res;
    }
    
//select nom_usu, ape_pat + ' ' + ape_mat as apellidos,CAST(DAY(fecha_nac) as varchar) + '-' + CAST(MONTH(fecha_nac) as varchar) + '-' + CAST(YEAR(fecha_nac) as varchar) as fecha_nac,dir_usu,tel_usu,usuario,foto_usu from Usuario

      public List<DTOUSUARIO> readAll() throws SQLException {
         CallableStatement cst;
         List<DTOUSUARIO> usu = new ArrayList<>();
         ResultSet res;
        
         try {
            cst = Conexion.getConexion().prepareCall("select nom_usu, ape_pat, ape_mat, CAST(DAY(fecha_nac) as varchar) + '-' + CAST(MONTH(fecha_nac) as varchar) + '-' + CAST(YEAR(fecha_nac) as varchar) as fecha_nac,dir_usu,tel_usu,usuario,pertenencia,foto_usu from Usuario");
            res = cst.executeQuery();
            
            while(res.next()){
               usu.add(new DTOUSUARIO(res.getString(1),res.getString(2), res.getString(3),res.getString(4),res.getString(5), res.getString(6), res.getString(7), res.getString(8),res.getString(9)));
            }

         } catch (SQLException ex) {
            Logger.getLogger(DTOUSUARIO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             Conexion.getConexion().close();
         }
         return usu;
     }
}
/*
@nombre varchar(50), @apellido_pat varchar(50), @apellido_mat varchar(50),
@fechaNacimiento date, @direccion varchar(50), @telefono varchar(50), @usuario varchar(50),
@contraseña nvarchar(50), @foto varchar(50)
*/
