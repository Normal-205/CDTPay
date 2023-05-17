package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import DAO.CustomerDAO;
import DAO.SavingDAO;
import DAO.TransactionDAO;
import Models.Saving;
import Models.Transaction;
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
	private DBManager dbManager;
	private TransactionDAO transactionDAO;
	private CustomerDAO customerDAO;
	private SavingDAO savingDAO;
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
		savingDAO = new SavingDAO(dbManager);
		transactionDAO = new TransactionDAO(dbManager);
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
		// initial saving object in list structure
		List<Saving> savingList = savingDAO.getSavingByPhone(customerPhone);
		// initial recent transaction in list structure
		List<Transaction> recentTransactionList = transactionDAO.getRecentTransactionByPhone(customerPhone);
		Integer currentMonth = transactionDAO.getSpecificMonth(0);
		Integer previousMonth = transactionDAO.getSpecificMonth(1);
		List<Transaction> currentTransList = transactionDAO.getTransactionHistoryByPhone(customerPhone, currentMonth);
		List<Transaction> previousTransList = transactionDAO.getTransactionHistoryByPhone(customerPhone, previousMonth);
		// debug list transaction
		for (Transaction transaction : currentTransList) {
			System.out.println(transaction.getReciveName());
			System.out.println(transaction.getReciverPhone());
		}
		// Check if the user exists in the database then set the session attribute to
		// the customer object
		if (customerDAO.checkLogin(customerPhone, customerOTP)) {
			// System.out.println("Login session created");
			request.getSession().setAttribute("customer", customerDAO.getCustomerByPhone(customerPhone));
			request.getSession().setAttribute("savingList", savingList);
			request.getSession().setAttribute("recentTransaction", recentTransactionList);
			request.getSession().setAttribute("currentTransList", currentTransList);
			request.getSession().setAttribute("previousTransList", previousTransList);
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
		}
	}

}
