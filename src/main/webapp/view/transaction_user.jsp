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
    <div id="header"></div>

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
              <label for="content">Content:</label>
              <input
                type="text"
                class="to_item"
                maxlength="15"
                id="content"
                value="PHAM DUY THANH DAN Chuyển khoản"
              />
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
          <a href="transaction_user.html?accountnumber=0123456789">
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
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.min.js"></script>

  <script>
    $(document).ready(function () {
      $("#header").load("layout.jsp", function () {
        $("#header")
          .find(".navbar_item")
          .eq(1)
          .prepend("<div class='point'></div>");
      });
    });

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
    $(document).ready(function () {
      var searchParams = new URLSearchParams(window.location.search);
      var accountnumber = searchParams.get("accountnumber");

      $("#accountnumber").val(accountnumber);
    });
  </script>
</html>
