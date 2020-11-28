<%-- 
    Document   : frmPRODUCTO

    Author     : Naty
--%>

<%@page import="logica.L_venta"%>
<%@page import="datos.venta"%>
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
    <body class="container w-50">
            <%
                producto temp_pro = new producto();
                L_Producto con_pro = new L_Producto();
                venta temp_ven = new venta();
                L_venta con_ven = new L_venta();
            %>
            <form action="frmRegistrarVenta.jsp" method="POST">
                <div class="container d-flex">
                  <div class="col-6 p-0" id="lista-comanda">
                    <div class="form-row">
                      <div class="col-md-8 mb-3">
                        <label>Fecha</label>
                        <input name="fecha" type="number" class="form-control" maxlength="2" min="1" id="date" readonly>
                      </div>
                    </div>
                    <div class="form-row">
                      <div class="col-md-5 mb-3">
                        <label>Menu - Segundo</label>
                        <select class="custom-select" id="nombre_segundo">
                          <option value="0" selected>--</option>
                              <%
                                  con_pro.consultarSegundo();
                                  for(int i = 0; i<L_Producto.Lsegundo.size(); i++){
                                      temp_pro=(producto)L_Producto.Lsegundo.get(i);    
                              %>
                                  <option value="<%=temp_pro.getCod()%>"><%=temp_pro.getCategoria()%></option>
                              <%}%>
                        </select>
                      </div>
                      <div class="col-md-4 mb-3">
                        <label>Cant.Segundo</label>
                        <input class="form-control" placeholder="Cantidad" type="number" id="cant_segundo" value="0" min="1"
                          maxlength="2" autocomplete="off" readonly>
                      </div>
                      <div class="col-md-2 m-0 d-flex align-items-strecht mb-3">
                        <button class="btn btn-outline-primary agregar-segundo" style="width: 100%;" disabled>
                          <i class="fas fa-cart-plus fa-lg"></i>
                        </button>
                      </div>
                      </div>
                      <div class="form-row">
                        <div class="col-md-5 mb-3">
                          <label>Menu - Entrada</label>
                          <select class="custom-select" id="nombre_entrada">
                            <option value="0" selected>--</option>
                            <%
                                con_pro.consultarEntrada();
                                for(int i = 0; i<L_Producto.Lentrada.size(); i++){
                                    temp_pro=(producto)L_Producto.Lentrada.get(i);    
                            %>
                                <option value="<%=temp_pro.getCod()%>"><%=temp_pro.getCategoria()%></option>
                            <%}%>
                          </select>
                        </div>
                        <div class="col-md-4 mb-3">
                          <label>Cant.Entrada</label>
                          <input class="form-control" placeholder="Cantidad" type="number" id="cant_entrada" value="0" min="1"
                            maxlength="2" autocomplete="off" readonly>
                        </div>
                        <div class="col-md-2 m-0 d-flex align-items-strecht mb-3">
                          <button class="btn btn-outline-primary agregar-entrada" style="width: 100%;" disabled>
                            <i class="fas fa-cart-plus fa-lg"></i>
                          </button>
                        </div>
                      </div>
                    </div>
                          
                    <div class="col-6 p-0">
                      <div class="form-group mb-2" id="carrito-comanda">
                        <table id="lista-carrito-comanda" class="table-active table-sm table-hover" style="table-layout: fixed; width: 100%;">
                          <thead class="thead-dark" style="color:white;">
                            <tr>
                              <th style="width: 50%; text-align: center;">Nombre</th>
                              <th style="width: 40%; text-align: center;">Cantidad</th>
                              <th style="width: 10%; text-align: center;"></th>
                            </tr>
                          </thead>
                          <tbody style="text-align: center;">
                            <tr>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td>
                                <button type="button" class="close" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                                </button>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                        <button type="submit" class="btn btn-success btn-block mb-2" name="btnRegistrar">Registrar Comanda</button>
                        <%
                            if(request.getParameter("btnRegistrar")!=null){
                                String [] nombres = request.getParameterValues("nombre");
                                String [] cantidad = request.getParameterValues("cantidad");
                                for (int i = 0;i<nombres.length;i++){
                                    temp_ven = new venta(nombres[i],cantidad[i]);
                                    con_ven.insertarVenta(temp_ven);
                                }
                            }
                        %>
            </div>
      </div>
    </form>
    <form action="../Menu_Principal.jsp">
        <button type="submit" class="btn btn-secondary mb-2" type="submit">Volver</button>
    </form>
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
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
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
