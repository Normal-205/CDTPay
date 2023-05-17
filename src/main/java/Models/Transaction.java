package Models;

import java.time.LocalDate;
import java.time.LocalTime;

public class Transaction {
	private String transactionNumber;
	private String senderPhone;
	private Integer staffID;
	private String reciverPhone;
	private String reciveName;
	private String transactionMessages;
	private Integer transactionAmount;
	private LocalDate date;
	private String Status;

	// constructor
	public Transaction() {
	}

	// for finding recent transaction
	public Transaction(String reciverPhone, String reciveName) {
		super();
		this.reciverPhone = reciverPhone;
		this.reciveName = reciveName;
	}

	// for admin transaction
	public Transaction(String senderPhone, Integer staffID, String reciverPhone, String transactionMessages,
			Integer transactionAmount) {
		super();
		this.transactionNumber = "TransNo " + LocalDate.now().toString() + " / " + LocalTime.now().toString();
		this.senderPhone = senderPhone;
		this.staffID = staffID;
		this.reciverPhone = reciverPhone;
		this.transactionMessages = transactionMessages;
		this.transactionAmount = transactionAmount;
		date = LocalDate.now();
	}

	public Transaction(String senderPhone, String reciverPhone, String reciveName, String transactionMessages,
			Integer transactionAmount) {
		super();
		this.transactionNumber = "TransNo " + LocalDate.now().toString() + " / " + LocalTime.now().toString();
		this.senderPhone = senderPhone;
		this.reciverPhone = reciverPhone;
		this.reciveName = reciveName;
		this.transactionMessages = transactionMessages;
		this.transactionAmount = transactionAmount;
		date = LocalDate.now();
	}

	public Transaction(Integer staffID, String reciverPhone, String transactionMessages, Integer transactionAmount) {
		super();
		this.transactionNumber = "TransNo " + LocalDate.now().toString() + " / " + LocalTime.now().toString();
		this.staffID = staffID;
		this.reciverPhone = reciverPhone;
		this.transactionMessages = transactionMessages;
		this.transactionAmount = transactionAmount;
		date = LocalDate.now();
		Status = "Success";
	}

	// getter & setter
	public String getTransactionNumber() {
		return transactionNumber;
	}

	public void setTransactionNumber(String transactionNumber) {
		this.transactionNumber = transactionNumber;
	}

	public String getSenderPhone() {
		return senderPhone;
	}

	public void setSenderPhone(String senderPhone) {
		this.senderPhone = senderPhone;
	}

	public String getReciveName() {
		return reciveName;
	}

	public void setReciveName(String reciveName) {
		this.reciveName = reciveName;
	}

	public Integer getStaffID() {
		return staffID;
	}

	public void setStaffID(Integer staffID) {
		this.staffID = staffID;
	}

	public String getReciverPhone() {
		return reciverPhone;
	}

	public void setReciverPhone(String reciverPhone) {
		this.reciverPhone = reciverPhone;
	}

	public String getTransactionMessages() {
		return transactionMessages;
	}

	public void setTransactionMessages(String transactionMessages) {
		this.transactionMessages = transactionMessages;
	}

	public Integer getTransactionAmount() {
		return transactionAmount;
	}

	public void setTransactionAmount(Integer transactionAmount) {
		this.transactionAmount = transactionAmount;
	}

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

}
