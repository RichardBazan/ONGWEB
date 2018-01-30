package DTO;

public class DTOUSUARIO{

    private Integer codigo;
    private String nombre,apellidos,apellido_pat,apellido_mat,fechaNacimiento,direccion,telefono,usuario,contraseña,foto,pertenencia;

    public DTOUSUARIO() {
    }

    public DTOUSUARIO(int codigo) {
        this.codigo = codigo;
    }

    public DTOUSUARIO(String usuario) {
        this.usuario = usuario;
    }
    
    

    public DTOUSUARIO(Integer codigo, String nombre, String apellido_pat, String apellido_mat, String fechaNacimiento, String direccion, String telefono, String usuario, String contraseña, String foto, String pertenencia) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.apellido_pat = apellido_pat;
        this.apellido_mat = apellido_mat;
        this.fechaNacimiento = fechaNacimiento;
        this.direccion = direccion;
        this.telefono = telefono;
        this.usuario = usuario;
        this.contraseña = contraseña;
        this.foto = foto;
        this.pertenencia = pertenencia;
    }

    public DTOUSUARIO(String nombre,  String apellidos, String fechaNacimiento, String direccion, String telefono, String usuario, String pertenencia, String foto) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.fechaNacimiento = fechaNacimiento;
        this.direccion = direccion;
        this.telefono = telefono;
        this.usuario = usuario;
        this.pertenencia = pertenencia;
        this.foto = foto;
        
    }

    
    
    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido_pat() {
        return apellido_pat;
    }

    public void setApellido_pat(String apellido_pat) {
        this.apellido_pat = apellido_pat;
    }

    public String getApellido_mat() {
        return apellido_mat;
    }

    public void setApellido_mat(String apellido_mat) {
        this.apellido_mat = apellido_mat;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
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

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getPertenencia() {
        return pertenencia;
    }

    public void setPertenencia(String pertenencia) {
        this.pertenencia = pertenencia;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    
    
}
