package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import DAO.CustomerDAO;
import DAO.SavingDAO;
import Models.Customer;
import Models.Saving;
import connection.DBManager;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class UserSaving
 */
public class UserSaving extends HttpServlet {
	private CustomerDAO customerDAO;
	private SavingDAO savingDAO;
	private DBManager dbManager;
	private static final long serialVersionUID = 1L;

	@Override
	public void init() {
		dbManager = DBManager.getInstance();
		customerDAO = new CustomerDAO(dbManager);
		savingDAO = new SavingDAO(dbManager);
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserSaving() {
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
		Customer customer = (Customer) session.getAttribute("customer");
		// Retrieve the information from session
		Integer balance = customer.getBalance();
		String phone = customer.getPhone();
		// retrieve the information from form
		Integer interestRate = Integer.parseInt(request.getParameter("interestRate"));
		Integer amount = Integer.parseInt(request.getParameter("initialAmount"));
		Integer time = Integer.parseInt(request.getParameter("time"));
		double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
		// initial saving object
		Saving saving = new Saving(phone, amount, interestRate, time, totalAmount, "Ongoing");
		// print test
		System.out.println(time);
		System.out.println(phone);
		System.out.println(totalAmount);
		System.out.println(interestRate);
		if (customerDAO.checkMoney(phone, amount)) {
			System.out.println("OKE");
			// save record in saving table
			savingDAO.addNewSaving(saving);
			Integer newBalance = balance - amount;
			// update Balance
			customerDAO.updateBalance(phone, newBalance);
			// set attribute in order to save in session
			List<Saving> savingList = savingDAO.getSavingByPhone(phone);
			customer.setBalance(newBalance);
			// add to value
			session.setAttribute("customer", customer);
			session.setAttribute("saving", saving);
			request.getSession().setAttribute("savingList", savingList);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/saving_user.jsp");
			dispatcher.forward(request, response);
		} else {
			System.out.println("NOT ENOUGH MONEY");
			out.println("<html><body>");
			out.println("<script>");
			out.println("alert('Your account is not enough money, please try again');");
			out.println("location='saving_user.jsp';");
			out.println("</script>");
			out.println("</body></html>");
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

		// Retrieve the customer object from the session
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("customer");
		// Retrieve the information from session
		Integer balance = customer.getBalance();
		String phone = customer.getPhone();
		// retrieve the information from form
		Integer interestRate = Integer.parseInt(request.getParameter("interestRate"));
		Integer amount = Integer.parseInt(request.getParameter("initialAmount"));
		Integer time = Integer.parseInt(request.getParameter("time"));
		double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
		// initial saving object
		Saving saving = new Saving(phone, amount, interestRate, time, totalAmount, "Ongoing");
		// print test
		System.out.println(time);
		System.out.println(phone);
		System.out.println(totalAmount);
		System.out.println(interestRate);
		if (customerDAO.checkMoney(phone, amount)) {
			System.out.println("OKE");
			// save record in saving table
			savingDAO.addNewSaving(saving);
			Integer newBalance = balance - amount;
			// update Balance
			customerDAO.updateBalance(phone, newBalance);
			// set attribute in order to save in session
			List<Saving> savingList = savingDAO.getSavingByPhone(phone);
			customer.setBalance(newBalance);
			// add to value
			session.setAttribute("customer", customer);
			session.setAttribute("saving", saving);
			request.getSession().setAttribute("savingList", savingList);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/saving_user.jsp");
			dispatcher.forward(request, response);
		} else {
			System.out.println("NOT ENOUGH MONEY");
			out.println("<html><body>");
			out.println("<script>");
			out.println("alert('Your account is not enough money, please try again');");
			out.println("location='saving_user.jsp';");
			out.println("</script>");
			out.println("</body></html>");
		}
	}

}
