package net.member.db;

import java.sql.Date;

public class QnaBean {
	
	private int QnA_num;
	private String subject;
	private String content;
	private String QnA_pass;
	private String member_email;
	private int home_num;
	private Date QnA_date;
	private int re_ref; //답글의 그룹번호 = 기준번호
	private int re_lev; //들여쓰기
	private int re_seq; //글의상태 여부 0:답변중 1:답변완료 2:답변글
	private String home_subject;
	
	public String getHome_subject() {
		return home_subject;
	}
	public void setHome_subject(String home_subject) {
		this.home_subject = home_subject;
	}
	public int getRe_ref() {
		return re_ref;
	}
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}
	public int getRe_lev() {
		return re_lev;
	}
	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	
	public int getQnA_num() {
		return QnA_num;
	}
	public void setQnA_num(int qnA_num) {
		QnA_num = qnA_num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getQnA_pass() {
		return QnA_pass;
	}
	public void setQnA_pass(String qnA_pass) {
		QnA_pass = qnA_pass;
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
	public void setHome_num(int hom_num) {
		this.home_num = hom_num;
	}
	public Date getQnA_date() {
		return QnA_date;
	}
	public void setQnA_date(Date qnA_date) {
		QnA_date = qnA_date;
	}

}
