package Models;

public class Staff {
	private Integer staffID;
	private String staffPassword;
	private String staffName;
	private String staffPhone;
	private String staffEmail;
	private String staffRole;

	// construc
	public Staff() {
	}

	public Staff(Integer staffID, String staffPassword, String staffName, String staffPhone, String staffEmail,
			String staffRole) {
		super();
		this.staffID = staffID;
		this.staffPassword = staffPassword;
		this.staffName = staffName;
		this.staffPhone = staffPhone;
		this.staffEmail = staffEmail;
		this.staffRole = staffRole;
	}

	public Staff(String staffPassword, String staffName, String staffPhone, String staffEmail, String staffRole) {
		super();
		this.staffPassword = staffPassword;
		this.staffName = staffName;
		this.staffPhone = staffPhone;
		this.staffEmail = staffEmail;
		this.staffRole = staffRole;
	}

	// getter & setter
	public Integer getStaffID() {
		return staffID;
	}

	public void setStaffID(Integer staffID) {
		this.staffID = staffID;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public String getStaffPassword() {
		return staffPassword;
	}

	public void setStaffPassword(String staffPassword) {
		this.staffPassword = staffPassword;
	}

	public String getStaffPhone() {
		return staffPhone;
	}

	public void setStaffPhone(String staffPhone) {
		this.staffPhone = staffPhone;
	}

	public String getStaffEmail() {
		return staffEmail;
	}

	public void setStaffEmail(String staffEmail) {
		this.staffEmail = staffEmail;
	}

	public String getStaffRole() {
		return staffRole;
	}

	public void setStaffRole(String staffRole) {
		this.staffRole = staffRole;
	}

}
