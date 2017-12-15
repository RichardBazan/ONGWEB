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
}

/*
create proc agregarCasaRefugio
@nombre varchar(50),@direccion varchar(50),@telefono varchar(50),@descripcion varchar(max),@codigoUsuario int
as
begin
insert into CasaRefugio values (@nombre,@direccion,@telefono,@descripcion,GETDATE(),@codigoUsuario)
end
go
*/