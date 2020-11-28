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
public class usuario {
    String cod;
    String username;
    String pass;
    String empleado_nombre;
    String empleado_apell;

    public usuario() {
    }
    
    public usuario(String cod) {
        this.cod = cod;
    }
    
    public usuario(String cod, String username, String pass) {
        this.cod = cod;
        this.username = username;
        this.pass = pass;
    }
    
    public usuario(String username, String pass) {
        this.username = username;
        this.pass = pass;
    }
    
    public usuario(String cod,String username, String pass, String empleado_nombre, String empleado_apell) {
        this.cod = cod;
        this.username = username;
        this.pass = pass;
        this.empleado_nombre = empleado_nombre;
        this.empleado_apell = empleado_apell;
    }
    
    public String getCod() {
        return cod;
    }

    public void setCod(String cod) {
        this.cod = cod;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getEmpleado_nombre() {
        return empleado_nombre;
    }

    public void setEmpleado_nombre(String empleado_nombre) {
        this.empleado_nombre = empleado_nombre;
    }

    public String getEmpleado_apell() {
        return empleado_apell;
    }

    public void setEmpleado_apell(String empleado_apell) {
        this.empleado_apell = empleado_apell;
    }
        
}
