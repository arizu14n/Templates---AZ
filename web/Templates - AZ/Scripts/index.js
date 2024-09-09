function inicializarEventos() {
    // Delegación de eventos para los botones de agregar producto
    document.addEventListener('click', function (e) {
        if (e.target && e.target.classList.contains('btn-agregar-producto')) {
            e.preventDefault();
            var idProducto = e.target.getAttribute('data-id-producto');
            var cantidad = document.getElementById('cant' + idProducto).value;
            agregarProductoAlPedido(idProducto, cantidad);
        }
    });

    // Evento para el botón Aceptar
    var btnAceptar = document.getElementById('btnAceptar');
    if (btnAceptar) {
        btnAceptar.addEventListener('click', function (e) {
            e.preventDefault();
            __doPostBack('btnAceptar', '');
        });
    }
}

function agregarProductoAlPedido(idProducto, cantidad) {
    // Aquí puedes hacer un postback o una llamada AJAX
    __doPostBack('AgregarProducto', idProducto + '|' + cantidad);
}

if (window.addEventListener) {
    window.addEventListener('load', inicializarEventos, false);
} else if (window.attachEvent) {
    window.attachEvent('onload', inicializarEventos);
}


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

    //$(document).on('click', '.btnAgrega', function (e) {
    //    e.preventDefault(); // Prevenir el comportamiento por defecto del botón

    //    var productoId = $(this).attr('id').replace('prod', '');
    //    var cantidad = $('#cant' + productoId).val();
    //    var precio = $('#prec' + productoId).text().replace('$ ', '');
    //    var nombre = $(this).closest('.tm-list-item-text').find('.tm-list-item-name').contents().filter(function () {
    //        return this.nodeType == 3;
    //    }).text().trim();



    //});



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
        $('#btnPedido span').text(spanText === 'Hacer Pedido' ? 'Cancelar Pedido' : 'Hacer Pedido');

    }
});







