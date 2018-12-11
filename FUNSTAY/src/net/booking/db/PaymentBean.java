package net.booking.db;

import java.util.Date;

public class PaymentBean {
	
	private String payment_num;
	private int pay_num;
	private String member_email;
	private String request_msg;
	private String payment_status;
	private Date payment_date;
	private String host_email;
	private int storage_m;
	private int used_m;
	private int fees;
	private int sum_price;

	
	
	public String getPayment_num() {
		return payment_num;
	}
	public void setPayment_num(String payment_num) {
		this.payment_num = payment_num;
	}
	public int getPay_num() {
		return pay_num;
	}
	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getRequest_msg() {
		return request_msg;
	}
	public void setRequest_msg(String request_msg) {
		this.request_msg = request_msg;
	}
	public String getPayment_status() {
		return payment_status;
	}
	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	public String getHost_email() {
		return host_email;
	}
	public void setHost_email(String host_email) {
		this.host_email = host_email;
	}
	public int getStorage_m() {
		return storage_m;
	}
	public void setStorage_m(int storage_m) {
		this.storage_m = storage_m;
	}
	public int getUsed_m() {
		return used_m;
	}
	public void setUsed_m(int used_m) {
		this.used_m = used_m;
	}
	public int getFees() {
		return fees;
	}
	public void setFees(int fees) {
		this.fees = fees;
	}
	public int getSum_price() {
		return sum_price;
	}
	public void setSum_price(int sum_price) {
		this.sum_price = sum_price;
	}
	
	

}
