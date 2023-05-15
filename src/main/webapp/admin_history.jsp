<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <div class="content_history">

              <div class="content_time">
                <c:set var="currentDate" value="<%= java.time.LocalDate.now() %>" />
                <p>Time: ${currentDate.monthValue} / ${currentDate.year}</p>
                <div class="history_items">
                  <c:forEach var="currentTrans" items="${currentTransList}">
                    <div class="history_item">
                      <div class="history_item_content">
                        <p><span>${currentTrans.reciveName}</span> - <span>${currentTrans.reciverPhone}</span></p>
                        <p>${currentTrans.transactionNumber}</p>
                        <p>${currentTrans.transactionMessages}</p>
                      </div>
                      <div class="history_item_money">
                        <p>
                          <span>
                            <c:choose>
                              <c:when test="${empty currentTrans.senderPhone}">
                                <p>- ${currentTrans.transactionAmount} VND</p>
                                <p>Deposit</p>
                              </c:when>
                              <c:otherwise>
                                <p>+ ${currentTrans.transactionAmount} VND</p>
                                <p>Transaction</p>
                              </c:otherwise>
                            </c:choose>
                          </span>
                        </p>
                      </div>
                    </div>
                  </c:forEach>
                </div>
              </div>
              <div class="content_time">
                <c:set var="previousMonth" value="${currentDate.minusMonths(1)}" />
                <p>Time: ${previousMonth.monthValue} / ${previousMonth.year}</p>
                <div class="history_items">

                  <c:forEach var="previousTrans" items="${previousTransList}">
                    <div class="history_item">
                      <div class="history_item_content">
                        <p><span>${previousTrans.reciveName}</span> - <span>${previousTrans.reciverPhone}</span></p>
                        <p>${previousTrans.transactionNumber}</p>
                        <p>${previousTrans.transactionMessages}</p>
                      </div>
                      <div class="history_item_money">
                        <p>
                          <span>
                            <c:choose>
                              <c:when test="${empty previousTrans.senderPhone}">
                                <p> - ${previousTrans.transactionAmount} VND </p>
                                <p>Deposit</p>
                              </c:when>
                              <c:otherwise>
                                <p>+ ${previousTrans.transactionAmount} VND</p>
                                <p>Transaction</p>
                              </c:otherwise>
                            </c:choose>
                          </span>
                        </p>

                      </div>
                    </div>
                  </c:forEach>

                </div>
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
            .eq(3)
            .prepend("<div class='point'></div>");
          $("#header").find(".header_title").find("p").text("History");
        });
      });
    </script>

    </html>