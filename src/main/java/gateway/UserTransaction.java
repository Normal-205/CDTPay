package gateway;

import java.io.IOException;
import java.io.PrintWriter;

import DAO.CustomerDAO;
import Object.Customer;
import connection.DBManager;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserTransaction
 */
public class UserTransaction extends HttpServlet {
	private CustomerDAO customerDAO;
	private DBManager dbManager;
	private static final long serialVersionUID = 1L;

	@Override
	public void init() {
		dbManager = DBManager.getInstance();
		customerDAO = new CustomerDAO(dbManager);
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserTransaction() {
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

		String submitButtonValue = request.getParameter("submit");
		if (submitButtonValue != null) {
			if (submitButtonValue.equals("checkPhone")) {
				// Get the phone parameter from the HTML form
				String customerPhone = request.getParameter("customerPhone");
				// Call the method to get the customer by phone
				Customer customer = customerDAO.getCustomerByPhone(customerPhone);

				if (customer != null) {
					request.setAttribute("transaction", customer);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/transaction_user.jsp");
					dispatcher.forward(request, response);
				} else {
					out.println("<html><body>");
					out.println("<script>");
					out.println("alert('CANNOT FIND ACCOUNT NUMBER!');");
					out.println("location='transaction_user.jsp';");
					out.println("</script>");
					out.println("</body></html>");
				}
			} else if (submitButtonValue.equals("transfer")) {
				System.out.println("transfer");
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
		// Set the content type
		response.setContentType("text/html");

		// Output stream to write HTML response
		PrintWriter out = response.getWriter();

		String submitButtonValue = request.getParameter("submit");
		if (submitButtonValue != null) {
			if (submitButtonValue.equals("checkPhone")) {
				// Get the phone parameter from the HTML form
				String customerPhone = request.getParameter("customerPhone");
				// Call the method to get the customer by phone
				Customer customer = customerDAO.getCustomerByPhone(customerPhone);

				if (customer != null) {
					request.setAttribute("transaction", customer);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/transaction_user.jsp");
					dispatcher.forward(request, response);
				} else {
					out.println("<html><body>");
					out.println("<script>");
					out.println("alert('CANNOT FIND ACCOUNT NUMBER!');");
					out.println("location='transaction_user.jsp';");
					out.println("</script>");
					out.println("</body></html>");
				}
			} else if (submitButtonValue.equals("transfer")) {
				System.out.println("transfer");

			}
		}
	}

}
