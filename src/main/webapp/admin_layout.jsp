<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin's Layout</title>
    <link rel="stylesheet" href="style/css/home_user_style.css" />
    <link
      rel="stylesheet"
      href="style/font/fontawesome-free-6.3.0-web/css/all.min.css"
    />
  </head>
  <body>
    <div class="navbar navbar_admin">
      <div class="navbar_logo"><h1>CDTPay</h1></div>
      <ul class="navbar_items">
        <li class="navbar_item hiden navad">
          <a href="dashboard.jsp"><i class="fa-solid fa-house"></i>Dashboard</a>
        </li>
        <li class="navbar_item hiden">
          <a href="admin_transaction.jsp"
            ><i class="fa-solid fa-right-left"></i>Transaction</a
          >
        </li>
        <li class="navbar_item hiden">
          <a href="admin_deposit.jsp"
            ><i class="fa-solid fa-wallet"></i>Deposit</a
          >
        </li>

        <li class="navbar_item hiden">
          <a href="admin_history.jsp"
            ><i class="fa-solid fa-clock-rotate-left"></i>History</a
          >
        </li>
        <li class="navbar_item hiden">
          <a href="admin_saving.jsp"
            ><i class="fa-solid fa-piggy-bank"></i>Saving</a
          >
        </li>
        <li class="navbar_item hiden navad">
          <a href="admin_accuser.jsp"
            ><i class="fa-solid fa-user"></i>User Account</a
          >
        </li>
        <li class="navbar_item hiden">
          <a href="#"><i class="fa-solid fa-phone-volume"></i>Support</a>
        </li>
      </ul>
    </div>
    <div class="header header_admin">
      <div class="header_title"><p>Dashboard</p></div>
      <!-- role ở đây ne -->
      <input
        type="text"
        id="role"
        hidden="true"
        value="${sessionScope.staff.staffRole}"
      />
      <div class="header_user">
        <img src="style/img/page's avatar.png" alt="" />
        <p>${sessionScope.staff.staffName}</p>
        <i class="fa-sharp fa-solid fa-chevron-down"></i>

        <div class="header_dropdown">
          <ul class="header_dropdown_items">
            <li class="header_dropdown_item">
              <a href="StaffLoginServlet"
                ><i class="fa-solid fa-arrow-right-from-bracket"></i>Log out</a
              >
            </li>
          </ul>
        </div>
      </div>
    </div>
  </body>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.min.js"></script>

  <script>
    $(document).ready(function () {
      if ($("#role").val() === "admin") {
        $(".navad").removeClass("hiden");
      } else {
        $(".navbar_item").removeClass("hiden");
      }
    });
  </script>
</html>
