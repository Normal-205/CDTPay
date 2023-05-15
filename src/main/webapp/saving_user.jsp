<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Give us money</title>
    <link rel="stylesheet" href="style/font/fontawesome-free-6.3.0-web/css/all.min.css" />
    <link rel="stylesheet" href="style/css/home_user_style.css" />
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
          <div class="content_saving">
            <div class="saving-send">
              <p>Account Information:</p>
              <div class="from_items">
                <div class="from_left">
                  <div class="from_item">
                    <div class="from_accnb">${sessionScope.customer.phone}</div>
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
              <div>
                <form action="UserSaving" method="POST">
                  <label for="interestRate">Interest Rate (%):</label>
                  <input type="text" name="interestRate" maxlength="10" class="to_item" id="interestRate" readonly
                    value="5" />
                  <select name="time" id="select-time">
                    <option value="5">5 month</option>
                    <option value="10">10 month</option>
                  </select>
                  <label for="money" class="black">Money:</label>
                  <input type="text" name="initialAmount" maxlength="12" class="to_item" id="money" />
                  <div>
                  </div>
                  <label for="totalmoney">Total money:</label>
                  <input type="text" name="totalAmount" class="to_item" maxlength="15" id="totalmoney"
                    readonly="readonly" />
                  <input type="submit" value="Send" class="to_item_next">
                </form>
              </div>
            </div>
            <div class="saving-withdraw">
              <p>HISTORY </p>
              <c:forEach var="saving" items="${savingList}">
					    <p>Amount: ${saving.initialAmount}</p>
					    <p>Time: ${saving.startDate} -> ${saving.endDate}</p>
					    <p>Total: ${saving.totalAmount}</p>
					    <p>---------------------------------------------- </p>
					    <!-- Add more fields here -->
			  </c:forEach>
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
          .eq(6)
          .prepend("<div class='point'></div>");
        $("#header").find(".header_title").find("p").text("Saving");
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