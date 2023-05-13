package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Object.Staff;
import connection.DBManager;

public class StaffDAO {
	private DBManager dbManager;

	public StaffDAO(DBManager dbManager) {
		this.dbManager = dbManager;
	}

	public boolean createStaff(Staff staff) {
		boolean result = false;
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO staff (staffPassword, staffName, staffPhone, staffEmail, staffRole) VALUES (?,?,?,?,?)");
			ps.setString(1, staff.getStaffPassword());
			ps.setString(2, staff.getStaffName());
			ps.setString(3, staff.getStaffPhone());
			ps.setString(4, staff.getStaffEmail());
			ps.setString(5, staff.getStaffRole());
			int rows = ps.executeUpdate();
			if (rows > 0) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				dbManager.getConnection().close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public boolean checkLogin(String staffName, String staffPassword) {
		boolean isValid = false;
		try {
			Connection conn = DBManager.getInstance().getConnection();
			String sql = "SELECT * FROM staff WHERE staffName = ? AND staffPassword = ?";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, staffName);
			statement.setString(2, staffPassword);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				// User exists with given username and password
				isValid = true;
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isValid;
	}

	// validate user by phone
	public Staff getStaffByName(String staffName) {
		Staff staff = null;
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM staff WHERE staffName = ?");
			ps.setString(1, staffName);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				staff = new Staff(rs.getInt("staffID"), rs.getString("staffPassword"), rs.getString("staffName"),
						rs.getString("staffPhone"), rs.getString("staffEmail"), rs.getString("staffRole"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return staff;
	}
}
