
/*' Sweet Alert  '*/

function mostrarAlerta(titulo, texto, icono) {
    Swal.fire({
        title: titulo,
        text: texto,
        icon: icono
    });
}


/*VENIAN CON EL TEMPLATE*/


function setVideoSize() {
    const vidWidth = 1920;
    const vidHeight = 1080;
    const windowWidth = window.innerWidth;
    const windowHeight = window.innerHeight;
    const tempVidWidth = windowHeight * vidWidth / vidHeight;
    const tempVidHeight = windowWidth * vidHeight / vidWidth;
    const newVidWidth = tempVidWidth > windowWidth ? tempVidWidth : windowWidth;
    const newVidHeight = tempVidHeight > windowHeight ? tempVidHeight : windowHeight;
    const tmVideo = $('#tm-video');

    tmVideo.css('width', newVidWidth);
    tmVideo.css('height', newVidHeight);
}

function openTab(evt, id) {
    $('.tm-tab-content').hide();
    $('#' + id).show();
    $('.tm-tab-link').removeClass('active');
    $(evt.currentTarget).addClass('active');
}

function initPage() {
    let pageId = location.hash;

    if (pageId) {
        highlightMenu($(`.tm-page-link[href^="${pageId}"]`));
        showPage($(pageId));
    }
    else {
        pageId = $('.tm-page-link.active').attr('href');
        showPage($(pageId));
    }
}

function highlightMenu(menuItem) {
    $('.tm-page-link').removeClass('active');
    menuItem.addClass('active');
}

function showPage(page) {
    $('.tm-page-content').hide();
    page.show();
}

$(document).ready(function () {


    $('#link-nosotros').click(function (event) {
        $("#btnPedido").css("visibility", "hidden")
    });
    $('#link-especiales').click(function (event) {
        $("#btnPedido").css("visibility", "hidden")
    });
    $('#link-contacto').click(function (event) {
        $("#btnPedido").css("visibility", "hidden")
    });
    $('#link-bebidas').click(function (event) {
        $("#btnPedido").css("visibility", "visible")
    });



    /***************** Pages *****************/

    initPage();

    $('.tm-page-link').click(function (event) {

        if (window.innerWidth > 991) {
            event.preventDefault();
        }

        highlightMenu($(event.currentTarget));
        showPage($(event.currentTarget.hash));
    });


    /***************** Tabs *******************/

    $('.tm-tab-link').on('click', e => {
        e.preventDefault();
        openTab(e, $(e.target).data('id'));
    });

    $('.tm-tab-link.active').click(); // Open default tab


    /************** Video background *********/

    setVideoSize();

    // Set video background size based on window size
    let timeout;
    window.onresize = function () {
        clearTimeout(timeout);
        timeout = setTimeout(setVideoSize, 100);
    };

    // Play/Pause button for video background      
    const btn = $("#tm-video-control-button");

    btn.on("click", function (e) {
        const video = document.getElementById("tm-video");
        $(this).removeClass();

        if (video.paused) {
            video.play();
            $(this).addClass("fas fa-pause");
        } else {
            video.pause();
            $(this).addClass("fas fa-play");
        }
    });

    var fecha = new Date();
    var opciones = { year: 'numeric', month: 'numeric', day: 'numeric' };
    var fechaTexto = 'Fecha Actual: ' + fecha.toLocaleDateString('es-AR', opciones);
    $('#fechaActual').text(fechaTexto);

});


/*  Código de Ariel   */


$('.tm-pedido').on('click', function (event) {

    event.preventDefault();

    $('.tm-page-nav-item').addClass("display: none").toggle();


    var mesasDisponibles = $("#CboMesas option").length;


    if (mesasDisponibles === 0) {

        Swal.fire({
            icon: 'warning',
            title: '¡Lo Sentimos!',
            text: 'No nos quedan mesas disponibles.',
            confirmButtonText: 'OK'
        });
    } else {
        $('.A-Pedido').each(function () {
            const visibility = $(this).css('visibility');
            $(this).css('visibility', visibility === 'hidden' ? 'visible' : 'hidden');
        });

        const spanText = $('#btnPedido span').text();
        $('#btnPedido span').text(spanText === 'Hacer Pedido' ? 'Ocultar Pedido' : 'Hacer Pedido');

    }
});

$('#totalPedido').text('0.00');

$(document).on('click', '.btn-agregar-producto', function (e) {
    e.preventDefault();

    // Validar que haya un nombre y una mesa seleccionada
    var nombre = $('#txtPedidoNombre').val();
    var mesa = $('#CboMesas').val();

    if (nombre.trim() === '') {
        Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Por favor, ingrese el nombre de la persona.',
            confirmButtonText: 'OK'
        });
        return;
    }

    if (mesa === '' || mesa === null) {
        Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Por favor, seleccione una mesa.',
            confirmButtonText: 'OK'
        });
        return;
    }

    // Obtener los datos del producto
    var idProducto = $(this).data('id-producto');
    var cantidad = parseInt($('#cant' + idProducto).val(), 10);
    var descripcionCompleta = $(this).closest('.tm-list-item-text').find('.tm-list-item-name').text().trim();
    var precioTexto = $('#prec' + idProducto).text().replace('$', '').trim();
    var precio = parseFloat(precioTexto.replace(',', '.')).toFixed(2);

   
    if (isNaN(cantidad) || cantidad <= 0) {
        Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Por favor, ingrese una cantidad válida.',
            confirmButtonText: 'OK'
        });
        return;
    }

    if (isNaN(precio)) {
        Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Precio inválido.',
            confirmButtonText: 'OK'
        });
        return;
    }

  
    var descripcion = descripcionCompleta.replace(/(\$[\d,.]+)/g, '').trim();
    var total = (cantidad * precio).toFixed(2);


    // Agregar el producto a la tabla
    agregarProductoATabla(idProducto, descripcion, cantidad, precio, total, nombre, mesa);

    // Deshabilitar el campo de nombre hasta que se confirme el pedido
    $('#txtPedidoNombre').prop('disabled', true);

    // Llamada AJAX al servidor
    //$.ajax({
    //    type: "POST",
    //    url: "index.aspx/AgregarProducto",
    //    data: JSON.stringify({
    //        idProducto: idProducto,
    //        descripcion: descripcion,
    //        cantidad: cantidad,
    //        precio: parseFloat(precio),
    //        total: parseFloat(total),
    //        nombre: nombre,
    //        mesa: mesa
    //    }),
    //    contentType: "application/json; charset=utf-8",
    //    dataType: "json",
    //    success: function (response) {
    //        if (response.d) {
    //            console.log('Producto agregado exitosamente.');
    //        } else {
    //            console.log('No se pudo agregar el producto.');
    //        }
    //    },
    //    error: function (xhr, status, error) {
    //        console.error('Error: ' + error);
    //    }
    //});
});

function agregarProductoATabla(idProducto, descripcion, cantidad, precio, total, nombre, mesa) {
    var existeProducto = $('#tabla-pedidos tbody tr[data-mesa="' + mesa + '"]').length > 0;
    var fila = `
        <tr data-mesa="${mesa}">
            <td>${idProducto}</td>
            <td>${descripcion}</td>
            <td>${cantidad}</td>
            <td>${precio}</td>
            <td>${total}</td>
            <td style="display: none">${nombre}</td>
            <td style="display: none">${mesa}</td>
        </tr>
    `;

    $('#tabla-pedidos tbody').append(fila);
    if (!existeProducto) {
        $('#txtPedidoNombre').prop('disabled', true);
    }


    // Actualizar el total de la mesa seleccionada
    actualizarTotalPedido();
    $('#btnAceptar').prop('disabled', false);
    $('#btnCancelar').prop('disabled', false);

    Swal.fire({
        icon: 'success',
        title: 'Producto agregado',
        text: `Producto: ${descripcion}, agregado a la mesa ${mesa}`,
        confirmButtonText: 'OK'
    });
}

$('#CboMesas').on('change', function () {
    var mesaSeleccionada = $(this).val();
    var tieneProductos = false;
    var nombreMesa = '';

    // Ocultar todas las filas al cambiar de mesa
    $('#tabla-pedidos tbody tr').hide();

    // Verificar si la mesa seleccionada tiene productos cargados
    $('#tabla-pedidos tbody tr').each(function () {
        var mesaFila = $(this).data('mesa');

        if (mesaFila == mesaSeleccionada) {
            $(this).show(); // Mostrar solo las filas de la mesa seleccionada
            tieneProductos = true;
            // Obtener el nombre de la mesa desde la columna oculta
            nombreMesa = $(this).find('td:eq(5)').text();
          
        }
    });

    if (tieneProductos) {
        // Si la mesa ya tiene productos, deshabilitar el campo y mostrar el nombre
        $('#txtPedidoNombre').val(nombreMesa).prop('disabled', true);
        $('#btnAceptar').prop('disabled', false);
        $('#btnCancelar').prop('disabled', false);
    } else {
        // Si no tiene productos, habilitar el campo para ingresar un nuevo nombre
        $('#txtPedidoNombre').val('').prop('disabled', false);
        $('#btnAceptar').prop('disabled', true);
        $('#btnCancelar').prop('disabled', true);
    }

    // Actualizar el total de la mesa seleccionada
    actualizarTotalPedido();
});

function cancelarPedido() {
    var mesaSeleccionada = $('#CboMesas').val(); // Obtener la mesa seleccionada

    // Recorrer todas las filas de la tabla y eliminar las que pertenecen a la mesa seleccionada
    $('#tabla-pedidos tbody tr').each(function () {
        var mesaFila = $(this).data('mesa'); // Obtener el valor de la mesa en la fila
        if (mesaFila == mesaSeleccionada) {
            $(this).remove(); // Eliminar la fila si coincide con la mesa seleccionada
        }
    });
    
    // Actualizar el total del pedido a 0 para esa mesa
    $('#totalPedido').text('0.00');

    // Si es necesario, también habilitar nuevamente el campo de nombre del pedido si la mesa queda sin productos
    
    $('#txtPedidoNombre').val('').prop('disabled', false);
    $('#btnAceptar').prop('disabled', true);
    $('#btnCancelar').prop('disabled', true);
   
}



function actualizarTotalPedido() {
    var mesaSeleccionada = $('#CboMesas').val();
    var totalPedido = 0;

    // Recorrer las filas de la tabla y sumar el total de las filas visibles para la mesa seleccionada
    $('#tabla-pedidos tbody tr').each(function () {
        var mesaFila = $(this).data('mesa');

        if (mesaFila == mesaSeleccionada) {
            // Sumar la columna Total (asumiendo que el valor está en la 5ta columna - índice 4)
            var totalFila = parseFloat($(this).find('td:eq(4)').text());

            // Asegurarse de que el valor sea un número
            if (!isNaN(totalFila)) {
                totalPedido += totalFila;
            }
        }
    });

    // Actualizar el valor del control #totalPedido con el total calculado
    $('#totalPedido').text(totalPedido.toFixed(2)); // Mostrar con 2 decimales
}




//function aceptarPedido() {
   

//    var detalles = [];

//    $('#tabla-pedidos tbody tr').each(function () {
//        var idProducto = $(this).find('td:eq(0)').text();
//        var cantidad = $(this).find('td:eq(2)').text();
//        var precio = $(this).find('td:eq(3)').text();

//        detalles.push({
//            ID_Producto: parseInt(idProducto),
//            Cantidad: parseInt(cantidad),
//            Precio: parseFloat(precio)
//        });
//    });

//    // Obtener la mesa, nombre y fecha
//    var mesa = $('#CboMesas').val();
//    var nombre = $('#txtPedidoNombre').val();
//    var fecha = new Date().toISOString().split('T')[0]; // Formato YYYY-MM-DD


//    // Llamada AJAX al servidor
//    $.ajax({
//        type: "POST",
//        url: "index.aspx/GuardarPedidoCompleto",
//        data: JSON.stringify({
//            idMesa: parseInt(mesa),
//            nombreCliente: nombre,
//            fechaPedido: fecha,
//            detalles: detalles
//        }),
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: function (response) {
//            if (response.d) {
//                Swal.fire('Pedido guardado correctamente.');
//            } else {
//                Swal.fire('Error al guardar el pedido.');
//            }
//        },
//        error: function (xhr, status, error) {
//            console.error('Error: ' + error);
//        }
//    });
//};
