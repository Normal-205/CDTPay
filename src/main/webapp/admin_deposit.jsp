<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <link rel="stylesheet" href="style/css/home_user_style.css" />
    <link rel="stylesheet" href="style/font/fontawesome-free-6.3.0-web/css/all.min.css" />
  </head>

  <body>
    <!-- Check session -->
    <% if(null==session.getAttribute("staff")){ %>
      <script>
        window.location.href = "admin_login.jsp";
      </script>
      <% }else{ %>
        <script>
          console.log("OKE, has staff's session");
        </script>
        <% } %>
          <!-- End check session -->
          <div id="header"></div>
          <div class="admin_transaction">
            <div class="content_adtran">
              <form action="AdminDepositServlet" method="get">
                <div>
                  <div class="to">
                    <p>To:</p>
                    <label for="accountnumber" class="black">Account number:</label>
                    <input type="text" name="customerPhone" maxlength="10" class="to_item" id="accountnumber" value="${customDep.phone}" required />
                    <input type="submit" name="submit" class="checkacc" value="checkPhone" hidden="true" />
                    <label for="accountname">Account name:</label>
                    <input type="text" class="to_item" id="accountname" value="${customDep.fullname}" readonly />
                    <label for="Balance">Balance:</label>
                    <input type="text" name="balance" class="to_item" maxlength="15" readonly id="Balance"
                      value="${customDep.balance}" />
                    <label for="money" class="black">Money:</label>
                    <input type="text" name="amount" class="to_item" maxlength="15" id="money" />
                    <label for="content" class="black">Messages:</label>
                    <input type="text" name="transactionMessages" class="to_item" maxlength="15" id="content"
                      value="${sessionScope.staff.staffName} adds funds to the customer's balance" />
                  </div>
                </div>
                <!-- <div class="to_item_next" style="width: 95%">Deposit</div> -->
                <input type="submit" name="submit" value="Deposit" class="to_item_next" style="width: 95%">
              </form>
            </div>
          </div>

  </body>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.min.js"></script>

  <script>

    $(document).ready(function () {
      $("#header").load("admin_layout.jsp", function () {
        $("#header")
          .find(".navbar_item")
          .eq(2)
          .prepend("<div class='point'></div>");
        $("#header").find(".header_title").find("p").text("Deposit");
      });
    });
    // Đăng ký sự kiện khi nút được nhấp vào
    $('.to_item_next').click(() => {
      // Hiển thị SweetAlert với nút confirm và cancel
      var accountNumber = $("#accountnumber").val();
      var accountNumberto = $("#accountnumberto").val();
      var money = $("#money").val();
      if (accountNumber === '' || accountNumberto === '' || money === '') {

        Swal.fire({
          icon: 'warning',
          title: 'Required!',
          text: 'Please enter information',
        });
      }       
    });

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
          $('.checkacc').trigger('click');
        }
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
  </script>

  </html>