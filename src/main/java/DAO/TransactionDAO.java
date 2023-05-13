package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Object.Transaction;
import connection.DBManager;

public class TransactionDAO {
	private DBManager dbManager;

	public TransactionDAO(DBManager dbManager) {
		this.dbManager = dbManager;
	}

	// create transaction for User
	public boolean createUserTransaction(Transaction transaction) {
		boolean result = false;
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO transaction (transactionNumber, senderPhone, reciverPhone, reciveName, transactionMessages, transactionAmount, transactionDate, transactionStatus) VALUES (?, ?, ?, ?, ?,?,?)");
			ps.setString(1, transaction.getTransactionNumber());
			ps.setString(2, transaction.getSenderPhone());
			ps.setString(3, transaction.getReciverPhone());
			ps.setString(4, transaction.getReciveName());
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

	// create transaction for Staff
	public boolean createStaffTransaction(Transaction transaction) {
		boolean result = false;
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO transaction (transactionNumber, staffID, reciverPhone,reciveName, transactionMessages, transactionAmount, transactionDate, transactionStatus) VALUES (?, ?, ?, ?, ?,?,?)");
			ps.setString(1, transaction.getTransactionNumber());
			ps.setInt(2, transaction.getStaffID());
			ps.setString(3, transaction.getReciverPhone());
			ps.setString(4, transaction.getReciveName());
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

	// method to get recent account number for specific customer
	public List<Transaction> getRecentAccountNumber(String customerPhone) {
		List<Transaction> transactionList = new ArrayList<Transaction>();
		try {
			Connection conn = DBManager.getInstance().getConnection();
			String sql = "SELECT * FROM transaction WHERE senderPhone = ? OR reciverPhone = ? ORDER BY transactionDate DESC LIMIT 1";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, customerPhone);
			statement.setString(2, customerPhone);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				Transaction transaction = new Transaction();
				transaction.setTransactionNumber(result.getString("transactionNumber"));
				transaction.setSenderPhone(result.getString("senderPhone"));
				transaction.setReciverPhone(result.getString("reciverPhone"));
				transaction.setTransactionMessages(result.getString("transactionMessages"));
				transaction.setTransactionAmount(result.getInt("transactionAmount"));
				transaction.setDate(result.getDate("transactionDate").toLocalDate());
				transactionList.add(transaction);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return transactionList;
	}
}
