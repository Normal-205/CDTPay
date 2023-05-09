package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
					"INSERT INTO transaction (transactionNumber, senderPhone, reciverPhone, transactionMessages, transactionAmount, transactionDate, transactionStatus) VALUES (?, ?, ?, ?, ?,?,?)");
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
	public boolean createStaffTransaction(Transaction transaction) {
		boolean result = false;
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO transaction (transactionNumber, staffID, reciverPhone, transactionMessages, transactionAmount, transactionDate, transactionStatus) VALUES (?, ?, ?, ?, ?,?,?)");
			ps.setString(1, transaction.getTransactionNumber());
			ps.setInt(2, transaction.getStaffID());
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
}
