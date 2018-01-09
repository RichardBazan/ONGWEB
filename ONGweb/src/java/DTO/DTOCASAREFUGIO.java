package DTO;

public class DTOCASAREFUGIO extends DTOUSUARIO {
    
    private int codigocasa;
    private String nombre,direccion,telefono;
    private String descripcion;
    private String fechaRegistro;
    private int codigoUsuario;
    
    private int cod_casa;
    private String nom_casa,dir_casa,tel_cont,fecha_reg,estado_casa;
    
    public DTOCASAREFUGIO() {
    }

    public DTOCASAREFUGIO(int codigo, String nombre, String direccion, String telefono, String descripcion, String fechaRegistro, int codigoUsuario) {
        this.codigocasa = codigo;
        this.nombre = nombre;
        this.direccion = direccion;
        this.telefono = telefono;
        this.descripcion = descripcion;
        this.fechaRegistro = fechaRegistro;
        this.codigoUsuario = codigoUsuario;
    }
    
    public DTOCASAREFUGIO(int cod_casa, String nom_casa, String dir_casa, String tel_cont, String fecha_reg, String estado_casa, String usuario) {
        super(usuario);
        this.cod_casa = cod_casa;
        this.nom_casa = nom_casa;
        this.dir_casa = dir_casa;
        this.tel_cont = tel_cont;
        this.fecha_reg = fecha_reg;
        this.estado_casa = estado_casa;
    }

    public int getCodigoCasa() {
        return codigocasa;
    }

    public void setCodigoCasa(int codigo) {
        this.codigocasa = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(String fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public int getCodigoUsuario() {
        return codigoUsuario;
    }

    public void setCodigoUsuario(int codigoUsuario) {
        this.codigoUsuario = codigoUsuario;
    }
     public int getCod_casa() {
        return cod_casa;
    }

    public void setCod_casa(int cod_casa) {
        this.cod_casa = cod_casa;
    }

    public String getNom_casa() {
        return nom_casa;
    }

    public void setNom_casa(String nom_casa) {
        this.nom_casa = nom_casa;
    }

    public String getDir_casa() {
        return dir_casa;
    }

    public void setDir_casa(String dir_casa) {
        this.dir_casa = dir_casa;
    }

    public String getTel_cont() {
        return tel_cont;
    }

    public void setTel_cont(String tel_cont) {
        this.tel_cont = tel_cont;
    }

    public String getFecha_reg() {
        return fecha_reg;
    }

    public void setFecha_reg(String fecha_reg) {
        this.fecha_reg = fecha_reg;
    }

    public String getEstado_casa() {
        return estado_casa;
    }

    public void setEstado_casa(String estado_casa) {
        this.estado_casa = estado_casa;
    }
}
