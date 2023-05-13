<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My ONLYFAN Code</title>
    <link rel="stylesheet" href="style/css/home_user_style.css" />
    <link rel="stylesheet" href="style/font/fontawesome-free-6.3.0-web/css/all.min.css" />
    <script src="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js"></script>
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
      <div id="qrcode" class="qrcode">
        <div class="qr_info">
          <p>${sessionScope.customer.fullname}</p>
          <p>${sessionScope.customer.phone}</p>
        </div>
      </div>
      <script>
        var qrcode = new QRCode(document.getElementById("qrcode"), {
          text: "${sessionScope.customer.phone}",
          width: 300,
          height: 300,
          colorDark: "#61678B",
          colorLight: "#ffffff",
          correctLevel: QRCode.CorrectLevel.H,
        });
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
          .eq(2)
          .prepend("<div class='point'></div>");
        $("#header").find(".header_title").find("p").text("My QRcode");
      });
    });
  </script>

  </html>