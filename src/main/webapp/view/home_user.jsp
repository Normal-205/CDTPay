<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="style/css/home_user_style.css" />
    <link rel="stylesheet" href="style/font/fontawesome-free-6.3.0-web/css/all.min.css"/>
  </head>
  <body>
    <div class="navbar">
      <div class="navbar_logo"><h1>CDTPay</h1></div>
      <ul class="navbar_items">
        <li class="navbar_item">
          <div class="point"></div>
          <a href="#"><i class="fa-solid fa-house"></i>Home</a>
        </li>
        <li class="navbar_item">
          <a href="transaction_user.jsp"
            ><i class="fa-solid fa-right-left"></i>Transaction</a
          >
        </li>
        <li class="navbar_item">
          <a href="myqrcode.jsp"><i class="fa-solid fa-qrcode"></i>My QRcode</a>
        </li>
        <li class="navbar_item">
          <a href="qrcode.jsp"
            ><i class="fa-sharp fa-solid fa-barcode"></i>QR code</a
          >
        </li>
        <li class="navbar_item">
          <a href="card.jsp"
            ><i class="fa-solid fa-credit-card"></i>Card service</a
          >
        </li>
        <li class="navbar_item">
          <a href="history_user.jsp"
            ><i class="fa-solid fa-clock-rotate-left"></i>History</a
          >
        </li>
        <li class="navbar_item">
          <a href="saving_user.jsp"
            ><i class="fa-solid fa-piggy-bank"></i>Saving</a
          >
        </li>
        <li class="navbar_item">
          <a href="account_user.jsp"><i class="fa-solid fa-user"></i>Account</a>
        </li>
        <li class="navbar_item">
          <a href="support.jsp"
            ><i class="fa-solid fa-phone-volume"></i>Hotline</a
          >
        </li>
      </ul>
    </div>
    <div class="header">
      <div class="header_title"><p>Home</p></div>
      <div class="header_user">
        <img
          src="style/img/page's avatar.png"
          alt=""
        />
        <p>PHAM DUY THANH DAN</p>
        <i class="fa-sharp fa-solid fa-chevron-down"></i>

        <div class="header_dropdown">
          <ul class="header_dropdown_items">
            <li class="header_dropdown_item">
              <a href=""><i class="fa-solid fa-user"></i>Account</a>
            </li>
            <li class="header_dropdown_item">
              <a href=""
                ><i class="fa-solid fa-arrow-right-from-bracket"></i>Log out</a
              >
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="content">
      <div class="content_info">
        <div class="content_info-main">
          <p class="content_info-num">0368808518</p>
          <div class="content_info-mon">
            <p>********</p>
            <p>VND</p>
            <i class="fa-solid fa-eye"></i>
          </div>
          <a href=""
            ><div class="content_info-tran">
              <i class="fa-solid fa-arrow-right"></i>Transaction
            </div></a
          >
        </div>
        <a href=""
          ><div class="content_info-show">
            <i class="fa-solid fa-chevron-right"></i></div
        ></a>
      </div>
      <div class="content_menu">
        <a href="transaction_user.jsp">
          <div class="content_menu-item">
            <i class="fa-solid fa-right-left"></i>
            <p>Transaction</p>
          </div> </a
        ><a href="myqrcode.jsp">
          <div class="content_menu-item">
            <i class="fa-solid fa-qrcode"></i>
            <p>My QRcode</p>
          </div></a
        ><a href="qrcode.jsp">
          <div class="content_menu-item">
            <i class="fa-solid fa-barcode"></i>
            <p>QRcode</p>
          </div></a
        ><a href="card.jsp">
          <div class="content_menu-item">
            <i class="fa-solid fa-credit-card"></i>
            <p>Card service</p>
          </div></a
        >
        <a href="history_user.jsp"
          ><div class="content_menu-item">
            <i class="fa-solid fa-clock-rotate-left"></i>
            <p>History</p>
          </div></a
        ><a href="saving_user.jsp">
          <div class="content_menu-item">
            <i class="fa-solid fa-piggy-bank"></i>
            <p>Saving</p>
          </div></a
        ><a href="account_user.jsp">
          <div class="content_menu-item">
            <i class="fa-solid fa-user"></i>
            <p>Account</p>
          </div></a
        ><a href="support.jsp">
          <div class="content_menu-item">
            <i class="fa-solid fa-phone-volume"></i>
            <p>Hotline</p>
          </div></a
        >
      </div>
    </div>
  </body>
</html>
