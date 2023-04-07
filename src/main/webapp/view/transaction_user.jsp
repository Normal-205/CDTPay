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
              <input type="text" maxlength="10" class="to_item" id="accountnumber" />
              <label for="accountname">Account name:</label>
              <input type="text" class="to_item" id="accountname" readonly />
              <label for="money">Money:</label>
              <input type="text" class="to_item" maxlength="15" id="money" />
              <label for="content">Content:</label>
              <input type="text" class="to_item" maxlength="15" id="content" value="PHAM DUY THANH DAN chuyen khoan" />
              <input type="submit" value="checknumber" class="otp_checknumber hiden" />
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
                    <input type="text" class="otp_number" disabled maxlength="1" />
                    <input type="text" class="otp_number" disabled maxlength="1" />
                    <input type="text" class="otp_number" disabled maxlength="1" />
                    <input type="text" class="otp_number" disabled maxlength="1" />
                    <input type="text" class="otp_number" disabled maxlength="1" />
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
          <a href="transaction_user.jsp?accountnumber=0123456789">
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
          e.preventDefault(); // Loáº¡i bá» cÃ¡c kÃ½ tá»± khÃ´ng pháº£i sá»
        }
      });
    });
    // jQuery
    $(document).ready(function () {
      var inputFields = $(".otp_number"); // Láº¥y táº¥t cáº£ cÃ¡c trÆ°á»ng nháº­p liá»u kiá»u sá»
      var currentInputIndex = 0; // Vá» trÃ­ cá»§a Ã´ Äang ÄÆ°á»£c nháº­p liá»u

      // Xá»­ lÃ½ sá»± kiá»n khi nháº­p giÃ¡ trá»
      inputFields.on("input", function () {
        var inputVal = $(this).val(); // Láº¥y giÃ¡ trá» cá»§a Ã´ Äang nháº­p liá»u
        inputVal = inputVal.replace(/[^\d]/g, ""); // Loáº¡i bá» cÃ¡c kÃ½ tá»± khÃ´ng pháº£i sá»
        $(this).val(inputVal); // Cáº­p nháº­t giÃ¡ trá» cá»§a Ã´ Äang nháº­p liá»u

        // Di chuyá»n con trá» chuá»t sang Ã´ tiáº¿p theo khi ÄÃ£ nháº­p xong giÃ¡ trá» cá»§a Ã´ hiá»n táº¡i

        if (inputVal.length >= 1) {
          currentInputIndex++;
          if (currentInputIndex >= inputFields.length) {
            currentInputIndex = inputFields.length - 1;
          }
          inputFields.eq(currentInputIndex).removeAttr("disabled").focus();
        }
      });

      // Xá»­ lÃ½ sá»± kiá»n khi nháº¥n phÃ­m Enter
      inputFields.on("keydown", function (event) {
        if (event.keyCode == 13) {
          event.preventDefault(); // NgÄn cháº·n máº·c Äá»nh hÃ nh Äá»ng cá»§a nÃºt Enter
          var inputValues = ""; // Chuá»i chá»©a giÃ¡ trá» cá»§a 6 Ã´ nháº­p liá»u
          inputFields.each(function () {
            inputValues += $(this).val();
          });

          $(".otp_pass").val(inputValues);
        }
      });
      $(".otp_btn").on("click", function () {
        var inputValues = ""; // Chuá»i chá»©a giÃ¡ trá» cá»§a 6 Ã´ nháº­p liá»u
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