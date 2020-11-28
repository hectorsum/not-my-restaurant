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
public class venta {
    String codigo;
    String empleado;
    String cod_pro;
    String cantidad;
    String fecha;
    String total;
    public venta() {
    }
    public venta(String codigo) {
        this.codigo = codigo;
    }
    public venta(String codigo,String fecha, String empleado, String total) {
        this.codigo = codigo;
        this.fecha = fecha;
        this.empleado = empleado;
        this.total = total;
    }
    public venta(String cod_pro, String cantidad) {
        this.cod_pro = cod_pro;
        this.cantidad = cantidad;
    }
    public venta(String codigo, String empleado, String cod_pro, String cantidad, String total) {
        this.codigo = codigo;
        this.empleado = empleado;
        this.cod_pro = cod_pro;
        this.cantidad = cantidad;
        this.total = total;
    }
    
    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getEmpleado() {
        return empleado;
    }

    public void setEmpleado(String empleado) {
        this.empleado = empleado;
    }

    public String getCod_pro() {
        return cod_pro;
    }

    public void setCod_pro(String cod_pro) {
        this.cod_pro = cod_pro;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "venta{" + "codigo=" + codigo + ", empleado=" + empleado + ", cod_pro=" + cod_pro + ", cantidad=" + cantidad + ", total=" + total + '}';
    }
        
}
