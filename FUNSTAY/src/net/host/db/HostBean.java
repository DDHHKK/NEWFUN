package net.host.db;

import java.sql.Date;


public class HostBean {
	private int home_num; //primary key
	private String host_email; //host table의 primary key
	private String address;
	private String room_type;
	private String photo;
	private String room_subject;
	private String room_content;
	private int restroom;
	private String in_time;
	private String out_time;
	private int price;
	private Date start_date;
	private Date end_date;
	private int home_status;
	private Date apply_date;
	
	
	public int getHome_status() {
		return home_status;
	}
	public void setHome_status(int home_status) {
		this.home_status = home_status;
	}
	public int getHome_num() {
		return home_num;
	}
	public void setHome_num(int home_num) {
		this.home_num = home_num;
	}
	public String getHost_email() {
		return host_email;
	}
	public void setHost_email(String host_email) {
		this.host_email = host_email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRoom_type() {
		return room_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getRoom_subject() {
		return room_subject;
	}
	public void setRoom_subject(String room_subject) {
		this.room_subject = room_subject;
	}
	public String getRoom_content() {
		return room_content;
	}
	public void setRoom_content(String room_content) {
		this.room_content = room_content;
	}
	public int getRestroom() {
		return restroom;
	}
	public void setRestroom(int restroom) {
		this.restroom = restroom;
	}
	public String getIn_time() {
		return in_time;
	}
	public void setIn_time(String in_time) {
		this.in_time = in_time;
	}
	public String getOut_time() {
		return out_time;
	}
	public void setOut_time(String out_time) {
		this.out_time = out_time;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public Date getApply_date() {
		return apply_date;
	}
	public void setApply_date(Date apply_date) {
		this.apply_date = apply_date;
	}

	
}
