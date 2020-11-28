<%-- 
    Document   : frmPRODUCTO

    Author     : Naty
--%>

<%@page import="logica.L_Producto"%>
<%@page import="datos.producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.22/b-1.6.5/b-html5-1.6.5/b-print-1.6.5/datatables.min.css"/>
        <link rel="stylesheet" href="../styles/style.css">
    </head>
    <body class="container w-50 h-100">
        <form action="frmModificarProducto.jsp" method="POST" class="w-100 mt-20">
            <%
            producto temp = new producto();
            L_Producto con = new L_Producto();
        %>
        <label for="codigo">Codigo</label>
        <input type="number" class="form-control mb-2" name="codigo" id="codigo" autocomplete="off">
        <label for="nombre">Nombre</label>
        <input type="text" class="form-control mb-2" name="nombre" id="nombre" step="0.1" autocomplete="off">
        <label for="precio">Precio</label>
        <input type="number" class="form-control mb-2" name="precio" id="precio" autocomplete="off">
        <label for="categoria">Categoria</label>
        <select class="form-control mb-2" name="categoria" id="categoria" autocomplete="off">
            <option selected>--</option>
            <%
                con.consultarCategoria();
                for(int i = 0; i<L_Producto.Lcategoria.size(); i++){
                  temp=(producto)L_Producto.Lcategoria.get(i);    
            %>
                <option value="<%=temp.getCod()%>"><%=temp.getCategoria()%></option>
            <%}%>
        </select>
        <button type="submit" class="btn btn-success btn-block mb-1" name="btnModificar">Modificar</button>
        </form>
        <form action="../Menu_Principal.jsp" class="w-100">
            <button type="submit" class="btn btn-secondary btn-block mb-2">Volver</button>
        </form>
        <%
            if(request.getParameter("btnModificar")!=null){
                temp = new producto(request.getParameter("codigo"),
                                    request.getParameter("nombre"), 
                                    request.getParameter("precio"),
                                    request.getParameter("categoria")
                                    );
                con.modificarProducto(temp);
            }
        %>
        <div style="background-color: transparent; width: 100%;">
    <ul class="nav nav-pills mb-3" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" href="#tab-table1" data-toggle="tab">Productos</a>
      </li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane tab-pane fade show active" id="tab-table1">
        <table id="myTable1" class="table table-striped table-bordered" cellspacing="0" width="100%">
          <thead>
            <tr>
              <th>Codigo</th>
              <th>Nombre</th>
              <th>Precio</th>
              <th>Categoria</th>
            </tr>
          </thead>
          <tbody>
            
            <%
                  con.consultarProductos();
                  for(int i = 0; i<L_Producto.Lproducto.size(); i++){
                  temp=(producto)L_Producto.Lproducto.get(i);    
              %>
                    <tr>
                        <td><%=temp.getCod()%></td>
                        <td><%=temp.getNombre()%></td>
                        <td><%=temp.getPrecio()%></td>
                        <td><%=temp.getCategoria()%></td>
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
    <script type="text/javascript" src="../js/script.js"></script>
    </body>
</html>
