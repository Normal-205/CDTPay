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
    <div class="navbar">
      <div class="navbar_logo">
        <h1>CDTPay</h1>
      </div>
      <ul class="navbar_items">
        <li class="navbar_item">
          <a href="home_user.jsp"><i class="fa-solid fa-house"></i>Home</a>
        </li>
        <li class="navbar_item">
          <a href="transaction_user.jsp"><i class="fa-solid fa-right-left"></i>Transaction</a>
        </li>
        <li class="navbar_item">
          <a href="myqrcode.jsp"><i class="fa-solid fa-qrcode"></i>My QRcode</a>
        </li>
        <li class="navbar_item">
          <a href="qrcode.jsp"><i class="fa-sharp fa-solid fa-barcode"></i>QR code</a>
        </li>
        <li class="navbar_item">
          <a href="card.jsp"><i class="fa-solid fa-credit-card"></i>Card service</a>
        </li>
        <li class="navbar_item">
          <a href="history_user.jsp"><i class="fa-solid fa-clock-rotate-left"></i>History</a>
        </li>
        <li class="navbar_item">
          <a href="saving_user.jsp"><i class="fa-solid fa-piggy-bank"></i>Saving</a>
        </li>
        <li class="navbar_item">
          <a href="account_user.jsp"><i class="fa-solid fa-user"></i>Account</a>
        </li>
        <li class="navbar_item">
          <a href="support.jsp"><i class="fa-solid fa-phone-volume"></i>Hotline</a>
        </li>
      </ul>
    </div>
    <div class="header">
      <div class="header_title">
        <p>Home</p>
      </div>
      <div class="header_user">
        <img src="./style/img/page's avatar.png" alt="" />
        <p>${sessionScope.customer.fullname}</p>
        <i class="fa-sharp fa-solid fa-chevron-down"></i>

        <div class="header_dropdown">
          <ul class="header_dropdown_items">
            <li class="header_dropdown_item">
              <a href="account_user.jsp"><i class="fa-solid fa-user"></i>Account</a>
            </li>
            <li class="header_dropdown_item">
              <a href="LoginServlet"><i class="fa-solid fa-arrow-right-from-bracket"></i>Log out</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </body>

  </html>