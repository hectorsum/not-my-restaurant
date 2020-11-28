/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import datos.empleado;
import datos.venta;
import java.util.ArrayList;

/**
 *
 * @author hecto
 */
public class L_venta {
    public static ArrayList Lventa  = new ArrayList();
    public static ArrayList Lentrada  = new ArrayList();
    public static ArrayList Lsegundo  = new ArrayList();
    private conexion con = new conexion();
    public void insertarVenta(venta temp){
        try{
            System.out.println("begin inserting");
            con.getSt().executeUpdate("EXEC insertVenta '"+temp.getCod_pro()+"',"+Integer.parseInt(temp.getCantidad()));            System.out.println("inserted");
        }catch(Exception e){
            System.out.println(e);
        }
    }
    public void modificarVenta(venta temp){
//        try{
//            System.out.println("start modifying");
//            con.consulta("UPDATE empleado SET nom_emp='"+temp.getNombre()+"',ape_emp='"+temp.getApellido()+"',tip_doc='"+Integer.parseInt(temp.getTipo_doc())+"',num_doc='"+temp.getNum_doc()+"',dir_emp='"+temp.getDireccion()+"',tel_emp='"+temp.getTelf()+"',ema_emp='"+temp.getEmail()+"',car_emp='"+temp.getCargo()+"' WHERE id_emp="+temp.getCodigo());
//            System.out.println("finished modifying");
//        }catch(Exception e){
//            System.out.println(e);
//        }
    }
    public void eliminarVenta(venta temp){
        try{
            System.out.println("begin deleting");
            con.consulta("UPDATE ventas SET estado=0 WHERE cod_ven="+temp.getCodigo());
            System.out.println("finished deleting");
        }catch(Exception e){
            System.out.println(e);
        }
    }
    public void consultarVenta(){
        con.consulta("SELECT * FROM v_ventas WHERE estado=1");
        System.out.println("after listing");
        Lventa.clear();
        try {
           while (con.getRs().next()){
               //System.out.println(con.getRs().getString("curso"));
               venta temp=new venta(
                       con.getRs().getString("cod_ven")
                       ,con.getRs().getString("fec_ven")
                       ,con.getRs().getString("nom_emp")
                       ,con.getRs().getString("total")
                       ); 
               System.out.println(temp);
               Lventa.add(temp);
           }
       } catch (Exception e) {}
    }
}
