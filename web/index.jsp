<%-- 
    Document   : index
  
    Author     : Naty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.22/b-1.6.5/b-html5-1.6.5/b-print-1.6.5/datatables.min.css"/>
        <link rel="stylesheet" href="styles/style.css">
    </head>
    <body>
<div class="login-wrapper">
  <div class="login-section">
    <div class="title">
      Intranet
    </div>
    <form action="LoginCheck.jsp" method="POST">
        <div class="login-inputs">
          <div class="input-data">
              <input type="text" name="username" autocomplete="off" required>
            <div class="underline"></div>
                <label>Usuario</label>
            </div>
            <div class="input-data">
              <input type="password" name="pass" required>
              <div class="underline"></div>
              <label>Contraseña</label>
            </div>
            <button class="btn btn-success btn-block">Ingresar</button>
            <div class="text-olvido">
              <a href="#">¿Olvidaste tu contraseña?</a>
            </div>
            </div>
          </form>
        </div>
      </div>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
    integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous">
    </script> 
    </body>
</html>
