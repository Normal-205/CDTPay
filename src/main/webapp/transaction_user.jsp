<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Fast & Furious</title>
      <link rel="stylesheet" href="style/css/home_user_style.css" />
      <link rel="stylesheet" href="style/font/fontawesome-free-6.3.0-web/css/all.min.css" />
      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert2.min.js"></script>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert2.min.css">
    </head>

    <body>
      <!-- Check session -->
      <% if(null==session.getAttribute("customer")){ %>
        <script>
          window.location.href = "login.jsp";
        </script>
        <% }else{ %>
          <script>
            console.log("OKE, has session");
          </script>
          <% } %>
            <!-- End check -->
            <div id="header"></div>
            <div class="content_transaction">
              <div class="transaction">
                <form action="UserTransaction" method="get">
                  <div class="from">
                    <p>Form:</p>
                    <div class="from_items">
                      <div class="from_left">
                        <div class="from_item">
                          <div class="from_accnb" id="accnb">${sessionScope.customer.phone}</div>
                          <div>-</div>
                          <div class="from_name">${sessionScope.customer.fullname}</div>
                        </div>
                        <div class="from_item">
                          <div class="from_money">${sessionScope.customer.balance}</div>
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
                      <label for="accountnumber">Account number:</label>${customerPhone}
                      <input type="text" name="customerPhone" value="${transaction.phone}" maxlength="10"
                        class="to_item" id="accountnumber" required />
                      <input type="submit" name="submit" value="checkPhone" id="checkacc" hidden />
                      <label for="accountname">Account name:</label>
                      <input type="text" name="reciveName" class="to_item" id="accountname"
                        value="${transaction.fullname}" readonly />${customerName}
                      <label for="money">Money:</label>
                      <input type="text" name="amount" class="to_item" maxlength="15" id="money" />
                      <label for="content">Content:</label>
                      <input type="text" name="message" class="to_item" maxlength="15" id="content"
                        value="${sessionScope.customer.fullname} chuyen khoan" />
                      <input type="submit" class="otp_checknumber hiden" />
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
                            <input type="text" name="password" readonly class="otp_pass hiden" />
                          </div>
                          <button type="submit" name="submit" value="transaction" class="otp_btn">Confirm</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
              <div class="recent">
                <p>Recent Transaction</p>
                <div class="recent_items">
                  <c:forEach items="${recentTransaction}" var="recentTransaction">
                    <div class="recent_item">
                      <p>${recentTransaction.reciveName}</p>
                      <p>-</p>
                      <p>${recentTransaction.reciverPhone}</p>
                    </div>
                  </c:forEach>
                </div>
              </div>
            </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.min.js"></script>

    <script>
      var qrCodeValue = sessionStorage.getItem('qrCodeValue');
      
      if (qrCodeValue) {
		//if($("#accnb").text()!==qrCodeValue){
			 document.getElementById('accountnumber').value = qrCodeValue;
        sessionStorage.removeItem('qrCodeValue');
        document.getElementById('checkacc').click();
		//}
      };
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
            e.preventDefault();
          }
        });
      });
      // jQuery
      $(document).ready(function () {
        var inputFields = $(".otp_number");
        var currentInputIndex = 0;


        inputFields.on("input", function () {
          var inputVal = $(this).val();
          inputVal = inputVal.replace(/[^\d]/g, "");

          if (inputVal.length >= 1) {
            currentInputIndex++;
            if (currentInputIndex >= inputFields.length) {
              currentInputIndex = inputFields.length - 1;
            }
            inputFields.eq(currentInputIndex).removeAttr("disabled").focus();
          }
        });


        inputFields.on("keydown", function (event) {
          if (event.keyCode == 13) {
            event.preventDefault();
            var inputValues = "";
            inputFields.each(function () {
              inputValues += $(this).val();
            });

            $(".otp_pass").val(inputValues);
          }
        });
        $(".otp_btn").on("click", function () {
          var inputValues = "";
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
          $(".otp_form").addClass("unhiden").removeClass("hiden");
        });
        $(".otp_close,.otp_bg").on("click", function () {
          $(".otp_form").addClass("hiden");
        });
      });

      //  $(document).ready(function () {
      //   var searchParams = new URLSearchParams(window.location.search);
      //   var accountnumber = searchParams.get("accountnumber");
      //   $("#accountnumber").val(accountnumber);
      // });

      $(document).ready(function () {
        $('#accountnumber').blur(function () {
          var accountNumber = $(this).val();
          if (accountNumber === '') {

            Swal.fire({
              icon: 'warning',
              title: 'Required!',
              text: 'Please enter account number',
            });
          } else {
            if (accountNumber === $(".from_accnb").text()) {
              Swal.fire({
                icon: 'error',
                title: 'Phone number',
                text: 'Can\'t send to yourself',
              }).then(function () {
                $('#accountname').val('');
                $('#accountnumber').val('').focus();
              });
            }
            else {

              $('#checkacc').trigger('click');
            }
          }
        });
      });

      $(document).ready(function () {
        $('#money').blur(function () {
          var money = parseInt($(this).val());
          var fromMoney = parseInt($(".from_money").text());

          if (money > fromMoney) {
            Swal.fire({
              icon: 'warning',
              title: 'Warning!',
              text: 'Insufficient balance in your account',
            }).then(function () {
              $('#money').val('').focus();
            });
          }
        });
      });
    </script>

    </html>