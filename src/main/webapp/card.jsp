<%@ page language="java" contentType="text/html ; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>American Express Fake 1:1</title>
    <link rel="stylesheet" href="style/css/home_user_style.css" />
    <link
      rel="stylesheet"
      href="style/font/fontawesome-free-6.3.0-web/css/all.min.css"
    />
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
    <div class="content_card">
      <div class="card">
        <div class="card_name">
          <p>CDTPay</p>
          <img src="style/img/R.png" alt="" />
        </div>

        <img src="style/img/icons8-chip-card-80.png" alt="" />
        <p>${sessionScope.customer.phone}</p>
        <p>${sessionScope.customer.fullname}</p>
        <div class="since">
          <p>
            MEMBER <br />
            SINCE
          </p>
          <!-- Get YEAR & MONTH -->
           <fmt:parseDate value="${sessionScope.customer.createAt}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
		   <fmt:formatDate value="${parsedDate}" var="month" type="date" pattern="MM" />
		   <fmt:formatDate value="${parsedDate}" var="year" type="date" pattern="yy" />
          <p>${month}/${year}</p>
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
          .eq(4)
          .prepend("<div class='point'></div>");
        $("#header").find(".header_title").find("p").text("Card service");
      });
    });
  </script>
</html>
