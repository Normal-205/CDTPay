<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="home_user_style.css" />
    <link rel="stylesheet" href="fontawesome-free-6.3.0-web/css/all.min.css" />
  </head>
  <body>
    <div id="header"></div>
    <div class="content_card">
      <div class="card">
        <div class="card_name">
          <p>CDTPay</p>
          <img src="R.png" alt="" />
        </div>

        <img src="icons8-chip-card-80.png" alt="" />
        <p>0368808518</p>
        <p>PHAM DUY THANH DAN</p>
        <div class="since">
          <p>
            MEMBER <br />
            SINCE
          </p>
          <p>03/23</p>
        </div>
      </div>
    </div>
  </body>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.min.js"></script>

  <script>
    $(document).ready(function () {
      $("#header").load("layout.jsp", function () {
        $("#header")
          .find(".navbar_item")
          .eq(4)
          .prepend("<div class='point'></div>");
        $("#header").find(".header_title").find("p").text("Card service");
      });
    });
  </script>
</html>
