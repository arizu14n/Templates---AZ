<%@ Page Language="VB" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="Templates___AZ.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Login</title>
     <link rel="stylesheet" href="fontawesome/css/all.min.css"/> <!-- https://fontawesome.com/ -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" /> <!-- https://fonts.google.com/ -->
    <link rel="stylesheet" href="css/tooplate-wave-cafe.css"/>
</head>
<body>
    <form id="LoginForm" runat="server">
          <div class="tm-container">
        <div id="login" class="tm-page-content">
            <div class="tm-black-bg tm-contact-text-container">
              <h2 class="tm-text-primary">Ingreso al Back-Office</h2>
              <p>Debes autenticarte para poder realizar modificaciones al sitio</p>
                <a href="index.aspx" class="tm-footer-link" >Regresar a Página de Inicio</a>
            </div>
            <div class="tm-black-bg tm-contact-form-container tm-align-right">
             
                <div class="tm-form-group">
             
                    <asp:Label ID="Label1" runat="server" class="tm-form-control" Text="Usuario"></asp:Label>
                    <asp:TextBox ID="txt_Usuario" runat="server" class="tm-form-control" placeholder="Ingrese usuario" required="" ></asp:TextBox>
                </div>
                <div class="tm-form-group">
                  
                    <asp:Label ID="Label2" runat="server" class="tm-form-control" Text="Contraseña"></asp:Label>
                    <asp:TextBox ID="txt_Contra" runat="server" class="tm-form-control" placeholder="Ingrese contraseña" TextMode="Password" required="" ></asp:TextBox>
                </div>        
                <asp:Label ID="lbl_Respuesta" runat="server" Text=""></asp:Label>
                <div>
                 
                    <asp:Button ID="btn_Login" runat="server" Text="Ingresar" class="tm-btn-primary tm-align-right" OnClick="btn_Login_Click"/>
                </div>
            
            </div>







    
        <!-- Background video -->
  <div class="tm-video-wrapper">
      <i id="tm-video-control-button" class="fas fa-pause"></i>
      <video autoplay="" muted="" loop="" id="tm-video">
          <source src="video/wave-cafe-video-bg.mp4" type="video/mp4"/>
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
    
      
  </script>
              </div>
    </form>
      
</body>
</html>

