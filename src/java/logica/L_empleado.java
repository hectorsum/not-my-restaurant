/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import datos.empleado;
import java.util.ArrayList;

/**
 *
 * @author hecto
 */
public class L_empleado {
    public static ArrayList Lempleado  = new ArrayList();
    public static ArrayList Ldni  = new ArrayList();
    private conexion con = new conexion();
    public void insertarEmpleado(empleado temp){
        try{
            con.getSt().executeUpdate("INSERT INTO empleado(nom_emp,ape_emp,tip_doc,num_doc,dir_emp,tel_emp,ema_emp,car_emp) VALUES('"+temp.getNombre()+"','"+temp.getApellido()+"',"+Integer.parseInt(temp.getTipo_doc())+",'"+temp.getNum_doc()+"','"+temp.getDireccion()+"','"+temp.getTelf()+"','"+temp.getEmail()+"','"+temp.getCargo()+"')");
            
        }catch(Exception e){
            System.out.println(e);
        }
    }
    public void modificarEmpleado(empleado temp){
        try{
            System.out.println("start modifying");
            con.consulta("UPDATE empleado SET nom_emp='"+temp.getNombre()+"',ape_emp='"+temp.getApellido()+"',tip_doc='"+Integer.parseInt(temp.getTipo_doc())+"',num_doc='"+temp.getNum_doc()+"',dir_emp='"+temp.getDireccion()+"',tel_emp='"+temp.getTelf()+"',ema_emp='"+temp.getEmail()+"',car_emp='"+temp.getCargo()+"' WHERE id_emp="+temp.getCodigo());
            System.out.println("finished modifying");
        }catch(Exception e){
            System.out.println(e);
        }
    }
    public void eliminarEmpleado(empleado temp){
        try{
            con.consulta("UPDATE empleado SET estado=0 WHERE id_emp="+temp.getCodigo());
        }catch(Exception e){
            System.out.println(e);
        }
    }
    public void consultarDocumento(){
        con.consulta("select * from tipo_documento");
        Ldni.clear();
        try {
           while (con.getRs().next()){
               empleado temp=new empleado(
                       con.getRs().getString("id_tip_doc"),
                       con.getRs().getString("des_tip_doc")
               ); 
               System.out.println(temp);
               Ldni.add(temp);
           }
       } catch (Exception e) {}
    }
    public void consultarEmpleados(){
        con.consulta("SELECT * FROM V_EMPLEADO WHERE estado=1");
        System.out.println("after listing");
        Lempleado.clear();
        try {
           while (con.getRs().next()){
               //System.out.println(con.getRs().getString("curso"));
               empleado temp=new empleado(
                       con.getRs().getString("codigo")
                       ,con.getRs().getString("nombre")
                       ,con.getRs().getString("apellido")
                       ,con.getRs().getString("documento")
                       ,con.getRs().getString("numero")
                       ,con.getRs().getString("direccion")
                       ,con.getRs().getString("telefono")
                       ,con.getRs().getString("correo")
                       ,con.getRs().getString("cargo")
                       ); 
               System.out.println(temp);
               Lempleado.add(temp);
           }
       } catch (Exception e) {}
    }
}
