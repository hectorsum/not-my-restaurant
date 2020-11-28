/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import datos.usuario;
import java.util.ArrayList;

/**
 *
 * @author hecto
 */
public class L_usuario {
    private conexion con = new conexion();
    public static ArrayList Luser  = new ArrayList();
    public void insertUsuario(usuario temp){
        try{
            System.out.println("begin inserting");
            con.getSt().executeUpdate("EXEC insertUsuario "+Integer.parseInt(temp.getCod())+",'"+temp.getUsername()+"','"+temp.getPass()+"'");
            System.out.println("finished inserting user");
        }catch(Exception e){
            System.out.println(e);
        }
    }
    public void updateUsuario(usuario temp){
        try{
            con.getSt().executeUpdate("UPDATE usuario SET username='"+temp.getUsername()+"',pass='"+temp.getPass()+"' WHERE id_emp="+temp.getCod());
        }catch(Exception e){
            System.out.println(e);
        }
    }
    public void deleteUsuario(usuario temp){
        try{
            con.getSt().executeUpdate("EXEC deleteUsuario "+Integer.parseInt(temp.getCod()));
        }catch(Exception e){
            System.out.println(e);
        }
    }
    public boolean consultarUsuario(usuario temp){
        con.consulta("SELECT * FROM USUARIO WHERE username='"+temp.getUsername()+"' and pass='"+temp.getPass()+"' and estado=1");
        Luser.clear();
        try{
            while (con.getRs().next()){
                usuario temp2 = new usuario(
                        con.getRs().getString("username"),
                        con.getRs().getString("pass"));
                Luser.add(temp2);
                return true;
            }
            return false;
        }catch(Exception e){
            System.out.println(e);
            return false;
        }
    }
    public void listarUsuarios(){
        con.consulta("SELECT * FROM listarUsuarios WHERE estado=1");
        System.out.println("after listing users");
        Luser.clear();
        try {
           while (con.getRs().next()){
               usuario temp=new usuario(
                       con.getRs().getString("id_emp")
                       ,con.getRs().getString("username")
                       ,con.getRs().getString("pass")
                       ,con.getRs().getString("nom_emp")
                       ,con.getRs().getString("ape_emp")
                       ); 
               System.out.println(temp);
               Luser.add(temp);
           }
        }catch(Exception e){
            System.out.println(e);
        }
    }
}
