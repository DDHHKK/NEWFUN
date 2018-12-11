package net.booking.db;

import java.util.Date;

public class BookingBean {
	
	private int booking_num;
	private String payment_num;
	private int room_num;
	private Date check_in;
	private Date check_out;
	private int people;
	private int room_price;
	private int add_price;
	private Date booking_date;
	private int booking_status;
	private int home_num;
	
	public int getHome_num() {
		return home_num;
	}
	public void setHome_num(int home_num) {
		this.home_num = home_num;
	}
	public int getBooking_num() {
		return booking_num;
	}
	public void setBooking_num(int booking_num) {
		this.booking_num = booking_num;
	}
	public String getPayment_num() {
		return payment_num;
	}
	public void setPayment_num(String payment_num) {
		this.payment_num = payment_num;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public Date getCheck_in() {
		return check_in;
	}
	public void setCheck_in(Date check_in) {
		this.check_in = check_in;
	}
	public Date getCheck_out() {
		return check_out;
	}
	public void setCheck_out(Date check_out) {
		this.check_out = check_out;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public int getRoom_price() {
		return room_price;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	public int getAdd_price() {
		return add_price;
	}
	public void setAdd_price(int add_price) {
		this.add_price = add_price;
	}
	public Date getBooking_date() {
		return booking_date;
	}
	public void setBooking_date(Date booking_date) {
		this.booking_date = booking_date;
	}
	public int getBooking_status() {
		return booking_status;
	}
	public void setBooking_status(int booking_status) {
		this.booking_status = booking_status;
	}
	
	

}
