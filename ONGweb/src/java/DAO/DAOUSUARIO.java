package DAO;
import DTO.DTOUSUARIO;
import java.sql.*;
import javax.swing.JOptionPane;
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
        } catch (Exception e) {
        JOptionPane.showMessageDialog(null,e.toString());
        }
    return res;
    }
    


}
    
/*
@nombre varchar(50), @apellido_pat varchar(50), @apellido_mat varchar(50),
@fechaNacimiento date, @direccion varchar(50), @telefono varchar(50), @usuario varchar(50),
@contraseña nvarchar(50), @foto varchar(50)
*/