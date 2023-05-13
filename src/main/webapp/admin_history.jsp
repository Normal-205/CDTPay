<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="style/css/home_user_style.css" />
    <link rel="stylesheet" href="style/font/fontawesome-free-6.3.0-web/css/all.min.css" />
  </head>

  <body>
    <div id="header"></div>
    <div class="content_history">
    
      <div class="content_time">
        <p>Month 3,2023</p>
        <div class="history_items">
          <div class="history_item">
            <div class="history_item_content">
              <p><span>NGUYEN THANH CHUNG</span> - <span>0123456789</span></p>
              <p>18:20 - 20/03/2023</p>
              <p>PHAM DUY THANH DAN Chuyển khoản</p>
            </div>
            <div class="history_item_money">
              <p><span>-100000</span> <span>VND</span></p>
              <p>CDTPay</p>
            </div>
          </div>
          <div class="history_item">
            <div class="history_item_content">
              <p><span>NGUYEN THANH CHUNG</span> - <span>0123456789</span></p>
              <p>18:20 - 20/03/2023</p>
              <p>PHAM DUY THANH DAN Chuyển khoản</p>
            </div>
            <div class="history_item_money">
              <p><span>-100000</span> <span>VND</span></p>
              <p>CDTPay</p>
            </div>
          </div>
          <div class="history_item">
            <div class="history_item_content">
              <p><span>NGUYEN THANH CHUNG</span> - <span>0123456789</span></p>
              <p>18:20 - 20/03/2023</p>
              <p>PHAM DUY THANH DAN Chuyển khoản</p>
            </div>
            <div class="history_item_money">
              <p><span>-100000</span> <span>VND</span></p>
              <p>CDTPay</p>
            </div>
          </div>
        </div>
      </div>
      <div class="content_time">
        <p>Month 3,2023</p>
        <div class="history_items">
          <div class="history_item">
            <div class="history_item_content">
              <p><span>NGUYEN THANH CHUNG</span> - <span>0123456789</span></p>
              <p>18:20 - 20/03/2023</p>
              <p>PHAM DUY THANH DAN Chuyển khoản</p>
            </div>
            <div class="history_item_money">
              <p><span>-100000</span> <span>VND</span></p>
              <p>CDTPay</p>
            </div>
          </div>
          <div class="history_item">
            <div class="history_item_content">
              <p><span>NGUYEN THANH CHUNG</span> - <span>0123456789</span></p>
              <p>18:20 - 20/03/2023</p>
              <p>PHAM DUY THANH DAN Chuyển khoản</p>
            </div>
            <div class="history_item_money">
              <p><span>-100000</span> <span>VND</span></p>
              <p>CDTPay</p>
            </div>
          </div>
          <div class="history_item">
            <div class="history_item_content">
              <p><span>NGUYEN THANH CHUNG</span> - <span>0123456789</span></p>
              <p>18:20 - 20/03/2023</p>
              <p>PHAM DUY THANH DAN Chuyển khoản</p>
            </div>
            <div class="history_item_money">
              <p><span>-100000</span> <span>VND</span></p>
              <p>CDTPay</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.min.js"></script>

  <script>
    $(document).ready(function () {
      $("#header").load("admin_layout.jsp", function () {
        $("#header")
          .find(".navbar_item")
          .eq(3)
          .prepend("<div class='point'></div>");
        $("#header").find(".header_title").find("p").text("History");
      });
    });
  </script>

  </html>