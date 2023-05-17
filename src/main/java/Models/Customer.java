/**
 * 
 */
package Models;

import java.time.LocalDate;

public class Customer {
	private String fullname;
	private String phone;
	private String email;
	private String password;
	private Integer balance;
	private LocalDate createAt;
	// LocalDate.now();

	// contructors
	public Customer() {
	}

	public Customer(String fullname, String phone, String email, String password, Integer balance) {
		super();
		this.fullname = fullname;
		this.phone = phone;
		this.email = email;
		this.password = password;
		this.balance = balance;
		createAt = LocalDate.now();
	}
	// getter and setter

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPhone() {
		return phone;
	}

	public Integer getIntPhone() {
		return Integer.parseInt(phone);
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getBalance() {
		return balance;
	}

	public void setBalance(Integer balance) {
		this.balance = balance;
	}

	public LocalDate getCreateAt() {
		return createAt;
	}

	public void setCreateAt(LocalDate createAt) {
		this.createAt = createAt;
	}

}