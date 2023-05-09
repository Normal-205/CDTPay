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
    
    <link rel="stylesheet" href="../style/css/home_user_style.css" />
    <link rel="stylesheet" href="../style/font/fontawesome-free-6.3.0-web/css/all.min.css" />
  </head>

  <body>
    <div id="header"></div>
 <div class="admin_transaction">
 <div class="content_adtran">
        <form action="">
      <div class="transaction_from">
       
          <div class="from">
            <p>From:</p>
            <div class="to_items">
              <label for="accountnumber" class="black">Account number:</label>
              <input type="text" maxlength="10" class="to_item" id="accountnumber" />
              <label for="accountname">Account name:</label>
              <input type="text" class="to_item" id="accountname" readonly />
              <label for="Balance">Balance:</label>
              <input type="text" class="to_item" maxlength="15" readonly id="Balance" />
             
            </div>
          </div>
      </div>

    <div>
     <div class="to">
     <p>To:</p>
    <label for="accountnumber" class="black">Account number:</label>
              <input type="text" maxlength="10" class="to_item" id="accountnumber" />
              <label for="accountname">Account name:</label>
              <input type="text" class="to_item" id="accountname" readonly />
              <label for="money" class="black">Money:</label>
              <input type="text" class="to_item" maxlength="15" id="money" />
              <label for="content" class="black">Content:</label>
              <input type="text" class="to_item" maxlength="15" id="content" value="PHAM DUY THANH DAN chuyen khoan" />
     </div>
    </div>
        </form>
        </div>
         <div class="to_item_next" style="width: 95%">Next</div>
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
    });


  </script>

  </html>