package Controllers;

import java.io.IOException;
import java.io.PrintWriter;

import DAO.CustomerDAO;
import DAO.TransactionDAO;
import Models.Customer;
import Models.Staff;
import Models.Transaction;
import connection.DBManager;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminDepositServlet
 */
public class AdminDepositServlet extends HttpServlet {
	private CustomerDAO customerDAO;
	private TransactionDAO transactionDAO;
	private DBManager dbManager;
	private static final long serialVersionUID = 1L;

	@Override
	public void init() {
		dbManager = DBManager.getInstance();
		customerDAO = new CustomerDAO(dbManager);
		transactionDAO = new TransactionDAO(dbManager);
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminDepositServlet() {
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
		String submitButtonValue = request.getParameter("submit");
		if (submitButtonValue != null) {
			if (submitButtonValue.equals("checkPhone")) {
				// Get the phone parameter from the HTML form
				String customerPhone = request.getParameter("customerPhone");
				// Call the method to get the customer by phone
				Customer customer = customerDAO.getCustomerByPhone(customerPhone);
				if (customer != null) {
					request.setAttribute("customDep", customer);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin_deposit.jsp");
					dispatcher.forward(request, response);
				} else {
					out.println("<html><body>");
					out.println("<script>");
					out.println("alert('CANNOT FIND ACCOUNT NUMBER!');");
					out.println("location='admin_deposit.jsp';");
					out.println("</script>");
					out.println("</body></html>");
				}
			} else if (submitButtonValue.equals("Deposit")) {
				// Retrieve the customer object from the session
				HttpSession session = request.getSession();
				Staff staffSession = (Staff) session.getAttribute("staff");
				// Retrieve the information from session
				Integer staffID = staffSession.getStaffID();
				// Get parameters from the HTML form
				String customerPhone = request.getParameter("customerPhone");
				Integer balance = Integer.parseInt(request.getParameter("balance"));
				Integer amount = Integer.parseInt(request.getParameter("amount"));
				String transactionMessages = request.getParameter("transactionMessages");
				// count balance
				Integer newBalance = balance + amount;
				// create a transaction object
				Transaction transaction = new Transaction(staffID, customerPhone, transactionMessages, amount);
				// Call the method to update the balance
				boolean result = customerDAO.updateBalance(customerPhone, newBalance);
				if (result) {
					// Call the method to insert the transaction
					boolean result2 = transactionDAO.createStaffTransaction(transaction);
					if (result2) {
						// alert success
						out.println("<html><body>");
						out.println("<script>");
						out.println("alert('DEPOSIT SUCCESS! Press OKE to comeback :0');");
						out.println("location='admin_deposit.jsp';");
						out.println("</script>");
						out.println("</body></html>");
					}
				}
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
