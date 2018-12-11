package net.member.db;

public class MemberBean {
	private String email;
	private String pass;
	private String name;
	private String profile_photo;
	private String phone;
	private String birth;
	private int mileage;
	private int member_num;
	private String search_info; //검색하는내용 넣는  변수
	private String date_a; //달력날짜 앞에꺼 넣는 변수
	private String date_b; //달력날짜 뒤에꺼 넣는  변수
	private int text11; //성인 인원 넣는 변수
	private int text12; //아이  인원 넣는 변수
	private String image;

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProfile_photo() {
		return profile_photo;
	}
	public void setProfile_photo(String profile_photo) {
		this.profile_photo = profile_photo;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

          public String getSearch_info() {
		return search_info;
	}
	
	public void setSearch_info(String search_info) {
		this.search_info = search_info;
	}
	
	public String getDate_a() {
		return date_a;
	}
	
	public void setDate_a(String date_a) {
		this.date_a = date_a;
	}
	public String getDate_b() {
		return date_b;
	}
	
	public void setDate_b(String date_b) {
		this.date_b = date_b;
	}
	
	public int getText11() {
		return text11;
	}
	
	public void setText11(int text11) {
		this.text11 = text11;
	}
	
	public int  getText12() {
		return text12;
	}
	

	public void setText12(int text12) {
		this.text12 = text12;
	}
	
	
	public String getImage() {
		return image;
	}
	
	public void setImage(String image) {
		this.image = image;
	}
	


	

}
