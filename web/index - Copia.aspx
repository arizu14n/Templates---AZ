<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="Templates___AZ.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Café "Las Olas"</title>
    <link rel="stylesheet" href="fontawesome/css/all.min.css"/> <!-- https://fontawesome.com/ -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" /> <!-- https://fonts.google.com/ -->
    <link rel="stylesheet" href="css/tooplate-wave-cafe.css"/>
<!--
Tooplate 2121 Wave Cafe
https://www.tooplate.com/view/2121-wave-cafe
-->
</head>
<body>
    <form id="form1" runat="server">
        <div class="tm-container">
    <div class="tm-row">
      <!-- Site Header -->
      <div class="tm-left">
        <div class="tm-left-inner">
          <div class="tm-site-header">
            <i class="fas fa-coffee fa-3x tm-site-logo"></i>
            <h1 class="tm-site-name">Café "Las Olas"</h1>
          </div>
          <nav class="tm-site-nav">
            <ul class="tm-site-nav-ul">
              <li class="tm-page-nav-item">
                <a href="#drink" class="tm-page-link active">
                  <i class="fas fa-mug-hot tm-page-link-icon"></i>
                  <span>Bebidas</span>
                </a>
              </li>
              <li class="tm-page-nav-item">
                <a href="#about" class="tm-page-link">
                  <i class="fas fa-users tm-page-link-icon"></i>
                  <span>Nosotros</span>
                </a>
              </li>
              <li class="tm-page-nav-item">
                <a href="#special" class="tm-page-link">
                  <i class="fas fa-glass-martini tm-page-link-icon"></i>
                  <span>Especiales</span>
                </a>
              </li>
              <li class="tm-page-nav-item">
                <a href="#contact" class="tm-page-link">
                  <i class="fas fa-comments tm-page-link-icon"></i>
                  <span>Contacto</span>
                </a>
              </li>
            </ul>
          </nav>
        </div>        
      </div>
      <div class="tm-right">
        <main class="tm-main">
          <div id="drink" class="tm-page-content">
            <!-- Drink Menu Page -->
            <nav class="tm-black-bg tm-drinks-nav">
              <ul>
                <li>
                  <a href="#" class="tm-tab-link active" data-id="cold">Café Frío</a>
                </li>
                <li>
                  <a href="#" class="tm-tab-link" data-id="hot">Café Caliente</a>
                </li>
                <li>
                  <a href="#" class="tm-tab-link" data-id="juice">Jugos de Frutas</a>
                </li>
              </ul>
            </nav>

            <div id="cold" class="tm-tab-content">
              <div class="tm-list">
                <div class="tm-list-item">          
                  <img src="img/iced-americano.png" alt="Image" class="tm-list-item-img">
                  <div class="tm-black-bg tm-list-item-text">
                    <h3 class="tm-list-item-name">Americano<span class="tm-list-item-price">$ 1025</span></h3>
                    <p class="tm-list-item-description">Café expreso con agua fría y hielo.</p>
                  </div>
                </div>
                <div class="tm-list-item">          
                  <img src="img/iced-cappuccino.png" alt="Image" class="tm-list-item-img"/>
                  <div class="tm-black-bg tm-list-item-text">
                    <h3 class="tm-list-item-name">Cappuccino<span class="tm-list-item-price">$ 1250</span></h3>
                    <p class="tm-list-item-description">Expreso, leche fría espumada y hielo.</p>
                  </div>
                </div>
                <div class="tm-list-item">          
                  <img src="img/iced-espresso.png" alt="Image" class="tm-list-item-img"/>
                  <div class="tm-black-bg tm-list-item-text">
                    <h3 class="tm-list-item-name">Espresso<span class="tm-list-item-price">$ 1425</span></h3>
                    <p class="tm-list-item-description">Expreso simple servido con hielo.</p>
                  </div>
                </div>
                <div class="tm-list-item">          
                  <img src="img/iced-latte.png" alt="Image" class="tm-list-item-img">
                  <div class="tm-black-bg tm-list-item-text">
                    <h3 class="tm-list-item-name">Latte<span class="tm-list-item-price">$ 1150</span></h3>
                    <p class="tm-list-item-description">Expreso con mucha leche fría y hielo.<a href="https://www.tooplate.com/contact" rel="nofollow" target="_parent">contact Tooplate</a> if you have anything to ask.</p>
                  </div>
                </div> 
                                       
              </div>
            </div> 

            <div id="hot" class="tm-tab-content">
              <div class="tm-list">
              
                <div class="tm-list-item">          
                  <img src="img/hot-americano.png" alt="Image" class="tm-list-item-img">
                  <div class="tm-black-bg tm-list-item-text">
                    <h3 class="tm-list-item-name">Americano<span class="tm-list-item-price">$ 850</span></h3>
                    <p class="tm-list-item-description">Café expreso con agua caliente.</p>              
                  </div>
                </div>
                <div class="tm-list-item">          
                  <img src="img/hot-cappuccino.png" alt="Image" class="tm-list-item-img">
                  <div class="tm-black-bg tm-list-item-text">
                    <h3 class="tm-list-item-name">Cappuccino<span class="tm-list-item-price">$ 950</span></h3>
                    <p class="tm-list-item-description">Expreso, leche caliente y espuma.</p>                    
                  </div>
                </div>
                <div class="tm-list-item">          
                  <img src="img/hot-espresso.png" alt="Image" class="tm-list-item-img">
                  <div class="tm-black-bg tm-list-item-text">
                    <h3 class="tm-list-item-name">Espresso<span class="tm-list-item-price">$ 750</span></h3>
                    <p class="tm-list-item-description">Café concentrado en poca cantidad.</p>              
                  </div>
                </div>
                <div class="tm-list-item">          
                  <img src="img/hot-latte.png" alt="Image" class="tm-list-item-img">
                  <div class="tm-black-bg tm-list-item-text">
                    <h3 class="tm-list-item-name">Latte<span class="tm-list-item-price">$ 650</span></h3>
                    <p class="tm-list-item-description">Expreso con mucha leche caliente.</p>              
                  </div>
                </div>
                         
              </div>
            </div>

            <div id="juice" class="tm-tab-content">
              <div class="tm-list">
                <div class="tm-list-item">          
                  <img src="img/smoothie-1.png" alt="Image" class="tm-list-item-img"/>
                  <div class="tm-black-bg tm-list-item-text">
                    <h3 class="tm-list-item-name">Smoothie de Frutillas<span class="tm-list-item-price">$ 1250</span></h3>
                    <p class="tm-list-item-description">Licuado de frutillas, leche y hielo.</p>              
                  </div>
                </div>
                <div class="tm-list-item">          
                  <img src="img/smoothie-2.png" alt="Image" class="tm-list-item-img"/>
                  <div class="tm-black-bg tm-list-item-text">
                    <h3 class="tm-list-item-name">Smoothie de Frutos Rojos<span class="tm-list-item-price">$ 1450</span></h3>
                    <p class="tm-list-item-description">Licuado de frutos rojos, leche y hielo.</p>                    
                  </div>
                </div>
                <div class="tm-list-item">          
                  <img src="img/smoothie-3.png" alt="Image" class="tm-list-item-img"/>
                  <div class="tm-black-bg tm-list-item-text">
                    <h3 class="tm-list-item-name">Smoothie de Ananá<span class="tm-list-item-price">$ 1650</span></h3>
                    <p class="tm-list-item-description">Licuado de ananá, leche y hielo.</p>              
                  </div>
                </div>
                <div class="tm-list-item">          
                  <img src="img/smoothie-4.png" alt="Image" class="tm-list-item-img"/>
                  <div class="tm-black-bg tm-list-item-text">
                    <h3 class="tm-list-item-name">Smoothie de Espinaca<span class="tm-list-item-price">$1850</span></h3>
                    <p class="tm-list-item-description">Licuado de espinaca, leche y hielo.</p>              
                  </div>
                </div>              
              </div>
            </div>
            <!-- end Drink Menu Page -->
          </div>
            
          <!-- About Us Page -->
          <div id="about" class="tm-page-content">
            <div class="tm-black-bg tm-mb-20 tm-about-box-1">              
              <h2 class="tm-text-primary tm-about-header">Café "Las Olas"</h2>
              <div class="tm-list-item tm-list-item-2">                
                <img src="img/about-1.png" alt="Image" class="tm-list-item-img tm-list-item-img-big">
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
                <img src="img/about-2.png" alt="Image" class="tm-list-item-img tm-list-item-img-big tm-img-right"/>                
              </div>
              <p>Nuestro presente nos posiciona como un referente en la cafetería de la ciudad. Y nuestro futuro es aún más prometedor.</p>
            </div>
          </div>
          <!-- end About Us Page -->

          <!-- Special Items Page -->
          <div id="special" class="tm-page-content">
            <div class="tm-special-items">
              <div class="tm-black-bg tm-special-item">
                <img src="img/special-01.jpg" alt="Image"/>
                <div class="tm-special-item-description"/>
                  <h2 class="tm-text-primary tm-special-item-title">Jugos Naturales</h2>
                  <p class="tm-special-item-text">Jugos exprimidos de las más ricas frutas. Elaboración a la vista. Variedad de sabores.</p>  
                </div>
              </div>
              <div class="tm-black-bg tm-special-item">
                <img src="img/special-02.jpg" alt="Image"/>
                <div class="tm-special-item-description">
                  <h2 class="tm-text-primary tm-special-item-title">Panadería</h2>
                  <p class="tm-special-item-text">Los más ricos panificados, elaborados en el día y con las mejores recetas.</p>  
                </div>
              </div>
              <div class="tm-black-bg tm-special-item">
                <img src="img/special-03.jpg" alt="Image">
                <div class="tm-special-item-description">
                  <h2 class="tm-text-primary tm-special-item-title">Comidas Rápidas</h2>
                  <p class="tm-special-item-text">Ofrecemos deliciosas hamburguesas y sandwiches, preparados con ingredientes de primera calidad.</p>  
                </div>
              </div>
              <div class="tm-black-bg tm-special-item">
                <img src="img/special-04.jpg" alt="Image">
                <div class="tm-special-item-description">
                  <h2 class="tm-text-primary tm-special-item-title">Postres</h2>
                  <p class="tm-special-item-text">Para brindar una experiencia completa, también ofrecemos los más deliciosos postres. ¡No te los pierdas!.</p>  
                </div>
              </div>      
              <div class="tm-black-bg tm-special-item">
                <img src="img/special-05.jpg" alt="Image">
                <div class="tm-special-item-description">
                  <h2 class="tm-text-primary tm-special-item-title">Tragos Exclusivos</h2>
                  <p class="tm-special-item-text">A la hora de brindar, también te brindamos una colección única de tragos para que disfrutes los mejores momentos.</p>  
                </div>
              </div>
              <div class="tm-black-bg tm-special-item">
                <img src="img/special-06.jpg" alt="Image">
                <div class="tm-special-item-description">
                  <h2 class="tm-text-primary tm-special-item-title">Menú Especial</h2>
                  <p class="tm-special-item-text">Ofrecemos también menú para vegetarianos, veganos y celíacos.</p>  
                </div>
              </div>                      
            </div>            
          </div>
          <!-- end Special Items Page -->

          <!-- Contact Page -->
          <div id="contact" class="tm-page-content">
            <div class="tm-black-bg tm-contact-text-container">
              <h2 class="tm-text-primary">Contáctanos</h2>
              <p>Háznos llegar tus sugerencias. O también puedes reservar un salón para tu evento especial</p>
            </div>
            <div class="tm-black-bg tm-contact-form-container tm-align-right">
              <form action="" method="POST" id="contact-form">
                <div class="tm-form-group">
                  <%--<input type="text" name="name" class="tm-form-control" placeholder="Nombre" required="" />--%>
                    
                    <asp:TextBox ID="txtNombre" runat="server" class="tm-form-control" placeholder="Nombre" required="" ></asp:TextBox>
                </div>
                <div class="tm-form-group">
                  <%--<input type="email" name="email" class="tm-form-control" placeholder="Email" required="" />--%>
                    
                    <asp:TextBox ID="txtMail" runat="server" class="tm-form-control" placeholder="Email" required="" ></asp:TextBox>
                </div>        
                <div class="tm-form-group tm-mb-30">
                  <%--<textarea rows="6" name="message" class="tm-form-control" placeholder="Mensaje" required=""></textarea>--%>
                    
                    <asp:TextBox ID="txtMensaje" runat="server" class="tm-form-control" placeholder="Mensaje" required="" ></asp:TextBox>
                </div>        
                <div>
                  <%--<button type="submit" class="tm-btn-primary tm-align-right">Enviar</button>--%>
                    <asp:Button ID="btnEnviar" runat="server" Text="Enviar" class="tm-btn-primary tm-align-right" />
                </div>
              </form>
            </div>
          </div>
          <!-- end Contact Page -->
        </main>
      </div>    
    </div>
    <footer class="tm-site-footer">
      <p class="tm-black-bg tm-footer-text">Café "Las Olas" - Año 2024
      
      | Diseño: <a href="https://www.tooplate.com" class="tm-footer-link" rel="sponsored" target="_parent">Ariel Zulián</a></p>
    </footer>
  </div>
    
  <!-- Background video -->
  <div class="tm-video-wrapper">
      <i id="tm-video-control-button" class="fas fa-pause"></i>
      <video autoplay muted loop id="tm-video">
          <source src="video/wave-cafe-video-bg.mp4" type="video/mp4">
      </video>
  </div>

  <script src="js/jquery-3.4.1.min.js"></script>    
  <script>

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

      if(pageId) {
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

    $(document).ready(function(){

      /***************** Pages *****************/

      initPage();

      $('.tm-page-link').click(function(event) {
        
        if(window.innerWidth > 991) {
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
      window.onresize = function(){
        clearTimeout(timeout);
        timeout = setTimeout(setVideoSize, 100);
      };

      // Play/Pause button for video background      
      const btn = $("#tm-video-control-button");

      btn.on("click", function(e) {
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
      
  </script>
    </form>
</body>
</html>
