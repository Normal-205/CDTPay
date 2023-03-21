<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="login_style.css" />
  </head>
  <body>
    <div class="login__bg">
      <div class="login__content">
        <div class="login__form-title">Welcome to CDTPay</div>
        <form action="" method="post">
          <div class="login__form">
            <div class="login__form-username m24">
              <label for="username" class="login__form-txt">Username</label>
              <input
                type="text"
                class="input__login username"
                name=""
                id="username"
              />
            </div>
            <div class="login__form-password m24">
              <label for="password" class="login__form-txt">Password</label>
              <input
                type="password"
                name=""
                class="input__login password"
                id="password"
              />
            </div>
            <div class="login__form-check m24">
              <div class="show__pass">
                <input type="checkbox" name="" id="showpassword" />
                <label for="showpassword">Show password</label>
              </div>
              <div><a href="">Forgot password ?</a></div>
            </div>
            <div class="login__form-btn m24">
              <button type="button">LOGIN</button>
            </div>
            <div class="btn__signup m24"><a href="">Sign Up</a></div>
          </div>
        </form>
      </div>
      <div class="login__banner"><img src="" alt="" /></div>
    </div>
  </body>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

  <script>
    $(document).on("click", ".show__pass", function () {
      if (
        $("#showpassword").prop("checked") &&
        $("#password").attr("type") == "password"
      ) {
        $("#password").attr("type", "text");
      } else {
        $("#password").attr("type", "password");
      }
    });
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
