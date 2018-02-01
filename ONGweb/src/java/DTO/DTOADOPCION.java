package DTO;

public class DTOADOPCION extends DTOMASCOTA{
   
   private int cod_adop;
   private String fecha_solicitud, estado_adop,usu;
   private int cod_mascot;
    public DTOADOPCION() {
    }

    public DTOADOPCION(int cod_mas) {
        super(cod_mas);
    }

    public DTOADOPCION(int cod_adop, String fecha_solicitud, String estado_adop, String usu, String nom_mas, int cod_mas) {
        super(nom_mas);
        this.cod_adop = cod_adop;
        this.fecha_solicitud = fecha_solicitud;
        this.estado_adop = estado_adop;
        this.usu = usu;
        this.cod_mascot=cod_mas;
    }
    
    public int getCod_adop() {
        return cod_adop;
    }

    public void setCod_adop(int cod_adop) {
        this.cod_adop = cod_adop;
    }

    public String getFecha_solicitud() {
        return fecha_solicitud;
    }

    public void setFecha_solicitud(String fecha_solicitud) {
        this.fecha_solicitud = fecha_solicitud;
    }

    public String getEstado_adop() {
        return estado_adop;
    }

    public void setEstado_adop(String estado_adop) {
        this.estado_adop = estado_adop;
    }

    public String getUsu() {
        return usu;
    }

    public void setUsu(String usu) {
        this.usu = usu;
    }

    public int getCod_mascot() {
        return cod_mascot;
    }

    public void setCod_mascot(int cod_mascot) {
        this.cod_mascot = cod_mascot;
    }
   
}
