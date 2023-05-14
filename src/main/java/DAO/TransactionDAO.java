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
					"INSERT INTO transaction (transactionNumber, senderPhone, staffID, reciverPhone,reciveName, transactionMessages, transactionAmount, transactionDate, transactionStatus) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setString(1, transaction.getTransactionNumber());
			ps.setString(2, transaction.getSenderPhone());
			ps.setInt(3, transaction.getStaffID());
			ps.setString(4, transaction.getReciverPhone());
			ps.setString(5, transaction.getReciveName());
			ps.setString(6, transaction.getTransactionMessages());
			ps.setInt(7, transaction.getTransactionAmount());
			ps.setDate(8, java.sql.Date.valueOf(transaction.getDate()));
			ps.setString(9, "Success");
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
	public List<Transaction> getRecentTransactionByPhone(String phone) {
		List<Transaction> list = new ArrayList<>();
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement(
					"SELECT DISTINCT customerName,reciverPhone FROM transaction  INNER JOIN customer ON transaction.reciverPhone = customer.customerPhone  WHERE senderPhone = ? ORDER BY reciverPhone DESC  LIMIT 5");
			ps.setString(1, phone);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Transaction transaction = new Transaction();
				transaction.setReciveName(rs.getString("customerName"));
				transaction.setReciverPhone(rs.getString("reciverPhone"));
				list.add(transaction);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
