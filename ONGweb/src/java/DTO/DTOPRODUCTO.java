package DTO;

public class DTOPRODUCTO extends DTODONACIONES{

    private int cantidad;
    private String producto;

    public DTOPRODUCTO() {
    }

    public DTOPRODUCTO(String producto, int cantidad) {
        this.cantidad = cantidad;
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    } 
}
