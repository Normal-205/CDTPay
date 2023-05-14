<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Transaction</title>
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
        <form action="AdminTransServlet" method = "get">
      <div class="transaction_from">
          <div class="from">
            <p>From:</p>
            <div class="to_items">
              <label for="accountnumber" class="black">Account number:</label>
              <input type="text" name="senderPhone" maxlength="10" class="to_item" id="accountnumber" value="${sender.phone}" />
              <!-- submit check 1 -->
              <input type="submit" name="submit" class="checkacc1" value="checkacc1" hidden="true"/>
              <label for="accountname">Account name:</label>
              <input type="text" name="senderName" class="to_item" id="accountname" value="${sender.fullname}" readonly />
              <label for="Balance">Balance:</label>
              <input type="text" name="senderBalance" class="to_item" maxlength="15" readonly id="Balance" value="${sender.balance}"/>
            </div>
          </div>
      </div>

    <div>
     <div class="to">
     <p>To:</p>
    <label for="accountnumberto" class="black">Account number:</label>
      <!-- submit check 2 -->
              <input type="submit" name="submit" class="checkacc2" value="checkacc2" hidden="true"/>
     <input type="text" name="reciverPhone" maxlength="10" class="to_item" id="accountnumberto" value="${reciver.phone}" />
              <label for="accountname">Account name:</label>
              <input type="text" name="reciverName" class="to_item" id="accountname" value="${reciver.fullname}" readonly />
              <label for="money" class="black">Money:</label>
              <input type="text" name="amount" class="to_item" maxlength="15" id="money"/>
              <label for="content" class="black">Content:</label>
              <input type="text" name="transactionMessage" class="to_item" maxlength="15" id="content" value="Transaction was made by ${sessionScope.staff.staffName}" />
     </div>
    </div>
         <input type="submit" name="submit" value="Next" class="to_item_next" style="width: 95%">
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
          .eq(1)
          .prepend("<div class='point'></div>");
    $("#header").find(".header_title").find("p").text("Transaction");
      });
    });
 // Đăng ký sự kiện khi nút được nhấp vào
    $('.to_item_next').click(() => {
      // Hiển thị SweetAlert với nút confirm và cancel
       var accountNumber = $("#accountnumber").val();
       var accountNumberto = $("#accountnumberto").val();
       var money = $("#money").val();
          if (accountNumber === ''|| accountNumberto===''||money==='') {

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
            $('.checkacc1').trigger('click');
          }
        });
      });
    $(document).ready(function () {
        $('#accountnumberto').blur(function () {
          var accountNumber = $(this).val();
          if (accountNumber === '') {

            Swal.fire({
              icon: 'warning',
              title: 'Required!',
              text: 'Please enter account number',
            });
          } else {
            $('.checkacc2').trigger('click');
          }
        });
      });
    $(document).ready(function () {
        $("#accountnumber,#money,#accountnumberto").on("keypress", function (e) {
          var keyCode = e.which ? e.which : e.keyCode;
          if (keyCode < 48 || keyCode > 57) {
            e.preventDefault();
          }
        });
      });
    $(document).ready(function () {
        $('#money').blur(function () {
          var money = parseInt($(this).val());
          var fromMoney = parseInt($("#Balance").val());

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