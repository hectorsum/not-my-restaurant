<%-- 
    Document   : LoginCheck
    Created on : 27/11/2020, 06:21:56 PM
    Author     : hecto
--%>

<%@page import="logica.L_usuario"%>
<%@page import="datos.usuario"%>
<%@page import="logica.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
            
            usuario temp = new usuario();
            L_usuario con = new L_usuario();
            
            String username = request.getParameter("username");
            String pass = request.getParameter("pass");
            temp = new usuario(request.getParameter("username"),request.getParameter("pass"));

            if(con.consultarUsuario(temp)){
                response.sendRedirect("Menu_Principal.jsp");
            }else{
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
