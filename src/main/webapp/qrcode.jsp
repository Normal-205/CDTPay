<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Show us your face</title>
    <link rel="stylesheet" href="style/css/home_user_style.css" />
    <link rel="stylesheet" href="style/font/fontawesome-free-6.3.0-web/css/all.min.css" />
    <script src="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jsqr/dist/jsQR.min.js"></script>

    <link rel="icon" href="data:;base64,iVBORw0KGgo=" />
  </head>

  <body>
  <!-- Check session -->
    <% if(null==session.getAttribute("customer")){ %>
      <script>
        window.location.href = "login.jsp";
      </script>
      <% }else{ %>
        <script>
          console.log("OKE, has session");
        </script>
        <% } %>
          <!-- End check -->
    <div id="header"></div>

    <div class="content_qrcode">
      <video id="videoElement" class="hiden"></video>

      <canvas id="canvasElement"></canvas>
      <div class="note">Move your camera to where QR code located</div>

      <script>
        const video = document.getElementById("videoElement");
        const canvas = document.getElementById("canvasElement");
        const ctx = canvas.getContext("2d");
        let isMobile = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);

        if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
          navigator.mediaDevices
            .getUserMedia({
              video: {
                facingMode: isMobile
                  ? {
                    exact: "environment",
                  }
                  : "user",
              },
            })
            .then((stream) => {
              video.srcObject = stream;
              video.play();
              requestAnimationFrame(tick);
            })
            .catch((error) => {
              console.log("Error accessing camera:", error);
            });
        } else {
          console.log("getUserMedia() is not supported.");
        }

        function tick() {
          if (video.videoWidth === 0 || video.videoHeight === 0) {
            requestAnimationFrame(tick);
            return;
          }
          canvas.width = video.videoWidth;
          canvas.height = video.videoHeight;
          ctx.drawImage(video, 0, 0, canvas.width, canvas.height);
          const imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
          const code = jsQR(imageData.data, imageData.width, imageData.height);
          var scannedValue;
          if (code) {
        	  scannedValue = code.data;
        	  sessionStorage.setItem('qrCodeValue', scannedValue);
        	  window.location.href = "transaction_user.jsp";
            // Xử lý mã QR tại đây
          }
          requestAnimationFrame(tick);
        }
      </script>
    </div>
  </body>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.min.js"></script>
  <script>
    $(document).ready(function () {
      $("#header").load("layout.jsp", function () {
        $("#header")
          .find(".navbar_item")
          .eq(3)
          .prepend("<div class='point'></div>");
        $("#header").find(".header_title").find("p").text("QRcode");
      });
    });
  </script>

  </html>