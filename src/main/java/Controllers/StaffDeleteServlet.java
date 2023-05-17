package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import DAO.StaffDAO;
import Models.Staff;
import connection.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StaffDeleteServlet
 */
public class StaffDeleteServlet extends HttpServlet {
	private DBManager dbManager;
	private StaffDAO staffDAO;
	private static final long serialVersionUID = 1L;

	@Override
	public void init() {
		dbManager = DBManager.getInstance();
		staffDAO = new StaffDAO(dbManager);
	}

	public StaffDeleteServlet() {
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
		String action = request.getParameter("action");

		if (action != null) {
			switch (action) {
			case "delete":
				// Get the student ID from the request
				int staffID = Integer.parseInt(request.getParameter("staffID"));
				staffDAO.deleteStaff(staffID);
				List<Staff> staffList = staffDAO.getAllStaff();
				request.getSession().setAttribute("staffList", staffList);
				// Update successful, redirect to the page
				out.println("<html><body>");
				out.println("<script>");
				out.println("alert('Delete Succesfully');");
				out.println("location='admin_accuser.jsp';");
				out.println("</script>");
				out.println("</body></html>");
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
