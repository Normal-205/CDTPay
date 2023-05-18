# [English Below] - [Database Visualization Below Also]
# Website ngân hàng CDTPay - Made by Chung - Duy - Thuong.
## Đây là phiên bản cải tiến so với hệ thống quản lý ngân hàng mà chúng mình đã làm hồi trước.
### Mục đích của ứng dụng này là cung cấp một trang web ngân hàng với nhiều tính năng khác nhau.
### Công nghệ sử dụng: HTML, CSS, JS, Java, JSP, Servlet. Dữ liệu được lưu trữ & quản lý bằng MySQL
### Yêu cầu hệ thống: 
- Java Development Kit (JDK)
- Apache Tomcat Server
- MySQL database server
- Eclipse phiên bản >= 2022-06

### Cách chạy chương trình: 
- Thiết lập cơ sở dữ liệu MySQL và config kết nối trong ứng dụng.
- Deploy ứng dụng trên máy chủ Apache Tomcat. (Nhớ thêm file JAR trong lib folder vào Build path)
- Truy cập trang web thông qua trình duyệt web bằng cách nhập URL.

### Các tính năng nổi bật:

- Quản lý người dùng: Hoạt động CRUD để quản lý tài khoản người dùng.
- Gửi tiền & Rút tiền: Người dùng có thể gửi và rút tiền từ tài khoản của họ.
- Lịch sử giao dịch: Website lưu trữ lịch sử của tất cả các giao dịch, bao gồm thông tin của người gửi và người nhận, cũng như số tiền chuyển.
- Xác thực: Người dùng và quản trị viên có thể đăng nhập để truy cập các chức năng tương ứng của họ.
- Chức năng quản trị viên: Quản trị viên có các phương thức và đặc quyền bổ sung so với người dùng thông thường.

### Mô tả dự án:
- Website ngân hàng được thiết kế với ba cấp độ người dùng: Người dùng, Nhân viên và Quản trị viên. Mỗi cấp độ có các chức năng khác nhau, với quản trị viên có nhiều đặc quyền hơn người dùng thông thường.
- Khi khởi chạy ứng dụng, người dùng được nhắc đăng nhập. Thông tin đăng nhập được lưu trữ trong bảng Customer của cơ sở dữ liệu MySQL.
- Sau khi đăng nhập, người dùng có thể truy cập các tính năng khác nhau của trang web. 
- Tính năng chuyển khoản cho phép người dùng gửi và nhận tiền bằng cách sử dụng số điện thoại làm định danh. Dữ liệu lịch sử chuyển tiền được lưu trữ trong bảng Transaction của cơ sở dữ liệu MySQL.
- Thông tin liên quan đến tài khoản của quản trị viên, nhân viên được lưu trữ trong bảng Staff.
- Thông tin về các gói tiết kiệm của người dùng được lưu trong bảng Saving
Thông tin cá nhân của cả quản trị viên và người dùng được lưu trong bảng Dữ liệu của cơ sở dữ liệu.

### Phương án mở rộng trong tương lai:
- Tối ưu hóa code
- Tăng thêm lớp bảo mật
- Triển khai gamification 
__________________________________________________________________________________________
# CDTPay - Made by Chung - Duy - Thuong.
## This is an improved version compared to the bank management system that we did before.
### This application aims to provide a banking website with various features. 
### Technology used: HTML, CSS, JS, Java, JSP, Servlet. Data is stored & managed using MySQL

### System Requirements:
- Java Development Kit (JDK)
- Apache Tomcat Server
- MySQL database server
- Eclipse with version >= 2022 - 06

### How to Run:
- Set up the MySQL database and configure the connection settings in the application.
- Deploy the application on an Apache Tomcat server.
- Access the website through a web browser by entering the appropriate URL.

### Features:
- User Management: CRUD operations for managing user accounts.
- Deposit & Withdraw: Users can deposit and withdraw funds from their accounts.
- Transaction History: The application maintains a record of all transactions, including the sender's and recipient's information, as well as the transfer amount.
- Authentication: Users and administrators can log in to access their respective functionalities.
- Admin Functions: Administrators have additional methods and privileges compared to regular users.

### Project Description:
- Banking website is designed with 3 user levels: User, Administrator and Staff. Each level has different functions, with administrators having more privileges than regular users.
- When launching the application, the user is prompted to login. The login information is stored in the Customer table of the MySQL database.
- Once logged in, the user can access various features of the website.
- Transfer feature allows users to send and receive money using phone number as identifier. Transfer history data is stored in the Transaction table of the MySQL database.
- Information related to administrator and employee accounts is stored in the Staff table.
- Information about the user's savings plans is saved in the Savings table
The personal information of both the administrator and the user is stored in the Data table of the database.

### Future Plans:
- Code optimization
- Extra layer of security
- Deploy gamification

### For more information: Pls direct me with the information in the profile. I'm very pleasant to help!
# Database Visualization
![DesignDB](https://user-images.githubusercontent.com/73392859/233918153-ad04ec07-83ba-49c3-854a-842dd1e12644.jpg)
