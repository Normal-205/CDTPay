package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
}
