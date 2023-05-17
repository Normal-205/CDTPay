package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.DBManager;

public class StaffDAO {
	private DBManager dbManager;

	public StaffDAO(DBManager dbManager) {
		this.dbManager = dbManager;
	}

	public boolean createStaff(Models.Staff staff) {
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

	public boolean updateStaff(Models.Staff staff) {
		boolean result = false;
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement(
					"UPDATE staff SET staffPassword = ?, staffName = ?, staffPhone = ?, staffEmail = ?, staffRole = ? WHERE staffID = ?");
			ps.setString(1, staff.getStaffPassword());
			ps.setString(2, staff.getStaffName());
			ps.setString(3, staff.getStaffPhone());
			ps.setString(4, staff.getStaffEmail());
			ps.setString(5, staff.getStaffRole());
			ps.setInt(6, staff.getStaffID());
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

	public boolean deleteStaff(Integer staffID) {
		boolean result = false;
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement("DELETE FROM staff WHERE staffID = ?");
			ps.setInt(1, staffID);
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
	public Models.Staff getStaffByName(String staffName) {
		Models.Staff staff = null;
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM staff WHERE staffName = ?");
			ps.setString(1, staffName);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				staff = new Models.Staff(rs.getInt("staffID"), rs.getString("staffPassword"), rs.getString("staffName"),
						rs.getString("staffPhone"), rs.getString("staffEmail"), rs.getString("staffRole"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return staff;
	}

	// deposit balance by phone
	public boolean depositBalance(String staffName, int balance) {
		boolean result = false;
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn
					.prepareStatement("UPDATE staff SET staffBalance = staffBalance + ? WHERE staffName = ?");
			ps.setInt(1, balance);
			ps.setString(2, staffName);
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

	// get full data of all staff
	public List<Models.Staff> getAllStaff() {
		List<Models.Staff> staffList = new ArrayList<>();
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM staff");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Models.Staff staff = new Models.Staff(rs.getInt("staffID"), rs.getString("staffPassword"),
						rs.getString("staffName"), rs.getString("staffPhone"), rs.getString("staffEmail"),
						rs.getString("staffRole"));
				staffList.add(staff);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return staffList;
	}

	public boolean checkNameExists(String name) {
		boolean result = false;
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM staff WHERE staffName = ?");
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
