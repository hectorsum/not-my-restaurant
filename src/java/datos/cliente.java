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
public class cliente {
    String codigo;
    String nombre;
    String apellido;
    String tipo_doc;
    String num_doc;
    String direccion;
    String telf;
    String email;

    public cliente() {
    }
    
    public cliente(String codigo) {
        this.codigo = codigo;
    }
    
    public cliente(String codigo,String tipo_doc) {
        this.codigo = codigo;
        this.tipo_doc = tipo_doc;
    }
    
    public cliente(String nombre, String apellido, String tipo_doc, String num_doc, String direccion, String telf, String email) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.tipo_doc = tipo_doc;
        this.num_doc = num_doc;
        this.direccion = direccion;
        this.telf = telf;
        this.email = email;
    }
    
    public cliente(String codigo, String nombre, String apellido, String tipo_doc, String num_doc, String direccion, String telf, String email) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.apellido = apellido;
        this.tipo_doc = tipo_doc;
        this.num_doc = num_doc;
        this.direccion = direccion;
        this.telf = telf;
        this.email = email;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getTipo_doc() {
        return tipo_doc;
    }

    public void setTipo_doc(String tipo_doc) {
        this.tipo_doc = tipo_doc;
    }

    public String getNum_doc() {
        return num_doc;
    }

    public void setNum_doc(String num_doc) {
        this.num_doc = num_doc;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelf() {
        return telf;
    }

    public void setTelf(String telf) {
        this.telf = telf;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "cliente{" + "codigo=" + codigo + ", nombre=" + nombre + ", apellido=" + apellido + ", tipo_doc=" + tipo_doc + ", num_doc=" + num_doc + ", direccion=" + direccion + ", telf=" + telf + ", email=" + email + '}';
    }
    
}