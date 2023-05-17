package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.DBManager;

public class SavingDAO {
	private DBManager dbManager;

	public SavingDAO(DBManager dbManager) {
		this.dbManager = dbManager;
	}

	public boolean addNewSaving(Models.Saving saving) {
		boolean result = false;
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO saving (customerPhone, initialAmount, interestRate, startDate, endDate, totalAmount, status) VALUES (?, ?, ?,?,?,?,?)");
			ps.setString(1, saving.getCustomerPhone());
			ps.setInt(2, saving.getInitialAmount());
			ps.setInt(3, saving.getInterestRate());
			// Convert LocalDate to java.sql.Date
			Date startDate = Date.valueOf(saving.getStartDate());
			Date endDate = Date.valueOf(saving.getEndDate());
			ps.setDate(4, startDate);
			ps.setDate(5, endDate);
			ps.setDouble(6, saving.getTotalAmount());
			ps.setString(7, saving.getStatus());
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

	public List<Models.Saving> getSavingByPhone(String customerPhone) {
//		Saving saving = null;
		List<Models.Saving> savingList = new ArrayList<>();
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM saving WHERE customerPhone = ?");
			ps.setString(1, customerPhone);
			java.sql.ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Models.Saving saving = new Models.Saving();
				saving = new Models.Saving(rs.getString("customerPhone"), rs.getInt("initialAmount"),
						rs.getInt("interestRate"), rs.getDate("startDate").toLocalDate(),
						rs.getDate("endDate").toLocalDate(), rs.getDouble("totalAmount"), rs.getString("status"));

				savingList.add(saving);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return savingList;
	}
}
