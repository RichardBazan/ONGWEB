package DAO;
import DTO.DTOUSUARIO;
import java.sql.*;
import java.util.Calendar;
import org.apache.commons.codec.digest.DigestUtils;

public class Prueba {
    public static void main(String[] args) {
  
//        Conexion.getConexion();
;
        
//        try {
//            ResultSet rs = DAOCASAREFUGIO.detalleDonacion(18);
//            while (rs.next()){
//                System.out.println(rs.getString(2));
//            }
//        } catch (Exception e) {
//            System.out.println(e.toString());
//        }
        
        //DAOCASAREFUGIO.agregarDetalleDonacion(4,1,100);
        
        /*
        String aux = "HOl@";
        String encrip = DigestUtils.md5Hex(aux);
        String aux2 = "Holit@s";
        String encrip2 = DigestUtils.md5Hex(aux2);
        String aux3 = DAOUSUARIO.encriptarContraseña("HOl@");
        System.out.println(encrip+"-->"+encrip2+"-->"+aux3);
        
        
        
        /*
        int longt = aux.length();
        
        
        for (int i=0;i<=longt-1;i++){
            System.out.println(aux.substring(i,i+1));
        }
        
        /*
        Calendar calendario = Calendar.getInstance();
           int min = calendario.get(Calendar.MINUTE);
        System.out.println(min);
        /*
        try {
            DTOUSUARIO usuario = DAOUSUARIO.buscarUsuario("a","aa");
            if(usuario!=null){
                System.out.println(usuario.getNombre());
            }else{
                System.out.print(usuario);
            }
            
        } catch (Exception e) {
        }
  /*
        DTOKBCRACOMPROBANTALMACN dto = new DTOKBCRACOMPROBANTALMACN();
        dto.setNrodoc(12345);
        dto.setTipodoc("B");
        dto.setCodproveedor(1);
        dto.setFecha("2017-11-03");
        dto.setMotivo("jajaja");
        dto.setObservaciones("jejeje");
        dto.setEstado(1);
        dto.setTotal(400);
        
        int res = DAOKBCRACOMPROBANTALMACN.AgregarKbcraComprobantAlmacn(dto);
        System.out.println(res);
        
        */
        
        /*
        DTODTALLECOMPROBANTALMCN DTO = new DTODTALLECOMPROBANTALMCN(1234567,1,30,2);
        int res = DAODTALLECOMPROBANTALMACN.agregarDtalleComprobantAlmacn(DTO);
        System.out.println(res);
                */
    }
    
}
