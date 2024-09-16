
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
});


/*  Código de Ariel   */


$('.tm-pedido').on('click', function (event) {

    event.preventDefault();

    $('.tm-page-nav-item').addClass("display: none").toggle();


    let mesasDisponibles = $("#CboMesas option").length;


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
    var precio = parseFloat(precioTexto.replace(',', '.'));

    console.log('Descripción Completa:', descripcionCompleta);
    console.log('Precio Texto:', precioTexto);
    console.log('Precio:', precio);

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

    // Extraer la descripción sin el precio
    // Eliminamos cualquier texto que empiece con $ y que contenga dígitos y comas/puntos
    var descripcion = descripcionCompleta.replace(/(\$[\d,.]+)/g, '').trim();
    var total = (cantidad * precio).toFixed(2);

    console.log('Descripción:', descripcion);
    console.log('Total:', total);

    // Agregar el producto a la tabla
    agregarProductoATabla(idProducto, descripcion, cantidad, precio, total, nombre, mesa);

    // Deshabilitar el campo de nombre hasta que se confirme el pedido
    $('#txtPedidoNombre').prop('disabled', true);

    // Llamada AJAX al servidor
    $.ajax({
        type: "POST",
        url: "index.aspx/AgregarProducto",
        data: JSON.stringify({
            idProducto: idProducto,
            descripcion: descripcion,
            cantidad: cantidad,
            precio: parseFloat(precio),
            total: parseFloat(total),
            nombre: nombre,
            mesa: mesa
        }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (response.d) {
                console.log('Producto agregado exitosamente.');
            } else {
                console.log('No se pudo agregar el producto.');
            }
        },
        error: function (xhr, status, error) {
            console.error('Error: ' + error);
        }
    });
});

function agregarProductoATabla(idProducto, descripcion, cantidad, precio, total, nombre, mesa) {
    var fila = `
        <tr data-mesa="${mesa}">
            <td>${idProducto}</td>
            <td>${descripcion}</td>
            <td>${cantidad}</td>
            <td>${precio}</td>
            <td>${total}</td>
            <td style="visibility: hidden">${nombre}</td>
            <td style="visibility: hidden">${mesa}</td>
        </tr>
    `;

    $('#tabla-pedidos tbody').append(fila);

    Swal.fire({
        icon: 'success',
        title: 'Producto agregado',
        text: `Producto ${descripcion} agregado a la mesa ${mesa}`,
        confirmButtonText: 'OK'
    });
}

$('#CboMesas').on('change', function () {
    var mesaSeleccionada = $(this).val();

    // Mostrar solo las filas correspondientes a la mesa seleccionada
    $('#tabla-pedidos tbody tr').each(function () {
        var mesaFila = $(this).data('mesa');
        if (mesaFila == mesaSeleccionada) {
            $(this).show();
        } else {
            $(this).hide();
        }
    });
});
