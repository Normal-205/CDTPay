package connection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckConnection
 */
public class CheckConnection extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DBManager dbManager;

	@Override
	public void init() {
		dbManager = DBManager.getInstance();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Set the content type
		response.setContentType("text/html");

		// Output stream to write HTML response
		PrintWriter out = response.getWriter();

		// Connection variables
		Connection conn = null;
		// connect to database
		conn = dbManager.getConnection();
		try {
			// Print a success message
			out.println("<html><body>");
			out.println("<h2>Database connection successful</h2>");
			out.println("</body></html>");
		} finally {
			// Close the database connection
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// Handle any errors closing the database connection
				e.printStackTrace();
			}
		}
	}

}
