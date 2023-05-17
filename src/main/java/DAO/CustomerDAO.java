package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.Customer;
import connection.DBManager;

public class CustomerDAO {

	private DBManager dbManager;

	public CustomerDAO(DBManager dbManager) {
		this.dbManager = dbManager;
	}

	public boolean createUser(Models.Customer customer) {
		boolean result = false;
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO customer (customerPhone, customerName, customerOTP, customerEmail, balance, createAt) VALUES (?, ?, ?,?,?,?)");
			ps.setString(1, customer.getPhone());
			ps.setString(2, customer.getFullname());
			ps.setString(3, customer.getPassword());
			ps.setString(4, customer.getEmail());
			ps.setInt(5, customer.getBalance());
			ps.setDate(6, java.sql.Date.valueOf(customer.getCreateAt()));
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

	public boolean updateCustomer(Models.Customer customer) {
		boolean result = false;
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement(
					"UPDATE customer SET customerName = ?, customerEmail = ?, customerOTP = ? WHERE customerPhone = ?");
			ps.setString(1, customer.getFullname());
			ps.setString(2, customer.getEmail());
			ps.setString(3, customer.getPassword());
			ps.setString(4, customer.getPhone());
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

	// validate user by phone
	public Customer getCustomerByPhone(String phone) {
		Customer customer = null;
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM customer WHERE customerPhone = ?");
			ps.setString(1, phone);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				customer = new Models.Customer(rs.getString("customerName"), rs.getString("customerPhone"),
						rs.getString("customerEmail"), rs.getString("customerOTP"), rs.getInt("balance"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return customer;
	}

	public boolean checkPhoneExists(String phone) {
		boolean phoneExists = false;
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM customer WHERE customerPhone = ?");
			ps.setString(1, phone);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				phoneExists = true;
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
		return phoneExists;
	}

	public boolean checkLogin(String customerPhone, String customerOTP) {
		boolean isValid = false;
		try {
			Connection conn = DBManager.getInstance().getConnection();
			String sql = "SELECT * FROM customer WHERE customerPhone = ? AND customerOTP = ?";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, customerPhone);
			statement.setString(2, customerOTP);
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

	public boolean checkMoney(String customerPhone, int money) {
		boolean isValid = false;
		try {
			Connection conn = DBManager.getInstance().getConnection();
			String sql = "SELECT * FROM customer WHERE customerPhone = ? AND balance >= ?";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, customerPhone);
			statement.setInt(2, money);
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

	// update balance by phone
	public boolean updateBalance(String phone, int money) {
		boolean result = false;
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement("UPDATE customer SET balance = ? WHERE customerPhone = ?");
			ps.setInt(1, money);
			ps.setString(2, phone);
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

	// get balance by phone
	public int getBalance(String phone) {
		int balance = 0;
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement("SELECT balance FROM customer WHERE customerPhone = ?");
			ps.setString(1, phone);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				balance = rs.getInt("balance");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return balance;
	}

	// get full data of all customer
	public List<Models.Customer> getAllCustomer() {
		List<Models.Customer> customerList = new ArrayList<>();
		try (Connection conn = dbManager.getConnection()) {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM customer");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Models.Customer customer = new Models.Customer(rs.getString("customerName"),
						rs.getString("customerPhone"), rs.getString("customerEmail"), rs.getString("customerOTP"),
						rs.getInt("balance"));
				customerList.add(customer);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return customerList;
	}

}
