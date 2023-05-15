package gateway;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import DAO.CustomerDAO;
import DAO.StaffDAO;
import DAO.TransactionDAO;
import Object.Customer;
import connection.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StaffCreateUser
 */
public class StaffCreateUser extends HttpServlet {
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

		// get submit
		String customerPhone = request.getParameter("customerPhone");
		String customerName = request.getParameter("customerName");
		String customerEmail = request.getParameter("customerEmail");
		String customerOTP = request.getParameter("customerOTP");
		Integer balance = 0;
		Customer customer = new Customer(customerName, customerPhone, customerEmail, customerOTP, balance);
		if (customerDAO.checkPhoneExists(customerPhone)) {
			// phone number already exists, show error message
			out.println("<html><body>");
			out.println("<script>");
			out.println("alert('Phone number already exists');");
			out.println("location='admin_accuser.jsp';");
			out.println("</script>");
			out.println("</body></html>");
//			response.sendRedirect(request.getContextPath() + "/view/signup.jsp");
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
//			response.sendRedirect(request.getContextPath() + "/view/login.jsp");
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
