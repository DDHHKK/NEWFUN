package net.book.db;

import java.sql.Date;

public class ReviewBean {
	
	//review테이블 컬럼 목록
	private String payment_num;
	private String content;
	private Date review_date;
	private int satisfaction;
	private int clean;
	private int access;
	private String member_email;
	private int home_num;
	
	
	
	public String getPayment_num() {
		return payment_num;
	}
	public void setPayment_num(String payment_num) {
		this.payment_num = payment_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public int getSatisfaction() {
		return satisfaction;
	}
	public void setSatisfaction(int satisfaction) {
		this.satisfaction = satisfaction;
	}
	public int getClean() {
		return clean;
	}
	public void setClean(int clean) {
		this.clean = clean;
	}
	public int getAccess() {
		return access;
	}
	public void setAccess(int access) {
		this.access = access;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public int getHome_num() {
		return home_num;
	}
	public void setHome_num(int home_num) {
		this.home_num = home_num;
	}
	
	

}
