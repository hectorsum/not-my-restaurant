/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import datos.producto;
import java.util.ArrayList;
import static logica.L_Producto.Lproducto;

/**
 *
 * @author hecto
 */
public class L_Producto {
    public static ArrayList Lproducto  = new ArrayList();
    public static ArrayList Lcategoria  = new ArrayList();
    public static ArrayList Lsegundo  = new ArrayList();
    public static ArrayList Lentrada  = new ArrayList();
    private conexion con = new conexion();
    public void insertarProducto(producto temp){
        try{
            con.getSt().executeUpdate("EXEC insertProduct '"+temp.getNombre()+"',"+Float.parseFloat(temp.getPrecio())+","+Integer.parseInt(temp.getCategoria()));
        }catch(Exception e){
            System.out.println(e);
        }
    }
    public void modificarProducto(producto temp){
        try{
            con.consulta("UPDATE producto SET nom_pro='"+temp.getNombre()+"', pre_pro="+Float.parseFloat(temp.getPrecio())+",id_cat="+Integer.parseInt(temp.getCategoria())+" WHERE cod_pro="+temp.getCod());
            System.out.println("finished modifying");
        }catch(Exception e){
            System.out.println(e);
        }
    }
    public void eliminarProducto(producto temp){
        try{
            con.consulta("UPDATE PRODUCTO SET estado=0 WHERE cod_pro="+temp.getCod());
        }catch(Exception e){
            System.out.println(e);
        }
    }
    public void consultarCategoria(){
        con.consulta("select id_cat,des_cat from categoria");
        Lcategoria.clear();
        try {
           while (con.getRs().next()){
               producto temp=new producto(
                       con.getRs().getString("id_cat"),
                       con.getRs().getString("des_cat")
               ); 
               System.out.println(temp);
               Lcategoria.add(temp);
           }
       } catch (Exception e) {}
    }
    public void consultarSegundo(){
        con.consulta("SELECT producto.COD_PRO,producto.NOM_PRO\n" +
"FROM producto \n" +
"	LEFT JOIN categoria ON producto.id_cat = categoria.id_cat\n" +
"WHERE categoria.des_cat LIKE 'PLATO DE FONDO'");
        Lsegundo.clear();
        try {
           while (con.getRs().next()){
               producto temp=new producto(
                       con.getRs().getString("cod_pro"),
                       con.getRs().getString("nom_pro")
               ); 
               System.out.println(temp);
               Lsegundo.add(temp);
           }
       } catch (Exception e) {}
    }
    public void consultarEntrada(){
        con.consulta("SELECT producto.COD_PRO,producto.NOM_PRO\n" +
"FROM producto \n" +
"	LEFT JOIN categoria ON producto.id_cat = categoria.id_cat\n" +
"WHERE categoria.des_cat LIKE 'ENTRADA'");
        Lentrada.clear();
        try {
           while (con.getRs().next()){
               producto temp=new producto(
                       con.getRs().getString("cod_pro"),
                       con.getRs().getString("nom_pro")
               ); 
               System.out.println(temp);
               Lentrada.add(temp);
           }
       } catch (Exception e) {}
    }
    public void consultarProductos(){
        con.consulta("select * from V_PRODUCTO WHERE estado=1");
        Lproducto.clear();
        try {
           while (con.getRs().next()){
               //System.out.println(con.getRs().getString("curso"));
               producto temp=new producto(
                       con.getRs().getString("cod_pro")
                       ,con.getRs().getString("nom_pro")
                       ,con.getRs().getString("pre_pro")
                       ,con.getRs().getString("des_cat")
                       ); 
               System.out.println(temp);
               Lproducto.add(temp);
           }
       } catch (Exception e) {}
    }
}
