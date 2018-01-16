package DTO;

public class DTODONACIONES extends DTOCASAREFUGIO {

    private int cod_donacion;
    private String estado_donacion;

    public DTODONACIONES() {
    }

    public DTODONACIONES(int cod_donacion, String usuario, String nombre, String estado_donacion) {
        super(usuario, nombre);
        this.cod_donacion = cod_donacion;
        this.estado_donacion = estado_donacion;
    }

    public int getCod_donacion() {
        return cod_donacion;
    }

    public void setCod_donacion(int cod_donacion) {
        this.cod_donacion = cod_donacion;
    }

    public String getEstado_donacion() {
        return estado_donacion;
    }

    public void setEstado_donacion(String estado_donacion) {
        this.estado_donacion = estado_donacion;
    }
}
