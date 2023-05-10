<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home Page</title>
    <link rel="stylesheet" href="style/css/home_user_style.css" />
    <link rel="stylesheet" href="style/font/fontawesome-free-6.3.0-web/css/all.min.css" />
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
          <div class="content">
            <div class="content_info">
              <div class="content_info-main">
                <p class="content_info-num">${sessionScope.customer.phone}</p>
                <div class="content_info-mon">
                  <p>${sessionScope.customer.balance}</p>
                  <p>VND</p>
                  <i class="fa-solid fa-eye"></i>
                </div>
                <a href="transaction_user.jsp">
                  <div class="content_info-tran">
                    <i class="fa-solid fa-arrow-right"></i>Transaction
                  </div>
                </a>
              </div>
              <a href="">
                <div class="content_info-show">
                  <i class="fa-solid fa-chevron-right"></i>
                </div>
              </a>
            </div>
            <div class="content_menu">
              <a href="transaction_user.jsp">
                <div class="content_menu-item">
                  <i class="fa-solid fa-right-left"></i>
                  <p>Transaction</p>
                </div>
              </a><a href="myqrcode.jsp">
                <div class="content_menu-item">
                  <i class="fa-solid fa-qrcode"></i>
                  <p>My QRcode</p>
                </div>
              </a><a href="qrcode.jsp">
                <div class="content_menu-item">
                  <i class="fa-solid fa-barcode"></i>
                  <p>QRcode</p>
                </div>
              </a><a href="card.jsp">
                <div class="content_menu-item">
                  <i class="fa-solid fa-credit-card"></i>
                  <p>Card service</p>
                </div>
              </a>
              <a href="history_user.jsp">
                <div class="content_menu-item">
                  <i class="fa-solid fa-clock-rotate-left"></i>
                  <p>History</p>
                </div>
              </a><a href="saving_user.jsp">
                <div class="content_menu-item">
                  <i class="fa-solid fa-piggy-bank"></i>
                  <p>Saving</p>
                </div>
              </a><a href="account_user.jsp">
                <div class="content_menu-item">
                  <i class="fa-solid fa-user"></i>
                  <p>Account</p>
                </div>
              </a>
              <a href="support.jsp">
                <div class="content_menu-item">
                  <i class="fa-solid fa-phone-volume"></i>
                  <p>Hotline</p>
                </div>
              </a>
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
          .eq(0)
          .prepend("<div class='point'></div>");
      });
    });
  </script>

  </html>