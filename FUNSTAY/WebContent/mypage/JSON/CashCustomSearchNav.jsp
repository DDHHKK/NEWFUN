<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String email = (String)session.getAttribute("email");
//email="jeju@gmail.com";
String home_num2 = request.getParameter("home_num");
int home_num = Integer.parseInt(home_num2);
String start_searchdate = request.getParameter("start_searchdate");
String end_searchdate = request.getParameter("end_searchdate");
String sql=null;

//int home_num=1;
//start_searchdate="2018-11-02";
//end_searchdate="2018-11-25";
System.out.println(email);
System.out.println(home_num);
System.out.println(start_searchdate);
System.out.println(end_searchdate);

JSONArray arr = new JSONArray();

Class.forName("com.mysql.jdbc.Driver");
String dbUrl="jdbc:mysql://192.168.2.27:3306/funstay";
String dbUser="root";
String dbPass="1234";
Connection con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
if(home_num==0){
	System.out.println("이 호스트의 등록된 전체 집에 대한 결제내역");
	sql="select p.payment_num, p.payment_date, p.payment_status, r.home_num, p.sum_price-p.fees as cash from payment p, booking b, room r where p.payment_num = b.payment_num and b.room_num = r.room_num and p.host_email=? and p.payment_date between ? and ? group by r.home_num order by p.payment_date desc, p.payment_num desc";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, email);
	pstmt.setString(2, start_searchdate);
	pstmt.setString(3, end_searchdate);
	ResultSet rs = pstmt.executeQuery();
	

while(rs.next()){
	
	JSONObject pb=new JSONObject();
	pb.put("payment_date", rs.getString("p.payment_date"));
	pb.put("payment_num", rs.getString("p.payment_num"));
	pb.put("cash", rs.getInt("cash"));
	pb.put("payment_status", rs.getString("p.payment_status"));
	
	arr.add(pb);
	}
}else{
	System.out.println("이 호스트의 선택된 집에 대한 결제내역");
	sql = "select p.payment_num, p.payment_date, p.payment_status, r.home_num, p.sum_price-p.fees as cash from payment p, booking b, room r where p.payment_num = b.payment_num and b.room_num = r.room_num and r.home_num=? and p.host_email=? and p.payment_date between ? and ? group by r.home_num order by p.payment_date desc, p.payment_num desc";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, home_num);
	pstmt.setString(2, email);
	pstmt.setString(3, start_searchdate);
	pstmt.setString(4, end_searchdate);
	ResultSet rs = pstmt.executeQuery();
	

while(rs.next()){
	
	JSONObject pb=new JSONObject();
	pb.put("payment_date", rs.getString("p.payment_date"));
	pb.put("payment_num", rs.getString("p.payment_num"));
	pb.put("cash", rs.getInt("cash"));
	pb.put("payment_status", rs.getString("p.payment_status"));
	
	arr.add(pb);
	}
}

%>
<%=arr%>