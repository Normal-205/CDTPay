<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
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
    <p>Send:</p>
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
            <div>
            <form action="">
            <label for="interestRate" >Interest Rate (%):</label>
              <input type="text" maxlength="10" class="to_item" id="interestRate" readonly value="0.03"/>
              <select name="" id="select-time">
              <option value="5">5 minute</option>
              <option value="10">10 minute</option>
            </select>
              <label for="money" class="black">Money:</label>
              <input type="text" class="to_item" id="money"  />
              
              <div>
              
               
              </div>
              <label for="totalmoney" >Total money:</label>
              <input type="text" class="to_item" maxlength="15" id="totalmoney" readonly="readonly"/>
   <div class="to_item_next">Send</div>
          
            </form>
            </div>
    </div>
    <div class="saving-withdraw">
    <p>Withdraw:Features under development.  </p>
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
    $(document).ready(function() {
    	  // Bắt sự kiện khi chọn giá trị trong select
    	  $('#select-time').change(function() {
    	    // Lấy giá trị được chọn
    	    var selectedValue = $(this).val();
    	    if (selectedValue === '5') {
    	      // Nếu giá trị được chọn là 5, thêm giá trị 0.3 vào input
    	      var currentValue = $('#interestRate').val();
    	      $('#interestRate').val(0.03);
    	    }
    	    if (selectedValue === '10') {
      	      // Nếu giá trị được chọn là 5, thêm giá trị 0.3 vào input
      	      var currentValue = $('#interestRate').val();
      	      $('#interestRate').val(0.035);
      	    }
    	  });
    	  $('#money').on('input', function() {
    		    var value1 = parseFloat($(this).val()); 
    		    var value2 = value1 +  (value1*($('#interestRate').val()));
    		    $('#totalmoney').val(value2);
    		  });
    	});

  </script>

  </html>