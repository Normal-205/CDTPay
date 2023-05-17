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
 * Servlet implementation class StaffCreateUser
 */
public class StaffCreateUser extends HttpServlet {
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

	public StaffCreateUser() {
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
		// get submit
		String Phone = request.getParameter("Phone");
		String Name = request.getParameter("Name");
		String Email = request.getParameter("Email");
		String OTP = request.getParameter("OTP");
		String role = request.getParameter("role");
		Integer balance = 0;
		if (staffRole.equals("admin")) {
			Staff staff = new Staff(OTP, Name, Phone, Email, role);
			if (staffDAO.checkNameExists(Name)) {
				// phone number already exists, show error message
				out.println("<html><body>");
				out.println("<script>");
				out.println("alert('Username already exists');");
				out.println("location='admin_accuser.jsp';");
				out.println("</script>");
				out.println("</body></html>");
			} else {
				// Call the UserDAO method to create staff into the database
				staffDAO.createStaff(staff);
				List<Staff> staffList = staffDAO.getAllStaff();
				request.getSession().setAttribute("staffList", staffList);
				// Sign up successful, redirect to the login page
				out.println("<html><body>");
				out.println("<script>");
				out.println("alert('Sign Up Succesfully');");
				out.println("location='admin_accuser.jsp';");
				out.println("</script>");
				out.println("</body></html>");
			}
		} else if (staffRole.equals("staff")) {
			Customer customer = new Customer(Name, Phone, Email, OTP, balance);
			if (customerDAO.checkPhoneExists(Phone)) {
				// phone number already exists, show error message
				out.println("<html><body>");
				out.println("<script>");
				out.println("alert('Phone number already exists');");
				out.println("location='admin_accuser.jsp';");
				out.println("</script>");
				out.println("</body></html>");
				// response.sendRedirect(request.getContextPath() + "/view/signup.jsp");
			} else {
				// Call the UserDAO method to insert the user into the database
				customerDAO.createUser(customer);
				List<Customer> customerList = customerDAO.getAllCustomer();
				request.getSession().setAttribute("customerList", customerList);
				// Sign up successful, redirect to the login page
				out.println("<html><body>");
				out.println("<script>");
				out.println("alert('Sign Up Succesfully');");
				out.println("location='admin_accuser.jsp';");
				out.println("</script>");
				out.println("</body></html>");
			}
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
