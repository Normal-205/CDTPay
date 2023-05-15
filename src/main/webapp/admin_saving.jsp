<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Saving Management</title>
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
<div class="content_saving">
              <form action="" method="get">
            <div class="saving-send disflex">
             <div class="to_items w50">
              <p>Account Information:</p>
              <br/>
              <label for="accountnumber" class="black">Account number:</label>
              <input type="text" maxlength="10" class="to_item" id="accountnumber" />
          
              <!-- submit check 1 -->
              <input type="submit" class="checkacc" value="checkacc" hidden="true"/>
              <label for="accountname">Account name:</label>
              <input type="text" class="to_item" id="accountname" readonly />
              <label for="Balance">Balance:</label>
              <input type="text" class="to_item" maxlength="15" readonly id="Balance" value="" />
            </div>
              <div>
      
                  <label for="interestRate">Interest Rate (%):</label>
                  <input type="text" name="interestRate" maxlength="10" class="to_item" id="interestRate" readonly
                    value="5" />
                  <select name="time" id="select-time">
                    <option value="5">5 month</option>
                    <option value="10">10 month</option>
                  </select>
                  <label for="money" class="black">Money:</label>
                  <input type="text" name="initialAmount" class="to_item" maxlength="12" id="money" />
                  <div>
                  </div>
                  <label for="totalmoney">Total money:</label>
                  <input type="text" name="totalAmount" class="to_item" maxlength="15" id="totalmoney"
                    readonly="readonly" />
              </div>
            </div>
                   <div class="to_item_next" style="width: 95%">Next</div>
                </form>
    </div>
  </body>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.min.js"></script>

  <script>
 
    $(document).ready(function () {
      $("#header").load("admin_layout.jsp", function () {
        $("#header")
          .find(".navbar_item")
          .eq(4)
          .prepend("<div class='point'></div>");
    $("#header").find(".header_title").find("p").text("Saving");
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
          else{
        	  
      Swal.fire({
        title: 'Do you want to perform this action',
        text: "You won't be able to undo this action!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes',
        cancelButtonText: 'No'
      }).then((result) => {
        if (result.isConfirmed) {
          // Xử lý khi confirm được nhấn
        	// var servletUrl = "";
        	  //var redirectUrl = servletUrl + "?param1=value1&param2=value2";
        	  //window.location.href = redirectUrl;
        } 
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
    $(document).ready(function () {
        // Bắt sự kiện khi chọn giá trị trong select
        $('#select-time').change(function () {
          // Lấy giá trị được chọn
          var selectedValue = $(this).val();
          if (selectedValue === '5') {
            // Nếu giá trị được chọn là 5, thêm giá trị 3 vào input
            var currentValue = $('#interestRate').val();
            $('#interestRate').val(5);
          }
          if (selectedValue === '10') {
            // Nếu giá trị được chọn là 10, thêm giá trị 5 vào input
            var currentValue = $('#interestRate').val();
            $('#interestRate').val(10);
          }
        });
        $('#money').on('input', function () {
      	  if($('#money').val()===""){
      		  $('#totalmoney').val("0");
      	  }
      	  else{
      		   var value1 = parseInt($(this).val());
          var value2 = value1 + (value1 * ($('#interestRate').val())/100);
          $('#totalmoney').val( parseInt(value2));
      	  }
         
        });
      });
  </script>

  </html>