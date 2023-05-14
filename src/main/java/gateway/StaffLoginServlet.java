package gateway;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import DAO.CustomerDAO;
import DAO.StaffDAO;
import Object.Customer;
import Object.Staff;
import connection.DBManager;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class StaffLoginServlet
 */
public class StaffLoginServlet extends HttpServlet {
	private DBManager dbManager;
	private StaffDAO staffDAO;
	private CustomerDAO customerDAO;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StaffLoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void init() {
		dbManager = DBManager.getInstance();
		staffDAO = new StaffDAO(dbManager);
		customerDAO = new CustomerDAO(dbManager);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// handle log out function
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("admin_login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Set the content type
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// Output stream to write HTML response
		PrintWriter out = response.getWriter();
		// get attribute
		String staffName = request.getParameter("staffName");
		String staffPassword = request.getParameter("staffPassword");
		// Check if the user exists in the database then set the session attribute to
		// the customer object
		if (staffDAO.checkLogin(staffName, staffPassword)) {
			// get staff object
			Staff staff = staffDAO.getStaffByName(staffName);
			// get staff role go set session for user management
			String staffRole = staff.getStaffRole();
			if (staffRole.equals("admin")) {
				System.out.println("This is admin");
				List<Staff> staffList = staffDAO.getAllStaff();
				request.getSession().setAttribute("staffList", staffList);
			} else if (staffRole.equals("staff")) {
				System.out.println("This is staff");
				List<Customer> customerList = customerDAO.getAllCustomer();
				request.getSession().setAttribute("customerList", customerList);
			}
			request.getSession().setAttribute("staff", staff);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/dashboard.jsp");
			dispatcher.forward(request, response);
		} else {
			System.out.println("NOT OKE");
			out.println("<html><body>");
			out.println("<script>");
			out.println("alert('Invalid username or password. Please check again');");
			out.println("location='admin_login.jsp';");
			out.println("</script>");
			out.println("</body></html>");
		}
	}

}
