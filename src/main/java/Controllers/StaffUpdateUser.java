package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import DAO.CustomerDAO;
import DAO.StaffDAO;
import Models.Customer;
import Models.Staff;
import connection.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class StaffUpdateUser
 */
public class StaffUpdateUser extends HttpServlet {
	private DBManager dbManager;
	private StaffDAO staffDAO;
	private CustomerDAO customerDAO;
	private static final long serialVersionUID = 1L;

	@Override
	public void init() {
		dbManager = DBManager.getInstance();
		staffDAO = new StaffDAO(dbManager);
		customerDAO = new CustomerDAO(dbManager);
	}

	public StaffUpdateUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Set the content type
		response.setContentType("text/html");

		// Output stream to write HTML response
		PrintWriter out = response.getWriter();
		// Retrieve the customer object from the session
		HttpSession session = request.getSession();
		Staff staffSession = (Staff) session.getAttribute("staff");
		// Retrieve the information from session
		String staffRole = staffSession.getStaffRole();
		// seperate role
		if (staffRole.equals("admin")) {
			// get submit
			// Get parameters from the HTML form
			String staffPhone = request.getParameter("Phone");
			String staffName = request.getParameter("Name");
			String staffEmail = request.getParameter("Email");
			String staffOTP = request.getParameter("OTP");
			String updateRole = request.getParameter("role");
			Integer staffID = Integer.parseInt(request.getParameter("ID"));
			Staff staff = new Staff(staffID, staffOTP, staffName, staffPhone, staffEmail, updateRole);
			// Call the UserDAO method to update into the database
			staffDAO.updateStaff(staff);
			List<Staff> staffList = staffDAO.getAllStaff();
			request.getSession().setAttribute("staffList", staffList);
			// Update successful, redirect to the page
			out.println("<html><body>");
			out.println("<script>");
			out.println("alert('Update Succesfully');");
			out.println("location='admin_accuser.jsp';");
			out.println("</script>");
			out.println("</body></html>");
			// response.sendRedirect(request.getContextPath() + "/view/login.jsp");
		} else if (staffRole.equals("staff")) {
			String customerPhone = request.getParameter("Phone");
			String customerName = request.getParameter("Name");
			String customerEmail = request.getParameter("Email");
			String customerOTP = request.getParameter("OTP");
			Customer customer = new Customer(customerName, customerPhone, customerEmail, customerOTP, null);
			// Call the UserDAO method to update into the database
			customerDAO.updateCustomer(customer);
			List<Customer> customerList = customerDAO.getAllCustomer();
			request.getSession().setAttribute("customerList", customerList);
			// Update successful, redirect to the page
			out.println("<html><body>");
			out.println("<script>");
			out.println("alert('Update Succesfully');");
			out.println("location='admin_accuser.jsp';");
			out.println("</script>");
			out.println("</body></html>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
