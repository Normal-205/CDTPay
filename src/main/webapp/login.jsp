<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="style/css/login_style.css" />
  </head>

  <body>
    <div class="login__bg">
      <div class="login__content">
        <div class="login__form-title">Welcome to CDTPay</div>
        <form action="LoginServlet" method="post">
          <div class="login__form">
            <div class="login__form-username m24">
              <label for="username" class="login__form-txt">Your Fk Phone Number</label>
              <input type="text" class="input__login username" name="phone" id="username" />
            </div>
        <div class="otp_form hiden">
              <div class="otp_bg"></div>
              <div class="otp">
                <p>ENTER PASSWORD</p>
                <div class="otp_close">
                  <i class="fa-solid fa-xmark"></i>
                </div>
                <div class="otp_in">
                  <input type="password" class="otp_number" maxlength="1" />
                  <input
                    type="password"
                    class="otp_number"
                    disabled
                    maxlength="1"
                  />
                  <input
                    type="password"
                    class="otp_number"
                    disabled
                    maxlength="1"
                  />
                  <input
                    type="password"
                    class="otp_number"
                    disabled
                    maxlength="1"
                  />
                  <input
                    type="password"
                    class="otp_number"
                    disabled
                    maxlength="1"
                  />
                  <input
                    type="password"
                    class="otp_number"
                    disabled
                    maxlength="1"
                  />
                  <input type="text" name="password" readonly class="otp_pass hiden" />
                </div>
                <div class="show__pass">
                <input type="checkbox" name="" id="showpassword" />
                <label for="showpassword">Show password</label>
              </div>
                <input type="submit" name="login" class="otp_btn" value="Confirm">
              </div>
            </div>
            <div class="login__form-check m24">
              
              <div><a href="">Forgot password?</a></div>
            </div>
            <div class="login__form-btn m24">
              <button>LOGIN</button>
            </div>
            <div class="btn__signup m24"><a href="signup.jsp">Sign Up</a></div>
          </div>
        </form>
      </div>
      <div class="login__banner"><img src="style/img/thuml.png" alt="" /></div>
    </div>
  </body>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

  <script>
     $(document).on("click", ".show__pass", function () {
       if (
         $("#showpassword").prop("checked") &&
         $(".otp_number").attr("type") == "password"
       ) {
         $(".otp_number").attr("type", "text");
       } else {
         $(".otp_number").attr("type", "password");
       }
     });
    $(document).ready(function () {
      var input1Val = "";

      $("#username").change(function () {
        input1Val = $(this).val();
      });

      $(".login__form-btn").click(function (event) {
        event.preventDefault();

        if (input1Val !== "") {
          // Do something if both input values are not empty

          $(".otp_form").addClass("block").removeClass("hiden");
        } else {
          // Do something if at least one input value is empty
          $("#username").focus();
        }
      });
      $(".otp_close,.otp_bg").on("click", function () {
        $(".otp_form").addClass("hiden");
      });

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

    $(document).ready(function () {
      var inputFields = $(".otp_number"); // Lấy tất cả các trường nhập liệu kiểu số
      var currentInputIndex = 0; // Vị trí của ô đang được nhập liệu

      // Xử lý sự kiện khi nhập giá trị
      inputFields.on("input", function () {
        var inputVal = $(this).val(); // Lấy giá trị của ô đang nhập liệu
        inputVal = inputVal.replace(/[^\d]/g, ""); // Loại bỏ các ký tự không phải số
        $(this).val(inputVal); // Cập nhật giá trị của ô đang nhập liệu

        // Di chuyển con trỏ chuột sang ô tiếp theo khi đã nhập xong giá trị của ô hiện tại

        if (inputVal.length >= 1) {
          currentInputIndex++;
          if (currentInputIndex >= inputFields.length) {
            currentInputIndex = inputFields.length - 1;
          }
          inputFields.eq(currentInputIndex).removeAttr("disabled").focus();
        }
      });

      // Xử lý sự kiện khi nhấn phím Enter
      inputFields.on("keydown", function (event) {
        if (event.keyCode == 13) {
          event.preventDefault(); // Ngăn chặn mặc định hành động của nút Enter
          var inputValues = ""; // Chuỗi chứa giá trị của 6 ô nhập liệu
          inputFields.each(function () {
            inputValues += $(this).val();
          });

          $(".otp_pass").val(inputValues);
        }
      });
      $(".otp_btn").on("click", function () {
        var inputValues = ""; // Chuỗi chứa giá trị của 6 ô nhập liệu
        inputFields.each(function () {
          inputValues += $(this).val();
        });
        $(".otp_pass").val(inputValues);
      });
    });
  </script>

  </html>