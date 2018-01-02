package DTO;

public class DTORAZA extends DTOUSUARIO{

 private int cod_raza;
 private String nom_raza;

    public DTORAZA() {
    }
    
    

    public DTORAZA(String nom_raza, String usuario) {
        super(usuario);
        this.nom_raza = nom_raza;
    }
    
    public DTORAZA(int cod_raza) {
        this.cod_raza = cod_raza;
    }

    public DTORAZA(String nom_raza) {
        this.nom_raza = nom_raza;
    }

    public DTORAZA(int cod_raza, String nom_raza) {
        this.cod_raza = cod_raza;
        this.nom_raza = nom_raza;
    }

    public String getNom_raza() {
        return nom_raza;
    }

    public void setNom_raza(String nom_raza) {
        this.nom_raza = nom_raza;
    }

    public int getCod_raza() {
        return cod_raza;
    }

    public void setCod_raza(int cod_raza) {
        this.cod_raza = cod_raza;
    }
 
 
}
