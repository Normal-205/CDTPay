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
    <div class="content_account">
      <img
        src="https://scontent.fhan5-9.fna.fbcdn.net/v/t1.6435-9/131949286_1057344984733543_1461980836764487632_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=iNrYHDPv__YAX_0E7aY&_nc_ht=scontent.fhan5-9.fna&oh=00_AfDYw5yACUNs_BW3wbyxV0bR-dYKH0kF6U-eWAFEY4jJiQ&oe=642D50D5"
        alt="" class="account_img" width="200px" height="200px" />
      <p>PHAM DUY THANH DAN</p>
      <p><span>Phone number: </span><span>0368808518</span></p>
      <p><span>Email: </span><span>email@gmail.com</span></p>

      <div class="account_btn btn_changepass btn_edit">Change passwword</div>
      <div class="account_changepass">
        <form action="" method="post">
          <div class="otp_form hiden">
            <div class="otp_bg"></div>
            <div class="otp changepass">
              <p>ENTER OLD PASSWORD</p>
              <div class="otp_close">
                <i class="fa-solid fa-xmark"></i>
              </div>

              <div class="otp_in">
                <input type="text" class="otp_number" maxlength="1" />
                <input type="text" class="otp_number" disabled maxlength="1" />
                <input type="text" class="otp_number" disabled maxlength="1" />
                <input type="text" class="otp_number" disabled maxlength="1" />
                <input type="text" class="otp_number" disabled maxlength="1" />
                <input type="text" class="otp_number" disabled maxlength="1" />
                <input type="text" readonly class="otp_pass-old hiden" />
              </div>
              <p>ENTER NEW PASSWORD</p>
              <div class="otp_in">
                <input type="text" class="otp_number" maxlength="1" />
                <input type="text" class="otp_number" disabled maxlength="1" />
                <input type="text" class="otp_number" disabled maxlength="1" />
                <input type="text" class="otp_number" disabled maxlength="1" />
                <input type="text" class="otp_number" disabled maxlength="1" />
                <input type="text" class="otp_number" disabled maxlength="1" />
                <input type="text" readonly class="otp_pass-new hiden" />
              </div>
              <button class="otp_btn">SAVE</button>
            </div>
          </div>
        </form>
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
          .eq(7)
          .prepend("<div class='point'></div>");
        $("#header").find(".header_title").find("p").text("Account");
      });
      $(".btn_changepass").click(function (event) {
        $(".otp_form").addClass("unhiden").removeClass("hiden");
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

          $(".otp_pass-old").val(inputValues.slice(0, 6));
          $(".otp_pass-new").val(inputValues.slice(6, -1));
        }
      });
      $(".otp_btn").on("click", function () {
        var inputValues = ""; // Chuỗi chứa giá trị của 6 ô nhập liệu
        inputFields.each(function () {
          inputValues += $(this).val();
        });
        $(".otp_pass-old").val(inputValues.slice(0, 6));
        $(".otp_pass-new").val(inputValues.slice(6, -1));
      });
      $(".otp_close,.otp_bg").on("click", function () {
        $(".otp_form").addClass("hiden");
      });
    });
  </script>

  </html>