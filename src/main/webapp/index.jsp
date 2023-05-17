<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@page import="java.util.Calendar" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
          <meta charset="UTF-8" />
          <meta http-equiv="X-UA-Compatible" content="IE=edge" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0" />
          <title>Welcum to CDTPay</title>
          <link rel="stylesheet" href="style/css/index_style.css" />
          <link rel="stylesheet" href="style/font/fontawesome-free-6.3.0-web/css/all.min.css" />
        </head>

        <body>
          <header class="header">
            <div class="header__logo">CDTPay</div>
            <div class="header__nav">
              <ul class="header__nav-items">
                <a href="#slide">
                  <li class="header__nav-item">HOME</li>
                </a>
                <a href="#vission">
                  <li class="header__nav-item">VISSION</li>
                </a>
                <a href="#mission">
                  <li class="header__nav-item">MISSION</li>
                </a>
                <a href="#aboutus">
                  <li class="header__nav-item">ABOUT US</li>
                </a>
              </ul>
            </div>
            <div class="header__login">
              <a href="login.jsp"><button>Login</button></a>
              <a href="admin_login.jsp"><button>Admin Portal</button></a>
            </div>
          </header>
          <div class="slide" id="slide">
            <div class="imgs">
              <img src="style/img/1.png" alt="" class="img active" />
              <img src="style/img/2.png" alt="" class="img" />
              <img src="style/img/3.png" alt="" class="img" />
              <img src="style/img/4.png" alt="" class="img" />
            </div>
            <div class="slide__dots">
              <div class="slide__dot slide-taget"></div>
              <div class="slide__dot"></div>
              <div class="slide__dot"></div>
              <div class="slide__dot"></div>
            </div>
          </div>
          <div class="vission" id="vission">
            <div class="vission__img">
              <img alt="" src="style/img/vission.png" />
            </div>
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
            <div class="mission__img">
              <img alt="" src="style/img/mission.png" />
            </div>
          </div>
          <div class="aboutus" id="aboutus">
            <div class="aboutus__title">The Creators of CDT Pay</div>
            <div class="aboutus__content">
              <div class="aboutus__item">
                <img src="style/img/avt1.png" alt="" class="aboutus__item-img" />
                <p class="aboutus__item-ceo">CEO</p>
                <p class="aboutus__item-name">NGUYỄN THÀNH CHUNG</p>
              </div>
              <div class="aboutus__item">
                <img src="style/img/avt3.jpg" alt="" class="aboutus__item-img" />
                <p class="aboutus__item-ceo">CEO</p>
                <p class="aboutus__item-name">NGUYỄN HỮU THƯỜNG</p>
              </div>
              <div class="aboutus__item">
                <img src="style/img/avt2.jpg" alt="" class="aboutus__item-img" />
                <p class="aboutus__item-ceo">CEO</p>
                <p class="aboutus__item-name">PHẠM ĐẠT THÀNH DUY</p>
              </div>
            </div>
          </div>
          <div class="testimonals">
            <div class="testimonals__title">Endorsements</div>
            <div class="testimonals__slide">
              <div class="testimonals__item active">
                <p class="testimonals__item-txt">"We are happy to share this success!"</p>
                <p class="testimonals__item-name">CEO.NGUYỄN HỮU THƯỜNG</p>
                <img src="style/img/avt3.jpg" alt="" class="testimonals__item-img" />
              </div>
              <div class="testimonals__item blnone">
                <p class="testimonals__item-txt">
                  "Connect with us now!"
                </p>
                <p class="testimonals__item-name">CEO.NGUYỄN THÀNH CHUNG</p>
                <img src="style/img/avt1.png" alt="" class="testimonals__item-img" />
              </div>
              <div class="testimonals__item blnone">
                <p class="testimonals__item-txt">
                  "https://www.facebook.com/ULSA.IT"
                </p>
                <p class="testimonals__item-name">CEO.PHẠM ĐẠT THÀNH DUY</p>
                <img src="style/img/avt2.jpg" alt="" class="testimonals__item-img" />
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
                  <img src="./fontawesome-free-6.3.0-web/Sparkling Diamond.png" alt="" />
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
                  width="350" height="200" style="border: 0" allowfullscreen="" loading="lazy"
                  referrerpolicy="no-referrer-when-downgrade"></iframe>
              </div>
            </div>
          </div>
          <footer>
      <% // Create a Calendar instance 
      Calendar now = Calendar.getInstance();
      //Get the current year 
      int year = now.get(Calendar.YEAR); %>
      <p>Copyright <%= year %> CDTPay. All rights reserved.</p>
    </footer>
        </body>
        <script type="text/javascript">
          const slide = document.querySelector(".slide");
          const imgs = slide.querySelectorAll(".img");
          const dots = slide.querySelectorAll(".slide__dot");
          let currentSlide = 0;

          function changeSlide(n) {
            imgs.forEach((img) => {
              img.classList.remove("active");
            });
            dots.forEach((dot) => {
              dot.classList.remove("slide-taget");
            });
            imgs[n].classList.add("active");
            dots[n].classList.add("slide-taget");
            currentSlide = n;
          }
          setInterval(() => {
            let nextSlide = currentSlide + 1;
            if (nextSlide >= imgs.length) {
              nextSlide = 0;
            }
            changeSlide(nextSlide);
          }, 3000);
          dots.forEach((dot, index) => {
            dot.addEventListener("click", () => {
              changeSlide(index);
            });
          });

          const testimonialsSlide = document.querySelector(".testimonals__slide");
          const testimonialsItems =
            testimonialsSlide.querySelectorAll(".testimonals__item");
          const testimonialsDots = document.querySelectorAll(".testimonals__dot");

          let currentTestimonial = 0;

          function changeTestimonial(n) {
            testimonialsItems.forEach((item) => {
              item.classList.remove("active");
            });

            testimonialsDots.forEach((dot) => {
              dot.classList.remove("taget");
            });

            testimonialsItems[n].classList.add("active");
            testimonialsDots[n].classList.add("taget");

            currentTestimonial = n;
          }

          setInterval(() => {
            let nextTestimonial = currentTestimonial + 1;
            if (nextTestimonial >= testimonialsItems.length) {
              nextTestimonial = 0;
            }
            changeTestimonial(nextTestimonial);
          }, 3000);

          testimonialsDots.forEach((dot, index) => {
            dot.addEventListener("click", () => {
              changeTestimonial(index);
            });
          });
        </script>

        </html>