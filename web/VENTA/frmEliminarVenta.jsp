<%-- 
    Document   : frmPRODUCTO

    Author     : Naty
--%>

<%@page import="logica.L_venta"%>
<%@page import="datos.venta"%>
<%@page import="datos.empleado"%>
<%@page import="logica.L_empleado"%>
<%@page import="logica.L_Producto"%>
<%@page import="datos.producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Empleado</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.22/b-1.6.5/b-html5-1.6.5/b-print-1.6.5/datatables.min.css"/>
        <link rel="stylesheet" href="styles/style.css">
    </head>
    <body class="container w-50">
        <form action="frmEliminarVenta.jsp" method="POST" class="w-100">
            <%
                venta temp_ven = new venta();
                L_venta con_ven = new L_venta();
        %>
        <label for="codigo">Codigo</label>
        <input type="number" class="form-control mb-2" name="codigo" id="codigo" autocomplete="off">
        <button type="submit" class="btn btn-danger btn-block mb-1" name="btnEliminar">Eliminar</button>
        </form>
        <form action="Menu_Principal.jsp" class="w-100">
            <button type="submit" class="btn btn-secondary btn-block mb-2" name="btnRegistrar">Volver</button>
        </form>
        <%
            if(request.getParameter("btnEliminar")!=null){
                temp_ven = new venta(request.getParameter("codigo"));
                con_ven.eliminarVenta(temp_ven);
            }
        %>
        <div style="background-color: transparent; width: 100%;">
    <ul class="nav nav-pills mb-3" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" href="#tab-table1" data-toggle="tab">Ventas</a>
      </li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane tab-pane fade show active" id="tab-table1">
        <table id="myTable1" class="table table-striped table-bordered" cellspacing="0" width="100%">
          <thead>
            <tr>
              <th>Codigo</th>
              <th>Fecha</th>
              <th>Nombre</th>
              <th>Total</th>
            </tr>
          </thead>
          <tbody>
            
            <%
                  con_ven.consultarVenta();
                  for(int i = 0; i<L_venta.Lventa.size(); i++){
                  temp_ven=(venta)L_venta.Lventa.get(i);    
              %>
                    <tr>
                        <td><%=temp_ven.getCodigo()%></td>
                        <td><%=temp_ven.getFecha()%></td>
                        <td><%=temp_ven.getEmpleado()%></td>
                        <td><%=temp_ven.getTotal()%></td>
                    </tr>
            <%}%>
          </tbody>
        </table>
      </div>
    </div>
  </div> 
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
  </script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
    integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous">
  </script>
  <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.22/b-1.6.5/b-html5-1.6.5/b-print-1.6.5/datatables.min.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
    </body>
</html>
