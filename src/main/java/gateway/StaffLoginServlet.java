package gateway;

import java.io.IOException;
import java.io.PrintWriter;

import DAO.StaffDAO;
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
//			System.out.println("Login session created");
			request.getSession().setAttribute("staff", staffDAO.getStaffByName(staffName));
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/dashboard.jsp");
			dispatcher.forward(request, response);

		} else {
			System.out.println("NOT OKE");
			out.println("<html><body>");
			out.println("<script>");
			out.println("alert('Invalid username or password. Please check again');");
			out.println("location='/admin_login.jsp';");
			out.println("</script>");
			out.println("</body></html>");
		}
	}

}
