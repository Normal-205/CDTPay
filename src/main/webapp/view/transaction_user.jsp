<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="home_user_style.css" />
    <link rel="stylesheet" href="fontawesome-free-6.3.0-web/css/all.min.css" />
  </head>
  <body>
    <div class="navbar">
      <div class="navbar_logo"><h1>CDTPay</h1></div>
      <ul class="navbar_items">
        <li class="navbar_item">
          <a href="home_user.html"><i class="fa-solid fa-house"></i>Home</a>
        </li>
        <li class="navbar_item">
          <div class="point"></div>
          <a href=""><i class="fa-solid fa-right-left"></i>Transaction</a>
        </li>
        <li class="navbar_item">
          <a href=""><i class="fa-solid fa-qrcode"></i>QR code</a>
        </li>
        <li class="navbar_item">
          <a href=""><i class="fa-solid fa-credit-card"></i>Card service</a>
        </li>
        <li class="navbar_item">
          <a href=""><i class="fa-solid fa-clock-rotate-left"></i>History</a>
        </li>
        <li class="navbar_item">
          <a href=""><i class="fa-solid fa-piggy-bank"></i>Saving</a>
        </li>
        <li class="navbar_item">
          <a href=""><i class="fa-solid fa-user"></i>Account</a>
        </li>
        <li class="navbar_item">
          <a href=""><i class="fa-solid fa-phone-volume"></i>Hotline</a>
        </li>
      </ul>
    </div>
    <div class="header">
      <div class="header_title"><p>Transaction</p></div>
      <div class="header_user">
        <img
          src="https://scontent.fhan5-9.fna.fbcdn.net/v/t1.6435-9/131949286_1057344984733543_1461980836764487632_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=iNrYHDPv__YAX_0E7aY&_nc_ht=scontent.fhan5-9.fna&oh=00_AfDYw5yACUNs_BW3wbyxV0bR-dYKH0kF6U-eWAFEY4jJiQ&oe=642D50D5"
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

    <div class="content_transaction">
      <div class="transaction">
        <form action="">
          <div class="from">
            <p>Form:</p>

            <div class="from_items">
              <div class="from_left">
                <div class="from_item">
                  <div class="from_accnb">0368808518</div>
                  <div>-</div>
                  <div class="from_name">PHAM DAT THANH DUY</div>
                </div>
                <div class="from_item">
                  <div class="from_money">1000000</div>
                  <div class="from_dv">VND</div>
                </div>
              </div>
              <div class="from_right">
                <i class="fa-sharp fa-solid fa-chevron-down"></i>
              </div>
            </div>
          </div>
          <div class="to">
            <p>To:</p>
            <div class="to_items">
              <label for="accountnumber">Account number:</label>
              <input
                type="text"
                maxlength="10"
                class="to_item"
                id="accountnumber"
              />
              <label for="accountname">Account name:</label>
              <input type="text" class="to_item" id="accountname" readonly />
              <label for="money">Money:</label>
              <input type="text" class="to_item" maxlength="15" id="money" />
              <input
                type="submit"
                value="checknumber"
                class="otp_checknumber hiden"
              />
              <div class="to_item_next">Next</div>
              <div class="otp_form hiden">
                <div class="otp_bg"></div>
                <div class="otp">
                  <p>ENTER PASSWORD</p>
                  <div class="otp_close">
                    <i class="fa-solid fa-xmark"></i>
                  </div>

                  <div class="otp_in">
                    <input type="text" class="otp_number" maxlength="1" />
                    <input
                      type="text"
                      class="otp_number"
                      disabled
                      maxlength="1"
                    />
                    <input
                      type="text"
                      class="otp_number"
                      disabled
                      maxlength="1"
                    />
                    <input
                      type="text"
                      class="otp_number"
                      disabled
                      maxlength="1"
                    />
                    <input
                      type="text"
                      class="otp_number"
                      disabled
                      maxlength="1"
                    />
                    <input
                      type="text"
                      class="otp_number"
                      disabled
                      maxlength="1"
                    />
                    <input type="text" readonly class="otp_pass hiden" />
                  </div>
                  <button class="otp_btn">Confirm</button>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
      <div class="recent">
        <p>Recent</p>
        <div class="recent_items">
          <a href="">
            <div class="recent_item">
              <p>NGUYEN THANH CHUNG</p>
              <p>-</p>
              <p>0123456789</p>
            </div>
          </a>
          <a href="">
            <div class="recent_item">
              <p>NGUYEN THANH CHUNG</p>
              <p>-</p>
              <p>0123456789</p>
            </div>
          </a>
        </div>
      </div>
    </div>
  </body>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

  <script>
    $(document).ready(function () {
      $("#accountnumber,#money").on("keypress", function (e) {
        var keyCode = e.which ? e.which : e.keyCode;
        if (keyCode < 48 || keyCode > 57) {
          e.preventDefault(); // Loại bỏ các ký tự không phải số
        }
      });
    });
    // jQuery
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

    // $(document).ready(function () {
    //   $("#accountnumber").blur(function () {
    //     $(".otp_checknumber").trigger("click");
    //   });
    // });
    $(document).ready(function () {
      var input1Val = "";
      var input2Val = "";

      $("#accountnumber").change(function () {
        input1Val = $(this).val();
      });

      $("#money").change(function () {
        input2Val = $(this).val();
      });

      $(".to_item_next").click(function (event) {
        event.preventDefault();

        if (input1Val !== "" && input2Val !== "") {
          // Do something if both input values are not empty

          $(".otp_form").addClass("unhiden").removeClass("hiden");
        } else {
          // Do something if at least one input value is empty
          $("#accountnumber").focus();
        }
      });
      $(".otp_close,.otp_bg").on("click", function () {
        $(".otp_form").addClass("hiden");
      });
    });
  </script>
</html>
