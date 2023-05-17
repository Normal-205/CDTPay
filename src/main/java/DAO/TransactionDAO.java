package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.DBManager;

public class TransactionDAO {
	private DBManager dbManager;

	public TransactionDAO(DBManager dbManager) {
		this.dbManager = dbManager;
	}

	// create transaction for User
	public boolean createUserTransaction(Models.Transaction transaction) {
		boolean result = false;
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO transaction (transactionNumber, senderPhone, reciverPhone, transactionMessages, transactionAmount, transactionDate, transactionStatus) VALUES (?, ?, ? , ?, ?, ?, ?)");
			ps.setString(1, transaction.getTransactionNumber());
			ps.setString(2, transaction.getSenderPhone());
			ps.setString(3, transaction.getReciverPhone());
			ps.setString(4, transaction.getTransactionMessages());
			ps.setInt(5, transaction.getTransactionAmount());
			ps.setDate(6, java.sql.Date.valueOf(transaction.getDate()));
			ps.setString(7, "Success");
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

	// create transaction for Staff
	public boolean createStaffTransaction(Models.Transaction transaction) {
		boolean result = false;
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO transaction (transactionNumber, senderPhone, staffID, reciverPhone, transactionMessages, transactionAmount, transactionDate, transactionStatus) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setString(1, transaction.getTransactionNumber());
			ps.setString(2, transaction.getSenderPhone());
			ps.setInt(3, transaction.getStaffID());
			ps.setString(4, transaction.getReciverPhone());
			ps.setString(5, transaction.getTransactionMessages());
			ps.setInt(6, transaction.getTransactionAmount());
			ps.setDate(7, java.sql.Date.valueOf(transaction.getDate()));
			ps.setString(8, "Success");
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

	// method to get recent account number and account name from transaction table
	// and customer table, then return a list of transaction
	public List<Models.Transaction> getRecentTransactionByPhone(String phone) {
		List<Models.Transaction> list = new ArrayList<>();
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement(
					"SELECT DISTINCT customerName,reciverPhone FROM transaction  INNER JOIN customer ON transaction.reciverPhone = customer.customerPhone  WHERE senderPhone = ? ORDER BY reciverPhone DESC  LIMIT 5");
			ps.setString(1, phone);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Models.Transaction transaction = new Models.Transaction();
				transaction.setReciveName(rs.getString("customerName"));
				transaction.setReciverPhone(rs.getString("reciverPhone"));
				list.add(transaction);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// method to get transaction history by staffID, month and return a list of
	// transaction sort by date
	public List<Models.Transaction> getTransactionHistoryByStaffID(int staffID, int month) {
		List<Models.Transaction> list = new ArrayList<>();
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement(
					"SELECT customerName, transaction.* FROM transaction INNER JOIN customer ON transaction.reciverPhone = customer.customerPhone WHERE staffID = ? AND MONTH(transactionDate) = ? ORDER BY transactionNumber DESC");
			ps.setInt(1, staffID);
			ps.setInt(2, month);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Models.Transaction transaction = new Models.Transaction();
				transaction.setTransactionNumber(rs.getString("transactionNumber"));
				transaction.setReciveName(rs.getString("customerName"));
				transaction.setSenderPhone(rs.getString("senderPhone"));
				transaction.setReciverPhone(rs.getString("reciverPhone"));
				transaction.setTransactionMessages(rs.getString("transactionMessages"));
				transaction.setTransactionAmount(rs.getInt("transactionAmount"));
				transaction.setDate(rs.getDate("transactionDate").toLocalDate());
				list.add(transaction);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// the same with method above but find with phone
	public List<Models.Transaction> getTransactionHistoryByPhone(String phone, int month) {
		List<Models.Transaction> list = new ArrayList<>();
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement(
					"SELECT customerName, transaction.* FROM transaction INNER JOIN customer ON transaction.reciverPhone = customer.customerPhone WHERE (senderPhone = ? or reciverPhone = ?)  AND MONTH(transactionDate) = ? ORDER BY transactionNumber DESC");
			ps.setString(1, phone);
			ps.setString(2, phone);
			ps.setInt(3, month);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Models.Transaction transaction = new Models.Transaction();
				transaction.setTransactionNumber(rs.getString("transactionNumber"));
				transaction.setReciveName(rs.getString("customerName"));
				transaction.setSenderPhone(rs.getString("senderPhone"));
				transaction.setReciverPhone(rs.getString("reciverPhone"));
				transaction.setTransactionMessages(rs.getString("transactionMessages"));
				transaction.setTransactionAmount(rs.getInt("transactionAmount"));
				transaction.setDate(rs.getDate("transactionDate").toLocalDate());
				list.add(transaction);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// method to get current month value
	public int getSpecificMonth(int month) {
		int result = 0;
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement("SELECT MONTH(CURRENT_DATE()) - ?");
			ps.setInt(1, month);
			ResultSet rs = ps.executeQuery();
			// get current month value
			while (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
