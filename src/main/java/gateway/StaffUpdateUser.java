package gateway;

import java.io.IOException;
import java.io.PrintWriter;

import Object.Staff;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class StaffUpdateUser
 */
public class StaffUpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StaffUpdateUser() {
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
		Staff staffSession = (Staff) session.getAttribute("staff");
		// Retrieve the information from session
		String staffRole = staffSession.getStaffRole();
		// Get parameters from the HTML form
		String updateRole = request.getParameter("role");
		System.out.println(staffRole);
		System.out.println(updateRole);
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
