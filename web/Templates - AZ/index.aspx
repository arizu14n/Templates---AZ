<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="Templates___AZ.index" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="AD_templates.Categorias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Café "Las Olas"</title>
    <link rel="stylesheet" href="fontawesome/css/all.min.css" />
    <!-- https://fontawesome.com/ -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
    <!-- https://fonts.google.com/ -->
    <link rel="stylesheet" href="css/tooplate-wave-cafe.css" />
    <!--Tooplate 2121 Wave Cafe https://www.tooplate.com/view/2121-wave-cafe -->

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>

 

</head>
<body>


    <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="tm-container">
            <div class="tm-row">
                <!-- Site Header -->
                <div class="tm-left">
                    <div class="tm-left-inner">
                        <div class="tm-site-header">
                            <i class="fas fa-coffee fa-3x tm-site-logo"></i>
                            <h1 class="tm-site-name">"Las Olas"</h1>
                        </div>
                        <nav class="tm-site-nav">
                            <ul class="tm-site-nav-ul">
                                <li class="tm-page-nav-item" >
                                    <a href="#drink" id="link-bebidas" class="tm-page-link active">
                                        <i class="fas fa-mug-hot tm-page-link-icon"></i>
                                        <span>Bebidas</span>
                                    </a>
                                </li>
                                <li class="tm-page-nav-item">
                                    <a href="#about" id="link-nosotros" class="tm-page-link">
                                        <i class="fas fa-users tm-page-link-icon"></i>
                                        <span>Nosotros</span>
                                    </a>
                                </li>
                                <li class="tm-page-nav-item">
                                    <a href="#special" id="link-especiales" class="tm-page-link">
                                        <i class="fas fa-glass-martini tm-page-link-icon"></i>
                                        <span>Especiales</span>
                                    </a>
                                </li>
                                <li class="tm-page-nav-item">
                                    <a href="#contact" id="link-contacto" class="tm-page-link">
                                        <i class="fas fa-comments tm-page-link-icon"></i>
                                        <span>Contacto</span>
                                    </a>
                                </li>
                                <li class="tm-btnpedido" >
                                    <a href="#pedido" class="tm-pedido" id="btnPedido">
                                        <i class="fas fa-list tm-page-link-icon"></i>
                                        <span>Hacer Pedido</span>
                                    </a>
                                </li>
                            </ul>



                        </nav>


                        <%-- DIV PARA CARGAR LA GRILLA DEL PEDIDO  --%>
                        <div id="pedido" class="tm-black-bg A-Pedido" >
                            <asp:TextBox id="txtPedidoNombre" name="txtPedidoNombre" Placeholder="Ingrese su Nombre" class="tm-form-control A-Pedido" runat="server"></asp:TextBox>
                            <asp:DropDownList class="tm-form-control A-Pedido" placeholder="Elija su mesa" id="CboMesas" runat="server"></asp:DropDownList>

                           <table style="width: 100%; border:1px" id="tabla-pedidos" class="tm-black-bg tm-form-control A-Pedido">

    <thead>
        <tr>
            <th>ID</th>
            <th>Producto</th>
            <th>Cantidad</th>
            <th>Precio</th>
            <th>Total</th>
            <th style="visibility:hidden">Nombre</th>
            <th style="visibility:hidden">Mesa</th>
        </tr>
    </thead>
    <tbody>
        <!-- Las filas se agregarán dinámicamente aquí -->
    </tbody>
</table>


                            <ul>
                                <li class="tm-btnpedido">
                                    <a class="tm-pedido" >
                                        <span>Total Pedido:    </span><i class="fas fa-dollar-sign tm-page-link-icon"></i><span id="totalPedido"></span>
                                        <span> </span>
                                    </a>
                                    <button id="btnAceptar" class="tm-form-trol btnAgrega" onclick="guardarPedido(); return false;">Aceptar</button>
                                    <button id="btnPagar" class="tm-form-trol btnAgrega" onclick="guardarPedido(); return false;">Pagar</button>
                                    <button id="btnCancelar" class="tm-form-trol btnAgrega" onclick="guardarPedido(); return false;">Cancelar</button>
                                </li>
                            </ul>
                        </div>

                    </div>
                </div>
                <div class="tm-right">

                    <%--Menú BEBIDAS--%>

                    <div id="drink" class="tm-page-content">


                        <nav class="tm-black-bg tm-drinks-nav">
                            <ul id="contentCategorias" runat="server">
                            </ul>
                        </nav>

                        <div id="contentPlaceholder" runat="server"></div>


                    </div>

                </div>

                <!-- Nosotros -->

                <div id="about" class="tm-page-content">
                    <div class="tm-black-bg tm-mb-20 tm-about-box-1">
                        <h2 class="tm-text-primary tm-about-header">Café "Las Olas"</h2>
                        <div class="tm-list-item tm-list-item-2">
                            <img src="img/about-1.png" alt="Image" class="tm-list-item-img tm-list-item-img-big" />
                            <div class="tm-list-item-text-2">
                                <p>Se inauguró en 2010, ofreciendo café de alta calidad y un ambiente acogedor.</p>
                                <p>Se ha convertido en un lugar popular para reuniones y disfrute del café.</p>
                            </div>
                        </div>
                    </div>
                    <div class="tm-black-bg tm-mb-20 tm-about-box-2">
                        <div class="tm-list-item tm-list-item-2">
                            <div class="tm-list-item-text-2">
                                <h2 class="tm-text-primary">¿Cómo empezamos?</h2>
                                <p>Nuestros primeros pasos fueron seguros y certeros, con el firme objetivo de brindar el mejor servicio a nuestros clientes.</p>
                            </div>
                            <img src="img/about-2.png" alt="Image" class="tm-list-item-img tm-list-item-img-big tm-img-right" />
                        </div>
                        <p>Nuestro presente nos posiciona como un referente en la cafetería de la ciudad. Y nuestro futuro es aún más prometedor.</p>
                    </div>
                </div>
                <!-- end About Us Page -->

                <!-- Especiales -->

                <div id="special" class="tm-page-content">
                    <div class="tm-special-items" id="specialItemsContainer" runat="server">
                    </div>
                </div>


                <!-- Contacto -->

                <div id="contact" class="tm-page-content">
                    <div class="tm-black-bg tm-contact-text-container tm-align-right">
                        <h2 class="tm-text-primary">Contáctanos</h2>
                        <p>Háznos llegar tus sugerencias. O también puedes reservar un salón para tu evento especial</p>
                    </div>
                    <div class="tm-black-bg tm-contact-form-container tm-align-right">

                        <div class="tm-form-group">

                            <asp:TextBox ID="txtNombre" runat="server" class="tm-form-control" placeholder="Nombre" required=""></asp:TextBox>
                        </div>
                        <div class="tm-form-group">

                            <asp:TextBox ID="txtMail" runat="server" class="tm-form-control" placeholder="Email" required=""></asp:TextBox>
                        </div>
                        <div class="tm-form-group tm-mb-30">

                            <asp:TextBox ID="txtMensaje" runat="server" class="tm-form-control" placeholder="Mensaje" required=""></asp:TextBox>
                        </div>
                        <div>

                            <asp:Button ID="btnEnviar" runat="server" Text="Enviar" class="tm-btn-primary tm-align-right" />
                        </div>

                    </div>
                </div>

            </div>
        </div>
        <footer class="tm-site-footer">
            <p class="tm-black-bg tm-footer-text">
                Café "Las Olas" - Año 2024

      
      | Diseño: <a href="#" class="tm-footer-link" rel="sponsored" target="_parent">Ariel Zulián</a>


            </p>
            <br />
            <a href="backoffice.aspx" class="tm-footer-link">Ir al Back-Office</a>
        </footer>


        <!-- Background video -->
        <div class="tm-video-wrapper">
            <i id="tm-video-control-button" class="fas fa-pause"></i>
            <video autoplay="" muted="" loop="" id="tm-video">
                <source src="video/wave-cafe-video-bg.mp4" type="video/mp4" />
            </video>
        </div>

        <script src="js/jquery-3.4.1.min.js"></script>
        <%--<script>

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

        </script>--%>


       <%-- <script>
            $('.tm-pedido').on('click', function (event) {
                event.preventDefault();

                $('.A-Pedido').each(function () {
                    const visibility = $(this).css('visibility');
                    $(this).css('visibility', visibility === 'hidden' ? 'visible' : 'hidden');
                });

                const spanText = $('#btnPedido span').text();
                $('#btnPedido span').text(spanText === 'Hacer Pedido' ? 'Cancelar Pedido' : 'Hacer Pedido');

                
            });
        </script>--%>

        <script src="./Scripts/index.js"></script>
    </form>
    
</body>
</html>
