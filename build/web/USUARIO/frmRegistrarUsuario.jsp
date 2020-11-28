<%-- 
    Document   : frmREGISTROCLIENTE
  
    Author     : Naty
--%>


<%@page import="datos.usuario"%>
<%@page import="logica.L_usuario"%>
<%@page import="logica.L_empleado"%>
<%@page import="datos.empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Empleado</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.22/b-1.6.5/b-html5-1.6.5/b-print-1.6.5/datatables.min.css"/>
        <link rel="stylesheet" href="../styles/style.css">
    </head>
    <body class="container w-50 h-100">
        <form action="frmRegistrarUsuario.jsp" class="w-100">
            <%
            usuario temp = new usuario();
            L_usuario con = new L_usuario();
            empleado temp_emp = new empleado();
            L_empleado con_emp = new L_empleado();
        %>
        <div class="row">
            <div class="col-md-6">
                <label for="codigo">Codigo</label>
                <input type="text" class="form-control mb-2" name="codigo" id="codigo" autocomplete="off" readonly>
                <label for="apell">Empleado</label>
                <input type="text" class="form-control mb-2" name="nombre" id="nombre" autocomplete="off" readonly>
                <button type="button" class="btn btn-primary mb-3" id="search-producto" onclick="popup_add_producto()">Buscar Empleado</button>
            </div>
            <div class="col-md-6">
                <label for="username">Username</label>
                <input type="text" class="form-control mb-2" name="usuario" id="usuario" autocomplete="off">
                <label for="password">Password</label>
                <input type="password" class="form-control mb-2" name="password" id="password" autocomplete="off">
            </div>
        </div>
        <button type="submit" class="btn btn-success btn-block mb-2" name="btnRegistrar" id="btnRegistrar" disabled>Registrar</button>
        </form>
        <form action="../Menu_Principal.jsp" class="w-100 m-0">
            <button type="submit" class="btn btn-secondary btn-block mb-2">Volver</button>
        </form>
        <%
            if(request.getParameter("btnRegistrar")!=null){
                temp = new usuario( request.getParameter("codigo"),
                                    request.getParameter("usuario"), 
                                    request.getParameter("password")
                );
                System.out.println(temp);
                con.insertUsuario(temp);
            }
        %>
        <div style="background-color: transparent; width: 100%;">
            <ul class="nav nav-pills mb-3" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" href="#tab-table1" data-toggle="tab">Clientes</a>
              </li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane tab-pane fade show active" id="tab-table1">
                <table id="myTable1" class="table table-striped table-bordered" cellspacing="0" width="100%">
                  <thead>
                    <tr>
                      <th>Codigo</th>
                      <th>Usuario</th>
                      <th>Password</th>
                      <th>Empleado</th>
                    </tr>
                  </thead>
                  <tbody>
                    <%
                          con.listarUsuarios();
                          for(int i = 0; i<L_usuario.Luser.size(); i++){
                          temp=(usuario)L_usuario.Luser.get(i);    
                      %>
                            <tr>
                                <td><%=temp.getCod()%></td>
                                <td><%=temp.getUsername()%></td>
                                <td><%=temp.getPass()%></td>
                                <td><%=temp.getEmpleado_nombre()%> <%=temp.getEmpleado_apell()%></td>
                            </tr>
                    <%}%>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
<div class="popup-add-producto" id="popup-add-producto">
    <div class="buscar-popup animate__animated animate__bounceInUp">
      <div class="form-body">
        <h1 class="mantener-heading-buscar">Buscar Empleado</h1>
        <a href="#" id="close-popup" onclick="popup_close_producto()"><i class="fas fa-times"></i></a>
        <div class="input-search-container">
          <table class="input-search-container-elements">
            <tr>
              <td>
                <input autocomplete="off" type="text" placeholder="Filtrar por Nombre" id="search-input">
              </td>
              <td>
                <i class="fas fa-search"></i>
              </td>
            </tr>
          </table>
        </div>
        <div class="row mx-auto mt-2 table-fixed table-fixed-popup-buscar" style="background-color: #D3CCB8; color: #000;">
            <table class="table-sm" style="width: 100%;">
            <thead class="thead-dark" style="color: white;">
              <tr>
                <th scope="col">Codigo</th>
                <th scope="col">Nombres</th>
                <th scope="col">Apellidos</th>
                <th scope="col">Actions</th>
              </tr>
            </thead>
            <tbody id="table">
              
                <%
                con_emp.consultarEmpleados();
                   for(int i = 0;i<L_empleado.Lempleado.size();i++){
                       temp_emp = (empleado)L_empleado.Lempleado.get(i);
                  %>
                <tr>
                    <td><%=temp_emp.getCodigo()%></td>
                    <td><%=temp_emp.getNombre()%></td>
                    <td><%=temp_emp.getApellido()%></td>
                    <td id="action-buttons">
                        <button type="button" class="btn btn-success btn-sm">
                          <i class="fas fa-check"></i>
                        </button>
                    </td>
                </tr>
                  <%}%>
            </tbody>
          </table>
        </div>
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
    <script type="text/javascript">
        const searchbar = document.getElementById('search-input');
        const btn_add_from_row = document.querySelectorAll('#popup-add-producto button');

        cargarEventListeners();    
        function cargarEventListeners(){
          searchbar.addEventListener('keyup',searchBar)
          btn_add_from_row.forEach((val,index)=>{
            val.addEventListener('click',onClickAddRow);
          });
        }
        function onClickAddRow(evt){
          console.log(evt)
          var row = evt.target.closest('tr');
          document.getElementById('codigo').value = row.children[0].innerText;
          document.getElementById('nombre').value = row.children[1].innerText +" "+ row.children[2].innerText;
          //document.getElementById('apell').value = row.children[2].innerText;
          onClickRemoveReadOnly()
          onClickPopupClose();
        }
        function onClickRemoveReadOnly(){
          document.getElementById('usuario').removeAttribute('readonly');
          document.getElementById('usuario').setAttribute('required',true);
          document.getElementById('password').removeAttribute('readonly');
          document.getElementById('password').setAttribute('required',true);
          document.getElementById('btnRegistrar').removeAttribute('disabled');
        }
        function onClickPopupClose(){
          document.querySelector("#popup-add-producto").style.display = "none";
        }
        function searchBar(){
          const term = searchbar.value.toLowerCase();
          const table = document.getElementById('table');
          const rows = table.getElementsByTagName('tr');
          Array.from(rows).forEach((rows) => {
            const name = rows.children[1].textContent;
            if (name.toLowerCase().indexOf(term) != -1) {
              rows.style.display = 'table-row';
            } else {
              rows.style.display = 'none';
            }
          });
        }
    </script>
    </body>
</html>
