<%-- 
    Document   : index
  
    Author     : Naty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurante</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.22/b-1.6.5/b-html5-1.6.5/b-print-1.6.5/datatables.min.css"/>
        <link rel="stylesheet" href="styles/style.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a href="#" class="navbar-brand navbar-logo">
                <img src="images/logo.svg" alt="Logo Image">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">  
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
              <ul class="navbar-nav">
                  <form action="Menu_Principal.jsp">
                    <button type="submit" class="nav-link">Inicio</button>
                </form>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Usuario
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                      <form action="USUARIO/frmRegistrarUsuario.jsp" name="frmBusqueda_Libreta">
                            <button type="submit" class="dropdown-item">Registrar Usuario</button>
                        </form>
                      <form action="USUARIO/frmModificarUsuario.jsp" name="frmLista_Asistencias">
                            <button type="submit" class="dropdown-item">Modificar Usuario</button>
                        </form>
                      <form action="USUARIO/frmEliminarUsuario.jsp" name="frmHistorial_Academico">
                            <button type="submit" class="dropdown-item">Eliminar Usuario</button>
                        </form>
                  </div>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Empleado
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                      <form action="EMPLEADO/frmRegistrarEmpleado.jsp" name="frmBusqueda_Libreta">
                            <button type="submit" class="dropdown-item">Registrar Empleado</button>
                        </form>
                      <form action="EMPLEADO/frmModificarEmpleado.jsp" name="frmLista_Asistencias">
                            <button type="submit" class="dropdown-item">Modificar Empleado</button>
                        </form>
                      <form action="EMPLEADO/frmEliminarEmpleado.jsp" name="frmHistorial_Academico">
                            <button type="submit" class="dropdown-item">Eliminar Empleado</button>
                        </form>
                  </div>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Cliente
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                      <form action="CLIENTE/frmRegistrarCliente.jsp" name="frmBusqueda_Libreta">
                            <button type="submit" class="dropdown-item">Registrar Cliente</button>
                        </form>
                      <form action="CLIENTE/frmModificarCliente.jsp" name="frmLista_Asistencias">
                            <button type="submit" class="dropdown-item">Modificar Cliente</button>
                        </form>
                      <form action="CLIENTE/frmEliminarCliente.jsp" name="frmHistorial_Academico">
                            <button type="submit" class="dropdown-item">Eliminar Cliente</button>
                        </form>
                  </div>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Producto
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                      <form action="PRODUCTO/frmRegistrarProducto.jsp">
                            <button type="submit" class="dropdown-item">Registrar Producto</button>
                        </form>
                      <form action="PRODUCTO/frmModificarProducto.jsp">
                            <button type="submit" class="dropdown-item">Modificar Producto</button>
                        </form>
                      <form action="PRODUCTO/frmEliminarProducto.jsp">
                            <button type="submit" class="dropdown-item">Eliminar Producto</button>
                        </form>
                  </div>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Venta
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                      <form action="VENTA/frmRegistrarVenta.jsp">
                            <button type="submit" class="dropdown-item">Registrar Venta</button>
                        </form>
                      <form action="VENTA/frmEliminarVenta.jsp">
                            <button type="submit" class="dropdown-item">Eliminar Venta</button>
                        </form>
                  </div>
                </li>
              </ul>
            </div>
          </nav>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </body>
</html>
