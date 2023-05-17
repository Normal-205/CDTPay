package Controllers;

import java.io.IOException;
import java.io.PrintWriter;

import DAO.CustomerDAO;
import Models.Customer;
import connection.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignUpServlet
 */
public class SignUpServlet extends HttpServlet {
	private CustomerDAO customerDAO;
	private DBManager dbManager;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignUpServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void init() {
		dbManager = DBManager.getInstance();
		customerDAO = new CustomerDAO(dbManager);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Set the content type
		response.setContentType("text/html");

		// Output stream to write HTML response
		PrintWriter out = response.getWriter();
		// Get user information from the form
		String fullname = request.getParameter("fullname");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		// Create a new customer object with the form data
		Customer customer = new Customer(fullname, phone, email, password, 0);

		if (customerDAO.checkPhoneExists(phone)) {
			// phone number already exists, show error message
			out.println("<html><body>");
			out.println("<script>");
			out.println("alert('Phone number already exists');");
			out.println("location='signup.jsp';");
			out.println("</script>");
			out.println("</body></html>");
//			response.sendRedirect(request.getContextPath() + "/view/signup.jsp");
		} else {
			// Call the UserDAO method to insert the user into the database
			customerDAO.createUser(customer);
			// Sign up successful, redirect to the login page
			out.println("<html><body>");
			out.println("<script>");
			out.println("alert('Sign Up Succesfully');");
			out.println("location='login.jsp';");
			out.println("</script>");
			out.println("</body></html>");
//			response.sendRedirect(request.getContextPath() + "/view/login.jsp");
		}
	}

}
