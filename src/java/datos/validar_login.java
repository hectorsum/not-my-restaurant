/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datos;

import java.util.ArrayList;
import logica.conexion;

/**
 *
 * @author hecto
 */
public class validar_login {
    String user;
    String pass;

    public validar_login() {
    }

    public validar_login(String user, String pass) {
        this.user = user;
        this.pass = pass;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    @Override
    public String toString() {
        return "validar_login{" + "user=" + user + ", pass=" + pass + '}';
    }
}
