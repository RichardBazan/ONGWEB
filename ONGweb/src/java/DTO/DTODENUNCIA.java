package DTO;

public class DTODENUNCIA extends DTORAZA{
    
    private String titulo_den, dir_den, tel_cont,descrip_den,foto_den,fecha_reg,estado_den;
    private int cod_den;

    public DTODENUNCIA() {
    }

    public DTODENUNCIA(int cod_den) {
        this.cod_den = cod_den;
    }

    //String dir_den, String tel_cont, String fecha_reg, String estado_den, int codigo, int cod_raza

    public DTODENUNCIA(int cod_den, String titulo_den, String tel_cont, String fecha_reg, String nom_raza,String estado_den,  String usuario) {
        super(nom_raza, usuario);
        this.titulo_den = titulo_den;
        this.tel_cont = tel_cont;
        this.fecha_reg = fecha_reg;
        this.estado_den = estado_den;
        this.cod_den = cod_den;
    }
    
    
    
    public DTODENUNCIA(String titulo_den, String dir_den, String tel_cont, String descrip_den, int cod_raza) {
        super(cod_raza);
        this.titulo_den = titulo_den;
        this.dir_den = dir_den;
        this.tel_cont = tel_cont;
        this.descrip_den = descrip_den;
    }

    public DTODENUNCIA(int cod_den, String titulo_den, String descrip_den) {
        this.titulo_den = titulo_den;
        this.descrip_den = descrip_den;
        this.cod_den = cod_den;
    }

    public DTODENUNCIA(String foto_den) {
        this.foto_den = foto_den;
    }

    public DTODENUNCIA(String titulo_den, String descrip_den, String nom_raza) {
        super(nom_raza);
        this.titulo_den = titulo_den;
        this.descrip_den = descrip_den;
    }

    public String getTitulo_den() {
        return titulo_den;
    }

    public void setTitulo_den(String titulo_den) {
        this.titulo_den = titulo_den;
    }

    public String getDir_den() {
        return dir_den;
    }

    public void setDir_den(String dir_den) {
        this.dir_den = dir_den;
    }

    public String getTel_cont() {
        return tel_cont;
    }

    public void setTel_cont(String tel_cont) {
        this.tel_cont = tel_cont;
    }

    public String getDescrip_den() {
        return descrip_den;
    }

    public void setDescrip_den(String descrip_den) {
        this.descrip_den = descrip_den;
    }

    public int getCod_den() {
        return cod_den;
    }

    public void setCod_den(int cod_den) {
        this.cod_den = cod_den;
    }

    public String getFoto_den() {
        return foto_den;
    }

    public void setFoto_den(String foto_den) {
        this.foto_den = foto_den;
    } 

    public String getFecha_reg() {
        return fecha_reg;
    }

    public void setFecha_reg(String fecha_reg) {
        this.fecha_reg = fecha_reg;
    }

    public String getEstado_den() {
        return estado_den;
    }

    public void setEstado_den(String estado_den) {
        this.estado_den = estado_den;
    }
}
