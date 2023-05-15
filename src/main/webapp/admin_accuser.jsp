<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="Object.Staff" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Account Management</title>
        <link rel="stylesheet" href="style/css/home_user_style.css" />
        <link rel="stylesheet" href="style/font/fontawesome-free-6.3.0-web/css/all.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
              <div class="account">
                <div>
                  <button class="btn create-btn">Create account</button>
                  <div class="search">
                    <input type="text" class="accountnumber search_input" maxlength="10"
                      placeholder="Search phone number" />
                  </div>
                </div>
                <div class="createbgr hiden">
                  <div class="create_bg">
                  </div>
                  <form action="StaffCreateUser" method="get">

                    <div class="create_form">
                      <div class="create-form-items">
                        <p>Create account</p>
                        <input type="text" name="Phone" placeholder="Phone number" maxlength="10" />
                        <input type="text" name="Name" placeholder="Fullname" />
                        <input type="text" name="Email" placeholder="Email" />
                        <input type="text" name="OTP" placeholder="Password" maxlength="6" />
                        <select name="role" class="roleuser hiden">
                          <option value="admin">admin</option>
                          <option value="staff">staff</option>
                        </select>
                        <input type="submit" class="btn create-submit btnsubmit" value="Create Account" />
                      </div>
                    </div>
                  </form>
                </div>

                <div id="tableContainer">
                  <table id="dataTable">
                    <thead>
                      <tr>
                        <th>Phone number</th>
                        <th>Fullname</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Role</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:choose>
                        <c:when test="${sessionScope.staff.staffRole == 'admin'}">
                          <!-- Code to execute if staff role is 'admin' -->
                          <c:forEach var="staff" items="${staffList}">
                            <tr>
                              <td>${staff.staffPhone}</td>
                              <td>${staff.staffName}</td>
                              <td>${staff.staffEmail}</td>
                              <td>${staff.staffPassword}</td>
                              <td>${staff.staffRole}</td>
                              <td>
                                <button class="btn update-btn" data-id="${staff.staffID}"
                                  data-phone="${staff.staffPhone}" data-name="${staff.staffName}"
                                  data-email="${staff.staffEmail}" data-role="${staff.staffRole}">Update</button>
                                <a href="StaffDeleteServlet?action=delete&staffID=${staff.staffID}">
                                  <div class="btn delete-btn hiden">Delete</div>
                                </a>
                              </td>
                            </tr>
                          </c:forEach>
                        </c:when>
                        <c:when test="${sessionScope.staff.staffRole == 'staff'}">
                          <!-- Code to execute if staff role is 'staff' -->
                          <p>Welcome, staff member!</p>
                          <c:forEach var="customer" items="${customerList}">
                            <tr>
                              <td>${customer.phone}</td>
                              <td>${customer.fullname}</td>
                              <td>${customer.email}</td>
                              <td>${customer.password}</td>
                              <td>user</td>
                              <td>
                                <button class="btn update-btn" data-phone="${customer.phone}"
                                  data-name="${customer.fullname}" data-email="${customer.email}"
                                  data-role="user">Update</button>
                                <button class="btn delete-btn hiden">Delete</button>
                              </td>
                            </tr>
                          </c:forEach>
                          <!-- Additional staff-specific content -->
                        </c:when>
                      </c:choose>
                    </tbody>
                  </table>
                </div>
                <div id="paginationContainer">
                  <div id="prevButton"><i class="fa-solid fa-angle-left"></i></div>
                  <ul id="pagination"></ul>
                  <div id="nextButton"><i class="fa-solid fa-angle-right"></i></div>
                </div>
                <div class="updatebgr hiden">
                  <div class="update_bg">
                  </div>
                  <form action="StaffUpdateUser" method="get">
                    <div class="update_form">
                      <div class="update-form-items">
                        <p>Update account</p>
                        <input type="text" name="ID" class="id" hidden readonly>
                        <input type="text" name="Phone" placeholder="Phone number" class="phone" readonly />
                        <input type="text" name="Name" placeholder="Fullname" class="name" />
                        <input type="text" name="Email" placeholder="Email" class="email" />
                        <input type="text" name="OTP" placeholder="Password" maxlength="6" required />
                        <select name="role" class="roleuser hiden">
                          <option value="admin">admin</option>
                          <option value="staff">staff</option>
                        </select>
                        <input type="submit" class="btn update-submit btnsubmit" value="Update Account" />
                      </div>
                    </div>
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
              .eq(5)
              .prepend("<div class='point'></div>");
            $("#header").find(".header_title").find("p").text("Account user");
            if ($("#header").find("#role").val() === "admin") {
              $(".delete-btn,.roleuser").removeClass("hiden");
            }
          });
          $(".create-btn").click(function () {
            $(".createbgr").removeClass("hiden");
          });
          $(".create_bg").click(function () {
            $(".createbgr").addClass("hiden");
          });
          $(".update-btn").click(function () {
            $(".updatebgr").removeClass("hiden");
            $(".update-form-items .id").val($(this).data("id"));
            $(".update-form-items .phone").val($(this).data("phone"));
            $(".update-form-items .name").val($(this).data("name"));
            $(".update-form-items .email").val($(this).data("email"));
            $(".update-form-items .roleuser").val($(this).data("role"));
          });
          $(".update_bg").click(function () {
            $(".updatebgr").addClass("hiden");
          });
        });
        $(document).ready(function () {
          $(".accountnumber").on("keypress", function (e) {
            var keyCode = e.which ? e.which : e.keyCode;
            if (keyCode < 48 || keyCode > 57) {
              e.preventDefault();
            }
          });
        });
        //search
        $(document).ready(function () {
          $(".search_input").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#dataTable tbody tr").filter(function () {
              $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
            });
          });
        });
        $(document).ready(function () {
          var rowsPerPage = 8;
          var rows = $("#dataTable tbody tr");
          var numRows = rows.length;
          var numPages = Math.ceil(numRows / rowsPerPage);
          for (var i = 1; i <= numPages; i++) {
            $("#pagination").append(
              '<li><a href="#" class="page-link">' + i + "</a></li>"
            );
          }
          $("#pagination li:nth-child(1) a").addClass("u");
          showPage(1);

          // Sự kiện khi nhấp vào nút Previous
          $("#prevButton").click(function () {

            var currentPage = parseInt($("#pagination li a.u").text());
            if (currentPage > 1) {
              $(".page-link").removeClass("u");
              $("#pagination li:nth-child(" + (currentPage - 1) + ") a").addClass("u");
              showPage(currentPage - 1);
            }
          });

          // Sự kiện khi nhấp vào nút Next
          $("#nextButton").click(function () {
            var currentPage = parseInt($("#pagination li a.u").text());
            if (currentPage < numPages) {
              $(".page-link").removeClass("u");
              $("#pagination li:nth-child(" + (currentPage + 1) + ") a").addClass("u");
              showPage(currentPage + 1);
            }
          });

          $("#pagination").on("click", ".page-link", function () {
            var page = $(this).text();
            $(".page-link").removeClass("u");
            $(this).addClass("u");
            showPage(page);
          });

          function showPage(page) {
            var start = (page - 1) * rowsPerPage;
            var end = start + rowsPerPage;

            rows.hide();
            rows.slice(start, end).show();

            $("#pagination .page-link").removeClass("active");
            $("#pagination li:nth-child(" + page + ") a").addClass("active");
          }
        });

      </script>

      </html>