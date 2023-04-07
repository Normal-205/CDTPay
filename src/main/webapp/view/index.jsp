<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@page import="java.util.Calendar"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="style/css/index_style.css" />
    <link
      rel="stylesheet"
      href="style/font/fontawesome-free-6.3.0-web/css/all.min.css"
    />
  </head>
  <body>
    <header class="header">
      <div class="header__logo">CDT</div>
      <div class="header__nav">
        <ul class="header__nav-items">
          <a href="#slide"><li class="header__nav-item">HOME</li></a>
          <a href="#vission"><li class="header__nav-item">VISSION</li></a>
          <a href="#mission"><li class="header__nav-item">MISSION</li></a>
          <a href="#aboutus"><li class="header__nav-item">ABOUT US</li></a>
        </ul>
      </div>
      <div class="header__login">
        <a href="login.jsp"><button>Login</button></a>
      </div>
    </header>
    <div class="slide" id="slide">
      <div class="imgs">
        <img src="./ULSA IT.png" alt="" class="img" />
        <img src="./ULSA IT.png" alt="" class="img" />
        <img src="./ULSA IT.png" alt="" class="img" />
      </div>
      <div class="slide__dots">
        <div class="slide__dot slide-taget"></div>
        <div class="slide__dot"></div>
        <div class="slide__dot"></div>
      </div>
    </div>
    <div class="vission" id="vission">
      <div class="vission__img"></div>
      <div class="vission__content">
        <p class="vission__title">CDT Pay's vision</p>
        <p class="vission__txt">
          CDT Pay's vision is to become a leading financial institution in the
          region, offering innovative and customer-centric banking solutions.
          The bank aims to provide its customers with a seamless banking
          experience by leveraging the latest technology and ensuring the
          highest standards of service quality.
        </p>
        <button class="btn__showall">Xem chi tiết</button>
      </div>
    </div>
    <div class="mission" id="mission">
      <div class="mission__content">
        <p class="mission__title">CDT Pay's mision</p>
        <p class="mission__txt">
          CDT Pay's mission is to provide breakthrough financial solutions and
          meet customers' needs to the best possible extent. The bank is
          committed to delivering high-quality financial products and services,
          enabling customers to achieve their financial goals.
        </p>
        <button class="btn__showall">Xem chi tiết</button>
      </div>
      <div class="mission__img"></div>
    </div>
    <div class="aboutus" id="aboutus">
      <div class="aboutus__title">The Creators of CDT Pay</div>
      <div class="aboutus__content">
        <div class="aboutus__item">
          <img
            src="https://scontent.fhan5-8.fna.fbcdn.net/v/t39.30808-6/325393360_729245461914335_3664016762843441654_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=RWUApxAoSdkAX_s4r3y&_nc_ht=scontent.fhan5-8.fna&oh=00_AfDTz26BjODgeq0kEYV5-_5CA0S9GbjltsU3J_euBLMKvA&oe=640A17A0"
            alt=""
            class="aboutus__item-img"
          />
          <p class="aboutus__item-ceo">CEO</p>
          <p class="aboutus__item-name">NGUYỄN THÀNH CHUNG</p>
        </div>
        <div class="aboutus__item">
          <img
            src="https://scontent.fhan5-9.fna.fbcdn.net/v/t1.6435-9/132339848_1082217975562826_8163229432639064333_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=pRxSLf5LwYoAX_xE26u&_nc_oc=AQk0UsaY8Ydup1-l-G0o4ZAZkuRteetFsXpt4oWnaDL3hWWG2gPSBXFpdz9DhpMsoVw&_nc_ht=scontent.fhan5-9.fna&oh=00_AfCKNMLbqZVkjewmDpnNyaYEDZnd4f1K6gl8kjYNvXt0AQ&oe=642D559D"
            alt=""
            class="aboutus__item-img"
          />
          <p class="aboutus__item-ceo">CEO</p>
          <p class="aboutus__item-name">NGUYỄN HỮU THƯỜNG</p>
        </div>
        <div class="aboutus__item">
          <img
            src="https://scontent.fhan5-9.fna.fbcdn.net/v/t1.6435-9/131949286_1057344984733543_1461980836764487632_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=iNrYHDPv__YAX_0E7aY&_nc_ht=scontent.fhan5-9.fna&oh=00_AfDYw5yACUNs_BW3wbyxV0bR-dYKH0kF6U-eWAFEY4jJiQ&oe=642D50D5"
            alt=""
            class="aboutus__item-img"
          />
          <p class="aboutus__item-ceo">CEO</p>
          <p class="aboutus__item-name">PHẠM ĐẠT THÀNH DUY</p>
        </div>
      </div>
    </div>
    <div class="testimonals">
      <div class="testimonals__title">Endorsements</div>
      <div class="testimonals__slide">
        <div class="testimonals__item">
          <p class="testimonals__item-txt">"Tin chuẩn chưa anh?"</p>
          <p class="testimonals__item-name">CEO.NGUYỄN HỮU THƯỜNG</p>
          <img
            src="https://scontent.fhan5-9.fna.fbcdn.net/v/t1.6435-9/132339848_1082217975562826_8163229432639064333_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=pRxSLf5LwYoAX_xE26u&_nc_oc=AQk0UsaY8Ydup1-l-G0o4ZAZkuRteetFsXpt4oWnaDL3hWWG2gPSBXFpdz9DhpMsoVw&_nc_ht=scontent.fhan5-9.fna&oh=00_AfCKNMLbqZVkjewmDpnNyaYEDZnd4f1K6gl8kjYNvXt0AQ&oe=642D559D"
            alt=""
            class="testimonals__item-img"
          />
        </div>
        <div class="testimonals__item blnone">
          <p class="testimonals__item-txt">
            â ufhsadhfsaoidhfsoahfsaoihfo
            siahfiosahdfiohsafashdofihsadiofhsadohfsoifhsdaofhsodhfsdiohfsidofhs
            oidhfsdiofhsdoihfsdoihfsodihfoisdhfoisdhfosdhfo â
          </p>
          <p class="testimonals__item-name">CEO.NGUYỄN THÀNH CHUNG</p>
          <img
            src="https://scontent.fhan5-8.fna.fbcdn.net/v/t39.30808-6/325393360_729245461914335_3664016762843441654_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=RWUApxAoSdkAX_s4r3y&_nc_ht=scontent.fhan5-8.fna&oh=00_AfDTz26BjODgeq0kEYV5-_5CA0S9GbjltsU3J_euBLMKvA&oe=640A17A0"
            alt=""
            class="testimonals__item-img"
          />
        </div>
        <div class="testimonals__item blnone">
          <p class="testimonals__item-txt">
            â ufhsadhfsaoidhfsoahfsaoihfo
            siahfiosahdfiohsafashdofihsadiofhsadohfsoifhsdaofhsodhfsdiohfsidofhs
            oidhfsdiofhsdoihfsdoihfsodihfoisdhfoisdhfosdhfo â
          </p>
          <p class="testimonals__item-name">CEO.PHẠM ĐẠT THÀNH DUY</p>
          <img
            src="https://scontent.fhan5-9.fna.fbcdn.net/v/t1.6435-9/131949286_1057344984733543_1461980836764487632_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=iNrYHDPv__YAX_0E7aY&_nc_ht=scontent.fhan5-9.fna&oh=00_AfDYw5yACUNs_BW3wbyxV0bR-dYKH0kF6U-eWAFEY4jJiQ&oe=642D50D5"
            alt=""
            class="testimonals__item-img"
          />
        </div>
      </div>
      <div class="testimonals__dots">
        <div class="testimonals__dot taget"></div>
        <div class="testimonals__dot"></div>
        <div class="testimonals__dot"></div>
      </div>
    </div>
    <div class="footer">
      <div class="footer__info">
        <div class="footer__info-title">
          Get connected with us on social networks:
        </div>
        <div class="footer__info-icons">
          <a href=""><i class="fa-brands fa-facebook-f"></i></a>
          <a href=""><i class="fa-brands fa-twitter"></i></a>
          <a href=""><i class="fa-brands fa-google"></i></a>
          <a href=""><i class="fa-brands fa-instagram"></i></a>
          <a href=""><i class="fa-brands fa-github"></i></a>
        </div>
      </div>
      <hr />
      <div class="footer__menu">
        <div class="footer__menu-info">
          <div class="footer__menu-title">
            <img
              src="./fontawesome-free-6.3.0-web/Sparkling Diamond.png"
              alt=""
            />
            CDTPay
          </div>
          <p>
            CDT Pay is a leading financial institution committed to providing
            innovative financial solutions and exceptional customer service.
            Founded by a team of experienced professionals, the bank offers a
            wide range of financial products and services, including personal
            and business banking, investment management, and wealth management.
          </p>
        </div>
        <div class="footer__menu-menu">
          <div class="footer__menu-title">Menu</div>
          <div class="footer__menu-menu-items">
            <div>Home</div>
            <div>Vission</div>
            <div>Mission</div>
            <div>About Us</div>
          </div>
        </div>
        <div class="footer__menu-address">
          <div class="footer__menu-title">Contact</div>
          <div class="footer__menu-address-items">
            <div>
              <i class="fa-sharp fa-solid fa-location-dot"></i> 43, Trần Duy
              Hưng,<br />
              Trung Hoà, Cầu Giấy, Hà Nội
            </div>
            <div><i class="fa-solid fa-envelope"></i>ulsait@gmail.com</div>
            <div><i class="fa-solid fa-phone"></i>0123456789</div>
            <div><i class="fa-solid fa-print"></i>0123456789</div>
          </div>
        </div>
        <div class="footer__menu-map">
          <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.510331682322!2d105.80005364996701!3d21.01225689364989!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab5f7e8677a7%3A0xe8e81820d9c9ed9b!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBMYW8gxJHhu5luZyAtIFjDoyBo4buZaQ!5e0!3m2!1svi!2s!4v1678155707930!5m2!1svi!2s"
            width="350"
            height="200"
            style="border: 0"
            allowfullscreen=""
            loading="lazy"
            referrerpolicy="no-referrer-when-downgrade"
          ></iframe>
        </div>
      </div>
    </div>
    <footer>
      <% // Create a Calendar instance Calendar now = Calendar.getInstance(); //
      Get the current year int year = now.get(Calendar.YEAR); %>
      <p>Copyright <%= year %> CDTPay. All rights reserved.</p>
    </footer>
  </body>
</html>
