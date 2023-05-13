<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>For Staff Only</title>
    <link rel="stylesheet" href="style/css/login_style.css" />
  </head>

  <body>
    <div class="login__bg">
      <div class="login__content">
        <div class="login__form-title">Welcome to CDTPay (Admin)</div>
        <form action="StaffLoginServlet" method="POST">
          <div class="login__form">
            <div class="login__form-username m24">
              <label for="username" class="login__form-txt">Username</label>
              <input type="text" class="input__login username" name="staffName" id="username" />
            </div>
            <div class="login__form-password m24">
              <label for="password" class="login__form-txt">Password</label>
              <input type="password" name="staffPassword" class="input__login" id="password" />
            </div>


            <div class="login__form-check m24">
              <div class="show__pass">
                <input type="checkbox" name="" id="showpassword" />
                <label for="showpassword">Show password</label>
              </div>
              <div><a href="">Forgot password ?</a></div>
            </div>
          
              <input type="submit" name="submit" class="login__form-btn" value="LOGIN">
            
          
          </div>
        </form>
      </div>
      <div class="login__banner"><img src="../style/img/thuml.png" alt="" /></div>
    </div>
  </body>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

  <script>
 
    $(document).ready(function () {
      $(".input__login")
        .focus(function () {
          $(this).siblings(".login__form-txt").addClass("login__form-txt-val");
        })
        .blur(function () {
          if ($(this).val()) {
            $(this)
              .siblings(".login__form-txt")
              .addClass("login__form-txt-val");
          } else {
            $(this)
              .siblings(".login__form-txt")
              .removeClass("login__form-txt-val");
          }
        });
    });
  </script>

  </html>