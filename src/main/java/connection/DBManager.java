package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBManager {
	private static DBManager instance = null;
	private static Connection conn = null;

	private DBManager() {
		try {
			// Create connection to database
			String url = "jdbc:mysql://localhost:3306/cdtpay";
			String user = "root";
			String password = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
//		finally {
//			// Close the database connection
//			try {
//				if (conn != null)
//					conn.close();
//			} catch (SQLException e) {
//				// Handle any SQL errors
//				e.printStackTrace();
//				// Print a fail message
//				System.out.println("Database connection failed");
//			}
//		}
	}

	public static DBManager getInstance() {
		if (instance == null) {
			instance = new DBManager();
		}
		return instance;
	}

	public Connection getConnection() {
		try {
			// Create connection to database
			String url = "jdbc:mysql://localhost:3306/cdtpay";
			String user = "root";
			String password = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public ResultSet executeQuery(String sql) {
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
}