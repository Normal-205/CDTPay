package gateway;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import DAO.CustomerDAO;
import DAO.StaffDAO;
import DAO.TransactionDAO;
import Object.Staff;
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
	private TransactionDAO transactionDAO;
	private CustomerDAO customerDAO;
	private static final long serialVersionUID = 1L;

	@Override
	public void init() {
		dbManager = DBManager.getInstance();
		staffDAO = new StaffDAO(dbManager);
		transactionDAO = new TransactionDAO(dbManager);
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
//		String updateRoleee = request.getParameter("role");
//		System.out.println("bruh" + updateRoleee);
		// Get parameters from the HTML form
		if (staffRole.equals("admin")) {
			// get submit
			String staffPhone = request.getParameter("Phone");
			String staffName = request.getParameter("Name");
			String staffEmail = request.getParameter("Email");
			String staffOTP = request.getParameter("OTP");
			String updateRole = request.getParameter("role");

			Staff staff = new Staff(null, staffOTP, staffName, staffPhone, staffEmail, staffRole);
			if (staffDAO.checkNameExists(staffName)) {
				// phone number already exists, show error message
				out.println("<html><body>");
				out.println("<script>");
				out.println("alert('Phone number already exists');");
				out.println("location='admin_accuser.jsp';");
				out.println("</script>");
				out.println("</body></html>");
//				response.sendRedirect(request.getContextPath() + "/view/signup.jsp");
			} else {
				// Call the UserDAO method to insert the user into the database
				staffDAO.updateStaff(staff);
				List<Staff> staffList = staffDAO.getAllStaff();
				request.getSession().setAttribute("staffList", staffList);
				// Sign up successful, redirect to the login page
				out.println("<html><body>");
				out.println("<script>");
				out.println("alert('Update Succesfully');");
				out.println("location='admin_accuser.jsp';");
				out.println("</script>");
				out.println("</body></html>");
//				response.sendRedirect(request.getContextPath() + "/view/login.jsp");
			}
		} else if (staffRole.equals("staff")) {
			String updateRole = request.getParameter("role");
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
