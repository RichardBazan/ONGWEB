package DTO;

public class DTOCOMENTARIO extends DTOUSUARIO{

private int cod_com;
private String comentario;

    public DTOCOMENTARIO() {
    }

    public DTOCOMENTARIO(int cod_com) {
        this.cod_com = cod_com;
    }

    public DTOCOMENTARIO(String usuario, String comentario) {
        super(usuario);
        this.comentario = comentario;
    }
    
    public int getCod_com() {
        return cod_com;
    }

    public void setCod_com(int cod_com) {
        this.cod_com = cod_com;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
}
