/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datos;

/**
 *
 * @author hecto
 */
public class producto {
    String cod;
    String nombre;
    String precio;
    String categoria;

    public producto() {
    }
    public producto(String cod) {
        this.cod = cod;
    }
    public producto(String cod,String categoria) {
        this.cod = cod;
        this.categoria = categoria;
    }
    public producto(String nombre, String precio, String categoria) {
        this.nombre = nombre;
        this.precio = precio;
        this.categoria = categoria;
    }
    public producto(String cod, String nombre, String precio, String categoria) {
        this.cod = cod;
        this.nombre = nombre;
        this.precio = precio;
        this.categoria = categoria;
    }

    public String getCod() {
        return cod;
    }

    public void setCod(String cod) {
        this.cod = cod;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    @Override
    public String toString() {
        return "producto{" + "cod=" + cod + ", nombre=" + nombre + ", precio=" + precio + ", categoria=" + categoria + '}';
    }
    
}
