package DTO;

public class DTOMASCOTA extends DTORAZA{

 private String nom_mas,sexo_mas,edad_mas,descrip_mas,estado_mas,tendencia_mas;
 private int cod_mas;

    public DTOMASCOTA() {
    }

    public DTOMASCOTA(int cod_mas, String nom_mas, String sexo_mas, String edad_mas, String descrip_mas, String estado_mas, String tendencia_mas, int cod_raza) {
        super(cod_raza);
        this.nom_mas = nom_mas;
        this.sexo_mas = sexo_mas;
        this.edad_mas = edad_mas;
        this.descrip_mas = descrip_mas;
        this.estado_mas = estado_mas;
        this.tendencia_mas = tendencia_mas;
        this.cod_mas = cod_mas;
    }

    public DTOMASCOTA(int cod_mas, String nom_mas, String descrip_mas) {
        this.cod_mas = cod_mas;
        this.nom_mas = nom_mas;
        this.descrip_mas = descrip_mas;
    }
    
    public DTOMASCOTA(String nom_mas, String descrip_mas) {
        this.nom_mas = nom_mas;
        this.descrip_mas = descrip_mas;
    }

    public DTOMASCOTA(String nom_mas, String descrip_mas, String nom_raza) {
        super(nom_raza);
        this.nom_mas = nom_mas;
        this.descrip_mas = descrip_mas;
    }
    
    public String getNom_mas() {
        return nom_mas;
    }

    public void setNom_mas(String nom_mas) {
        this.nom_mas = nom_mas;
    }

    public String getSexo_mas() {
        return sexo_mas;
    }

    public void setSexo_mas(String sexo_mas) {
        this.sexo_mas = sexo_mas;
    }

    public String getDescrip_mas() {
        return descrip_mas;
    }

    public void setDescrip_mas(String descrip_mas) {
        this.descrip_mas = descrip_mas;
    }

    public String getEstado_mas() {
        return estado_mas;
    }

    public void setEstado_mas(String estado_mas) {
        this.estado_mas = estado_mas;
    }

    public String getTendencia_mas() {
        return tendencia_mas;
    }

    public void setTendencia_mas(String tendencia_mas) {
        this.tendencia_mas = tendencia_mas;
    }

    public int getCod_mas() {
        return cod_mas;
    }

    public void setCod_mas(int cod_mas) {
        this.cod_mas = cod_mas;
    }

    public String getEdad_mas() {
        return edad_mas;
    }

    public void setEdad_mas(String edad_mas) {
        this.edad_mas = edad_mas;
    }
}
