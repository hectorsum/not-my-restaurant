/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import datos.cliente;
import java.util.ArrayList;

/**
 *
 * @author hecto
 */
public class L_Cliente {
    public static ArrayList Lcliente  = new ArrayList();
    public static ArrayList Ldni  = new ArrayList();
    private conexion con = new conexion();
    public void insertarCliente(cliente temp){
        try{
            con.getSt().executeUpdate("INSERT INTO cliente(nom_cli,ape_cli,id_tip_doc,num_doc,dir_cli,tel_cli,ema_cli) VALUES('"+temp.getNombre()+"','"+temp.getApellido()+"',"+Integer.parseInt(temp.getTipo_doc())+",'"+temp.getNum_doc()+"','"+temp.getDireccion()+"','"+temp.getTelf()+"','"+temp.getEmail()+"')");
            
        }catch(Exception e){
            System.out.println(e);
        }
    }
    public void modificarCliente(cliente temp){
        try{
            System.out.println("start modifying");
            con.consulta("UPDATE cliente SET nom_cli='"+temp.getNombre()+"',ape_cli='"+temp.getApellido()+"',id_tip_doc='"+Integer.parseInt(temp.getTipo_doc())+"',num_doc='"+temp.getNum_doc()+"',dir_cli='"+temp.getDireccion()+"',tel_cli='"+temp.getTelf()+"',ema_cli='"+temp.getEmail()+"'"+" WHERE id_cli="+temp.getCodigo());
            System.out.println("finished modifying");
        }catch(Exception e){
            System.out.println(e);
        }
    }
    public void eliminarCliente(cliente temp){
        try{
            con.consulta("UPDATE cliente SET estado=0 WHERE id_cli="+temp.getCodigo());
        }catch(Exception e){
            System.out.println(e);
        }
    }
    public void consultarDocumento(){
        con.consulta("select * from tipo_documento");
        Ldni.clear();
        try {
           while (con.getRs().next()){
               cliente temp=new cliente(
                       con.getRs().getString("id_tip_doc"),
                       con.getRs().getString("des_tip_doc")
               ); 
               System.out.println(temp);
               Ldni.add(temp);
           }
       } catch (Exception e) {}
    }
    public void consultarClientes(){
        con.consulta("SELECT * FROM V_CLIENTE WHERE estado=1");
        Lcliente.clear();
        try {
           while (con.getRs().next()){
               //System.out.println(con.getRs().getString("curso"));
               cliente temp=new cliente(
                       con.getRs().getString("codigo")
                       ,con.getRs().getString("nombre")
                       ,con.getRs().getString("apellido")
                       ,con.getRs().getString("tipo de documento")
                       ,con.getRs().getString("documento")
                       ,con.getRs().getString("direccion")
                       ,con.getRs().getString("telefono")
                       ,con.getRs().getString("correo")
                       ); 
               System.out.println(temp);
               Lcliente.add(temp);
           }
       } catch (Exception e) {}
    }
}
