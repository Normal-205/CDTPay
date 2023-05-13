<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Main System</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
          <!-- End check -->
    <div id="header"></div>
 	<div class="dashboard">
 	<p>Statistics of the day:</p>
 	<div class="dashboard_block">
 	<div class="block xanh">
 	<p>Account User</p>
 	<p>27</p>
 	</div>
 	<div class="block tim">
 	<p>Amount deposited</p>
 	<p>1231232</p>
 	</div>
 	<div class="block cam">
 	<p>Number of transactions</p>
 	<p>27</p>
 	</div>
 	</div>
 	<div class="dashboard_chart">
 	<div>
 	<p>Statistics of the week:</p>
 	<canvas id="myChart1"></canvas>
 	</div>
 	
 	<div>
 	<p>Statistics of the year:</p>
 	<canvas id="myChart"></canvas>
 	</div>
 	
 	
 	</div>
 	</div>
  </body>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.min.js"></script>

  <script>
  var ctx = document.getElementById('myChart').getContext('2d');
  var myChart = new Chart(ctx, {
	    type: 'line', //Thay đổi loại biểu đồ thành 'line'
	    data: {
	        labels: ['January', 'February', 'March', 'April', 'May', 'June','August','September','October','November','December'],
	        datasets: [{
	            label: 'Number of accounts',
	            data: [12, 19, 3, 5, 2, 3,12,23,43,32,22,55,33],
	            backgroundColor: 'rgba(255, 99, 132, 0.5)',
	            borderColor: 'rgba(255, 99, 132, 1)',
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            y: {
	                beginAtZero: true
	            }
	        }
	    }
	});
  var ctx1 = document.getElementById('myChart1').getContext('2d');
  var myChart1 = new Chart(ctx1, {
      type: 'bar',
      data: {
          labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
          datasets: [{
              label: 'Number of transactions',
              data: [12, 24, 8, 17, 23, 11, 7],
              backgroundColor: [
                  'rgba(255, 99, 132, 0.5)',
                  'rgba(54, 162, 235, 0.5)',
                  'rgba(255, 206, 86, 0.5)',
                  'rgba(75, 192, 192, 0.5)',
                  'rgba(153, 102, 255, 0.5)',
                  'rgba(255, 159, 64, 0.5)',
                  'rgba(250, 113, 172, 1)'
              ],
              borderColor: [
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(255, 159, 64, 1)',
                  'rgba(250, 113, 172, 1)'
              ],
              borderWidth: 1
          }]
      },
      options: {
          scales: {
              y: {
                  beginAtZero: true
              }
          },
          title: {
              display: true,
              text: 'Number of Transactions per Day'
          }
      }
  });

    $(document).ready(function () {
      $("#header").load("admin_layout.jsp", function () {
        $("#header")
          .find(".navbar_item")
          .eq(0)
          .prepend("<div class='point'></div>");
    $("#header").find(".header_title").find("p").text("Dashboard");
      });
    });

  </script>

  </html>