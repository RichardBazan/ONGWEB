package DTO;

public class DTODARADOPCION extends DTOMASCOTA{
       
   private int cod_dar_adop;
   private String foto;

    public DTODARADOPCION() {
    }

    public DTODARADOPCION(int cod_dar_adop) {
        this.cod_dar_adop = cod_dar_adop;
    }

    public DTODARADOPCION(int cod_dar_adop,  String nom_mas, String descrip_mas) {
        super(nom_mas, descrip_mas);
        this.cod_dar_adop = cod_dar_adop;
    }

    public DTODARADOPCION(String foto) {
        this.foto = foto;
    }
    
    public DTODARADOPCION(String nom_mas, String descrip_mas, String nom_raza) {
        super(nom_mas, descrip_mas, nom_raza);
    }   
    
    public int getCod_dar_adop() {
        return cod_dar_adop;
    }

    public void setCod_dar_adop(int cod_dar_adop) {
        this.cod_dar_adop = cod_dar_adop;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
}
