<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="style/css/home_user_style.css" />
    <link rel="stylesheet" href="style/font/fontawesome-free-6.3.0-web/css/all.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  </head>

  <body>
    <div id="header"></div>
   <div class="account">
   <div>
      <button class="btn create-btn">Create account</button>
      <div class="search">
      <form action="">
      <input type="text" class="accountnumber search_input" maxlength="10" placeholder="Search phone number"/>
      <input type="submit" value="Search" class="search_submit"/>
      </form>
      </div>
   </div>
      <div class="createbgr hiden">      
      <div class="create_bg">
      </div>
        <div class="create_form">
          <div class="create-form-items">
            <p>Create account</p>
            <input type="text" placeholder="Phone number" />
            <input type="text" placeholder="Fullname" />
            <input type="text" placeholder="Email" />
            <input type="password" placeholder="Password" />
            <select class="roleuser hiden">
            <option value="user">user</option>
            <option value="admin">admin</option>
            <option value="nv">nv</option>
            </select>
            <button class="btn create-submit">Create Account</button>
          </div>
        </div>
      </div>
      <table>
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
          <tr>
            <td>0368808518</td>
            <td>NGUYEN THANH CHUNG</td>
            <td>ntc@gmai.com</td>
            <td>642002</td>
            <td>user</td>
            <td>
              <button class="btn update-btn"  data-phone="0368808518" data-name="NGUYEN THANH CHUNG" data-email="ntc@gmai.com" data-role="user">Update</button>
              <button class="btn delete-btn hiden">Delete</button>
            </td>
          </tr>
          <tr>
            <td>0368808513</td>
            <td>NGUYEN THANH CHUNG</td>
            <td>ntc@gmai.com</td>
            <td>271102</td>
            <td>user</td>
            <td>
              <button class="btn update-btn">Update</button>
              <button class="btn delete-btn hiden">Delete</button>
            </td>
          </tr>
        </tbody>
      </table>
      <div class="updatebgr hiden">
        <div class="update_bg">
      </div>
        <div class="update_form">
          <div class="update-form-items">
            <p>Update account</p>
            <input type="text" placeholder="Phone number" class="phone"/>
            <input type="text" placeholder="Fullname" class="name"/>
            <input type="text" placeholder="Email" class="email"/>
            <input type="password" placeholder="Password" />
             <select class="roleuser hiden">
            <option value="user">user</option>
            <option value="admin">admin</option>
            <option value="nv">nv</option>
            </select>
            <button class="btn update-submit">Update Account</button>
          </div>
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
          .eq(5)
          .prepend("<div class='point'></div>");
        $("#header").find(".header_title").find("p").text("Account user");
       if(  $("#header").find("#role").val()==="admin"){
    	   $(".delete-btn,.roleuser").removeClass("hiden");
       }
      });
      $(".create-btn").click(function(){
    	  $(".createbgr").removeClass("hiden");
      });
      $(".create_bg").click(function(){
    	  $(".createbgr").addClass("hiden");
      });
      $(".update-btn").click(function(){
    	  $(".updatebgr").removeClass("hiden");
    	  $(".update-form-items .phone").val($(this).data("phone"));
    	  $(".update-form-items .name").val($(this).data("name"));
    	  $(".update-form-items .email").val($(this).data("email"));
    	  $(".update-form-items .roleuser").val($(this).data("role"));
      });
      $(".update_bg").click(function(){
    	  $(".updatebgr").addClass("hiden");
      });
      $('.delete-btn').click(() => {
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
    });
    $(document).ready(function () {
        $(".accountnumber").on("keypress", function (e) {
          var keyCode = e.which ? e.which : e.keyCode;
          if (keyCode < 48 || keyCode > 57) {
            e.preventDefault();
          }
        });
      });

  </script>

  </html>