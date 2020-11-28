
$(document).ready(function() {
  $('a[data-toggle="tab"]').on( 'shown.bs.tab', function (e) {
      $.fn.dataTable.tables( {visible: true, api: true} ).columns.adjust();
  } );
  $('table.table').DataTable( {
      "language":{
        "url":"json/dataTable.json"
      },
      scrollY:        200,
      scrollCollapse: true,
      paging:         true,
      responsive: {
        breakpoints: [
          {name: 'bigdesktop', width: Infinity},
          {name: 'meddesktop', width: 1480},
          {name: 'smalldesktop', width: 1280},
          {name: 'medium', width: 1188},
          {name: 'tabletl', width: 1024},
          {name: 'btwtabllandp', width: 848},
          {name: 'tabletp', width: 768},
          {name: 'mobilel', width: 480},
          {name: 'mobilep', width: 320}
        ]},
      dom: 'Bfrtilp',
      buttons:[
        {
          extend: 'excelHtml5',
          text:'<i class="fas fa-file-excel"></i>',
          titleAttr: 'Exportar a Excel',
          className: 'btn btn-success'
        },
        {
          extend: 'pdfHtml5',
          text:'<i class="fas fa-file-pdf"></i>',
          titleAttr: 'Exportar a PDF',
          className: 'btn btn-danger'
        },
        {
          extend: 'print',
          text:'<i class="fas fa-print"></i>',
          titleAttr: 'Imprimir',
          className: 'btn btn-info'
        },
      ]
  } );
} );

$(document).ready( function () {
  $('#myTable').DataTable({
    "language":{
      "url":"json/dataTable.json"
    },
    "scrollY": "200px",
    "scrollCollapse": true,
    "paging": true,
    responsive: {
      breakpoints: [
        {name: 'bigdesktop', width: Infinity},
        {name: 'meddesktop', width: 1480},
        {name: 'smalldesktop', width: 1280},
        {name: 'medium', width: 1188},
        {name: 'tabletl', width: 1024},
        {name: 'btwtabllandp', width: 848},
        {name: 'tabletp', width: 768},
        {name: 'mobilel', width: 480},
        {name: 'mobilep', width: 320}
      ]
    }
  });
});

const carrito_comanda = document.querySelector('#carrito-comanda');
  const contenedorCarritoComanda = document.querySelector('#lista-carrito-comanda tbody');
  const listaComanda = document.querySelector('#lista-comanda');
  const date_input = document.querySelector('#date');
  let articulosComanda = []
  cargarEventListeners();

  function cargarEventListeners() {
    // Events
    listaComanda.addEventListener('click', agregarFila);
    listaComanda.addEventListener('change', onChange);
    listaComanda.addEventListener('keypress', onTyping);
    listaComanda.addEventListener('input', onInput);
    carrito_comanda.addEventListener('click', eliminarFila);
    window.addEventListener('load', () => {
      setInterval(clock, 1000);
    });
    // Show LocalStorage items
    document.addEventListener('DOMContentLoaded', () => {
      //if there's nothing in localstorage, we add an empty array
      articulosComanda = JSON.parse(localStorage.getItem('carrito-comanda')) || [];
      carrito_comanda_HTML();
    })
  }

  function clock() {
    var date = new Date();
    var day = date.getDate();
    var month = date.getMonth();
    var year = date.getFullYear();
    var hour = date.getHours();
    var min = date.getMinutes();
    var sec = date.getSeconds();

    //*Validations date (conditional - ternary operator)
    var sec = (sec < 10) ? `0${sec}` : sec;
    var min = (min < 10) ? `0${min}` : min;
    var hour = (hour < 10) ? `0${hour}` : hour;
    //var month = (month<=10) ? `0${month+1}` : `${month+1}`; (Not working!!) 
    var month = (month.length === 1) ? `0${month+1}` : `${month+1}`;
    const time = document.getElementById('date').placeholder = `${day}/${month}/${year} ${hour}:${min}:${sec}`
    return time;
  }

  function onInput(e) {
    const row_inputs = e.target.parentElement;
    const input = row_inputs.querySelector('input');
    console.log(input)
    if (input.value.length > input.maxLength) {
      input.value = input.value.slice(0, input.maxLength); //limit from 0 to max.length
    }
    if (input.value > 20) {
      input.value = 20
      console.log(input.value)
    }
    else{
      if(input.value<1){
      input.value=''
      console.log(input.value)
    }
    }
    
  }

  function onTyping(e) {
    const row_inputs = e.target.parentElement.parentElement;
    const regex_allowed = /[0-9\/]+/;
    const input = row_inputs.querySelector('input');
    console.log(e)
    if (!regex_allowed.test(e.key)) {
      console.log('applying regex')
      e.preventDefault();
    }
  }

  function onChange(e) {
    if (e.target.classList.contains('custom-select')) {
      const row_inputs = e.target.parentElement.parentElement;
      disablingBoxes(row_inputs);
    }
  }

  function disablingBoxes(row) {
    const select_tag = row.querySelector('select');
    const value_from_select = select_tag.options[select_tag.selectedIndex].value;
    const cantidad = row.querySelector('input');
    const button = row.querySelector('button');
    switch (value_from_select) {
      case '0': //option value == 0
        console.log('disabled')
        disableAll(row)
        break;
      default:
        cantidad.removeAttribute('readonly');
        cantidad.value = 1;
        button.removeAttribute('disabled');
        break;
    }
  }

  function disableAll(row) {
    const select_tag = row.querySelector('select');
    const value_from_select = select_tag.options[select_tag.selectedIndex].value;
    const cantidad = row.querySelector('input');
    const button = row.querySelector('button');
    select_tag.selectedIndex = '0';
    cantidad.value = 0;
    cantidad.setAttribute('readonly', true);
    button.setAttribute('disabled', true);
  }

  function agregarFila(e) {
    e.preventDefault();
    if (e.target.classList.contains('btn')) { //Detect if there's any btn (bootstrap button)
      const row_combo_box = e.target.parentElement.parentElement;
      leerDatosComboBoxes(row_combo_box);
      disableAll(row_combo_box);
    }
  }

  function eliminarFila(e) {
    console.log(e.target);  
    if (e.target.classList.contains('borrar_fila')) {
      console.log(e.target.classList);  
      const row_nombre = e.target.getAttribute('data-id');
      articulosComanda = articulosComanda.filter(row => row.nombre !==
      row_nombre); //Prints everything excepts the one that is being clicked for deleting
      console.log(articulosComanda);
      carrito_comanda_HTML();
    }
  }

  function leerDatosComboBoxes(row_combo_box) {
    const nombre_combo_box = row_combo_box.querySelector('select');
    //Getting string values
    const nombre = nombre_combo_box.options[nombre_combo_box.selectedIndex].text;
    const cantidad = row_combo_box.querySelector('input').value;
    const get_data_boxes = {
      nombre,
      cantidad
    }
    console.log(get_data_boxes);
    //Check if any elements already exists
    const existe = articulosComanda.some(row => row.nombre === get_data_boxes.nombre);
    if (existe) {
      //Update quantity
      const row = articulosComanda.map(row => {
        if (row.nombre === get_data_boxes.nombre) {
          row.cantidad = parseInt(row.cantidad) + parseInt(get_data_boxes.cantidad);
          return row;
        } else {
          return row;
        }
      });
      articulosComanda = [...row];
    } else {
      articulosComanda = [...articulosComanda, get_data_boxes]
    }
    carrito_comanda_HTML();
  }

  function carrito_comanda_HTML() {
    limpiar_carrito_comanda_HTML();
    articulosComanda.forEach(row => {
      
      const {
        nombre,
        cantidad
      } = row;
      const row_data = document.createElement('tr');
      row_data.setAttribute('name', 'row-data');
      row_data.innerHTML = `
        
        <td><input name="nombre" type="text" value="${nombre}" readonly/></td>
        <td><input name="cantidad" type="text" value="${cantidad}" readonly/></td>
        <td>
          <button type="button" class="close" aria-label="Close">
            <span aria-hidden="true" class="borrar_fila" data-id="${nombre}">&times;</span>
          </button>
        </td>
      `;
      contenedorCarritoComanda.appendChild(row_data);
    });
    //Agregar al local-storage
    //sicronizarStorage();
  }

  function sicronizarStorage() {
    localStorage.setItem('carrito-comanda', JSON.stringify(articulosComanda));
  }

  function limpiar_carrito_comanda_HTML() {
    while (contenedorCarritoComanda.firstChild) {
      contenedorCarritoComanda.removeChild(contenedorCarritoComanda.firstChild);
    }
  }
  
function popup_add_producto(){
  document.querySelector('#popup-add-producto').style.display = 'flex';
}
function popup_close_producto(){
  document.querySelector('#popup-add-producto').style.display = 'none';
}