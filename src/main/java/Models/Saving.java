package Models;

import java.time.LocalDate;

public class Saving {
	private String customerPhone;
	private Integer initialAmount;
	private Integer interestRate;
	private LocalDate startDate;
	private LocalDate endDate;
	private double totalAmount;
	private String status;

	// constructor
	public Saving(String customerPhone, int initialAmount, int interestRate, LocalDate startDate, LocalDate endDate,
			double totalAmount, String status) {
		// this constructor is for saving session
		super();
		this.customerPhone = customerPhone;
		this.initialAmount = initialAmount;
		this.interestRate = interestRate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.totalAmount = totalAmount;
		this.status = status;
	}

	public Saving(String customerPhone, Integer initialAmount, Integer interestRate, Integer months, double totalAmount,
			String status) {
		super();
		this.customerPhone = customerPhone;
		this.initialAmount = initialAmount;
		this.interestRate = interestRate;
		// start Date is current date
		this.startDate = LocalDate.now();
		endDate = startDate.plusMonths(months);
		this.totalAmount = totalAmount;
		this.status = status;
	}

	public Saving() {
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public Integer getInitialAmount() {
		return initialAmount;
	}

	public void setInitialAmount(Integer initialAmount) {
		this.initialAmount = initialAmount;
	}

	public Integer getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(Integer interestRate) {
		this.interestRate = interestRate;
	}

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	// getter & setter

}
