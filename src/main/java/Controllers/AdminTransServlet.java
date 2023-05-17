package Controllers;

import java.io.IOException;
import java.io.PrintWriter;

import DAO.CustomerDAO;
import DAO.TransactionDAO;
import Models.Customer;
import Models.Staff;
import connection.DBManager;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminTransServlet
 */
public class AdminTransServlet extends HttpServlet {
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
	public AdminTransServlet() {
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
			if (submitButtonValue.equals("checkacc1")) {
				// Get the phone parameter from the HTML form
				String senderPhone = request.getParameter("senderPhone");
				// Call the method to get the customer by phone
				Customer sender = customerDAO.getCustomerByPhone(senderPhone);
				if (sender != null) {
					request.setAttribute("sender", sender);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin_transaction.jsp");
					dispatcher.forward(request, response);
				} else {
					out.println("<html><body>");
					out.println("<script>");
					out.println("alert('CANNOT FIND ACCOUNT NUMBER!');");
					out.println("location='admin_transaction.jsp';");
					out.println("</script>");
					out.println("</body></html>");
				}
			} else if (submitButtonValue.equals("checkacc2")) {
				// copy from check1
				// Get the age parameter from the HTML form
				String senderPhone = request.getParameter("senderPhone");
				String reciverPhone = request.getParameter("reciverPhone");
				// Call the method to get the customer by phone
				Customer sender = customerDAO.getCustomerByPhone(senderPhone);
				Customer reciver = customerDAO.getCustomerByPhone(reciverPhone);
				if (sender != null && reciver != null) {
					request.setAttribute("sender", sender);
					request.setAttribute("reciver", reciver);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin_transaction.jsp");
					dispatcher.forward(request, response);
				} else {
					out.println("<html><body>");
					out.println("<script>");
					out.println("alert('CANNOT FIND ACCOUNT NUMBER!');");
					out.println("location='admin_transaction.jsp';");
					out.println("</script>");
					out.println("</body></html>");
				}
			} else if (submitButtonValue.equals("Next")) {
				// Retrieve the customer object from the session
				HttpSession session = request.getSession();
				Staff staffSession = (Staff) session.getAttribute("staff");
				// Retrieve the information from session
				Integer staffID = staffSession.getStaffID();
				// get information of sender
				String senderPhone = request.getParameter("senderPhone");
				Integer senderBalance = Integer.parseInt(request.getParameter("senderBalance"));
				Integer amount = Integer.parseInt(request.getParameter("amount"));

				// get information of receiver
				String reciverPhone = request.getParameter("reciverPhone");
				String transactionMessage = request.getParameter("transactionMessage");

				// create a transaction object
				Models.Transaction transaction = new Models.Transaction(senderPhone, staffID, reciverPhone,
						transactionMessage, amount);
				// print transaction for debug
				System.out.println(transaction.getReciveName());
				System.out.println(transaction.getTransactionMessages());
				System.out.println(transaction.getTransactionAmount());
				System.out.println(transaction.getDate());

				// count new balance from both user
				// update sender balance
				Integer newSenderBalance = senderBalance - amount;
				// update balance in customer table
				customerDAO.updateBalance(senderPhone, newSenderBalance);
				// get receiver balance
				Models.Customer reciever = customerDAO.getCustomerByPhone(reciverPhone);
				Integer recieverBalance = reciever.getBalance();
				// update receiver balance
				Integer newRecieverBalance = recieverBalance + amount;
				customerDAO.updateBalance(reciverPhone, newRecieverBalance);
				// import transaction to database
				transactionDAO.createStaffTransaction(transaction);
				// alert success
				out.println("<html><body>");
				out.println("<script>");
				out.println("alert('TRANSACTION SUCCESS! Press OKE to comeback :0');");
				out.println("location='admin_transaction.jsp';");
				out.println("</script>");
				out.println("</body></html>");
			}
		}
	}
}
