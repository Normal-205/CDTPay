package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import DAO.CustomerDAO;
import DAO.TransactionDAO;
import Models.Customer;
import Models.Transaction;
import connection.DBManager;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class UserTransaction
 */
public class UserTransaction extends HttpServlet {
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
				// Retrieve the customer object from the session
				HttpSession session = request.getSession();
				Customer customerSession = (Customer) session.getAttribute("customer");
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

			} else if (submitButtonValue.equals("transaction")) {
				// Retrieve the customer object from the session
				HttpSession session = request.getSession();
				Customer customer = (Customer) session.getAttribute("customer");
				// Retrieve the information from session
				Integer balance = customer.getBalance();
				String senderPhone = customer.getPhone();
				String customerOTP = customer.getPassword();

				// Get the phone parameter from the HTML form
				String receiver = request.getParameter("customerPhone");
				String reciveName = request.getParameter("reciveName");
				Integer amount = Integer.parseInt(request.getParameter("amount"));
				String message = request.getParameter("message");
				String password = request.getParameter("password");
				// validate if customer's phone & receiver phone is the same
				if (receiver == senderPhone) {
					out.println("<html><body>");
					out.println("<script>");
					out.println("alert('CANNOT TRANSFER TO YOURSELF!');");
					out.println("location='transaction_user.jsp';");
					out.println("</script>");
					out.println("</body></html>");
				}
				// test
				System.out.println(reciveName);
				// validate password
				if (!password.equals(customerOTP)) {
					out.println("<html><body>");
					out.println("<script>");
					out.println("alert('WRONG PASSWORD!');");
					out.println("location='transaction_user.jsp';");
					out.println("</script>");
					out.println("</body></html>");
					return;
				}
				// create a transaction object
//				Transaction transaction = new Transaction(senderPhone, recievePhone,reciveName, message, amount, password);
				Transaction transaction = new Transaction(senderPhone, receiver, reciveName, message, amount);
				// count new balance from both user
				// update sender balance
				Integer newSenderBalance = balance - amount;
				customerDAO.updateBalance(senderPhone, newSenderBalance);
				// get receiver balance
				Customer reciever = customerDAO.getCustomerByPhone(receiver);
				Integer recieverBalance = reciever.getBalance();
				// update receiver balance
				Integer newRecieverBalance = recieverBalance + amount;
				customerDAO.updateBalance(receiver, newRecieverBalance);
				// import transaction to database
				transactionDAO.createUserTransaction(transaction);
				// update session
				Integer currentMonth = transactionDAO.getSpecificMonth(0);
				Integer previousMonth = transactionDAO.getSpecificMonth(1);
				List<Transaction> currentTransList = transactionDAO.getTransactionHistoryByPhone(senderPhone,
						currentMonth);
				List<Transaction> previousTransList = transactionDAO.getTransactionHistoryByPhone(senderPhone,
						previousMonth);
				// alert success
				out.println("<html><body>");
				out.println("<script>");
				out.println("alert('TRANSACTION SUCCESS! Press OKE to comeback :0');");
				out.println("location='transaction_user.jsp';");
				out.println("</script>");
				out.println("</body></html>");
				// set attribute
				request.getSession().setAttribute("customer", customerDAO.getCustomerByPhone(senderPhone));
				request.getSession().setAttribute("currentTransList", currentTransList);
				request.getSession().setAttribute("previousTransList", previousTransList);
				// redirect back to transaction_user.jsp
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/transaction_user.jsp");
				dispatcher.forward(request, response);
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
	}
}
