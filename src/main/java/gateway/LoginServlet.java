package gateway;

import java.io.IOException;
import java.io.PrintWriter;

import DAO.CustomerDAO;
import connection.DBManager;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private CustomerDAO customerDAO;
	private DBManager dbManager;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public LoginServlet() {
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
		// handle log out function
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("login.jsp");
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
		String customerPhone = request.getParameter("phone");
		String customerOTP = request.getParameter("password");

		// Check if the user exists in the database then set the session attribute to
		// the customer object
		if (customerDAO.checkLogin(customerPhone, customerOTP)) {
			System.out.println("OKE");
			request.getSession().setAttribute("customer", customerDAO.getCustomerByPhone(customerPhone));
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/home_user.jsp");
			dispatcher.forward(request, response);

		} else {
			System.out.println("NOT OKE");
			out.println("<html><body>");
			out.println("<script>");
			out.println("alert('Invalid username or password. Please check again');");
			out.println("location='login.jsp';");
			out.println("</script>");
			out.println("</body></html>");
//			request.setAttribute("error", "Invalid username or password");
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
//			dispatcher.forward(request, response);
		}
	}

}
