<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="style/css/signup_style.css" />
  </head>

  <body>
    <div class="signup__bg">
      <div class="signup__content">
        <div class="signup__form-title">Sign Up</div>
        <form action="SignUpServlet" method="post">
          <div class="signup__form">
            <div class="login__form m24">
              <label for="fullname" class="signup__form-txt">Full name</label>
              <input type="text" class="input__signup" name="fullname" id="fullname" />
            </div>
            <div class="signup__form m24">
              <label for="phone" class="signup__form-txt">Phone number</label>
              <input type="text" class="input__signup" name="phone" id="phone" maxlength="10" pattern="0+[0-9]{9}" />
            </div>

            <!-- <div class="signup__form m24">
              <label for="password" class="signup__form-txt">Password</label>
              <input
                type="password"
                name=""
                class="input__signup"
                id="password"
              />
            </div> -->

            <div class="signup__form m24">
              <label for="email" class="signup__form-txt">Email</label>
              <input type="email" name="email" class="input__signup" id="email" />
            </div>
            <!-- <div class="signup__form-check m24">
              <div>
                <input type="checkbox" name="" id="showpassword" />
                <label for="showpassword">Show password</label>
              </div>
              <div><a href="">Forgot password ?</a></div>
            </div> -->
            <div class="signup__form-btn m24"><button>Sign Up</button></div>
            <div class="otp_form hiden">
              <div class="otp_bg"></div>
              <div class="otp">
                <p>ENTER PASSWORD</p>
                <div class="otp_close">
                  <i class="fa-solid fa-xmark"></i>
                </div>

                <div class="otp_in">
                  <input type="password" class="otp_number" maxlength="1" />
                  <input type="password" class="otp_number" disabled maxlength="1" />
                  <input type="password" class="otp_number" disabled maxlength="1" />
                  <input type="password" class="otp_number" disabled maxlength="1" />
                  <input type="password" class="otp_number" disabled maxlength="1" />
                  <input type="password" class="otp_number" disabled maxlength="1" />
                  <input type="text" name="password" readonly class="otp_pass hiden" />
                </div>
                <input type="submit" name ="submit" value="Confirm" class="otp_btn">
              </div>
            </div>
            <div class="btn__signup m24"><a href="login.jsp">Sign In</a></div>
          </div>
        </form>
      </div>
      <div class="signup__banner"><img src="" alt="" /></div>
    </div>

  </body>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

  <script>
    $(document).ready(function () {
      <!-- alert("hello"); -->
      $(".input__signup")
        .focus(function () {
          $(this)
            .siblings(".signup__form-txt")
            .addClass("signup__form-txt-val");
        })
        .blur(function () {
          if ($(this).val()) {
            $(this)
              .siblings(".signup__form-txt")
              .addClass("signup__form-txt-val");
          } else {
            $(this)
              .siblings(".signup__form-txt")
              .removeClass("signup__form-txt-val");
          }
        });

      var input1Val = "";
      var input2Val = "";
      var input3Val = "";
      $("#fullname").change(function () {
        input1Val = $(this).val();
      });

      $("#phone").change(function () {
        input2Val = $(this).val();
      });

      $("#email").change(function () {
        input3Val = $(this).val();
      });

      $(".signup__form-btn").click(function (event) {
        event.preventDefault();

        if (input1Val !== "" && input2Val !== "" && input3Val !== "") {
          // Do something if both input values are not empty

          $(".otp_form").addClass("unhiden").removeClass("hiden");
        } else {
          // Do something if at least one input value is empty
          $("#fullname").focus();
        }
      });
      $(".otp_close,.otp_bg").on("click", function () {
        $(".otp_form").addClass("hiden");
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
    $(document).ready(function () {
      $("#phone").on("keypress", function (e) {
        var keyCode = e.which ? e.which : e.keyCode;
        if (keyCode < 48 || keyCode > 57) {
          e.preventDefault();
        }
      });
    });
  </script>

  </html>