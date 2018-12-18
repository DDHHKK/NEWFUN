<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String member_email=(String)session.getAttribute("email");
String payment_num=(String)request.getParameter("payment_num");


//member_email="kim@gmail.com";
//payment_num="20181214-94";





//설치 json형태로 변경 json-simple-1.1.1.jar
JSONArray arr=new JSONArray(); //배열 ArrayList 역할  .add()


//1단계 드라이버 로더
Class.forName("com.mysql.jdbc.Driver");
//2단계 디비연결
String dbUrl="jdbc:mysql://192.168.2.27:3306/funstay";
String dbUser="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
//3단계 sql 
String sql="select * from home h, payment p , booking b where b.payment_num=p.payment_num and b.home_num=h.home_num and p.payment_num=? and p.member_email=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1,payment_num);
pstmt.setString(2,member_email);

ResultSet rs = pstmt.executeQuery();




while(rs.next()){
	JSONObject mb=new JSONObject();//자바빈 MemberBean역할  .put()
	mb.put("room_type",rs.getString("room_type"));
	mb.put("photo",rs.getString("photo"));
	mb.put("room_subject",rs.getString("room_subject"));
	mb.put("member_email",rs.getString("member_email"));
	mb.put("fees",rs.getString("fees"));
	mb.put("sum_price",rs.getString("sum_price"));
	mb.put("check_in",rs.getString("check_in"));
	mb.put("name",rs.getString("check_in"));
	mb.put("check_out",rs.getString("check_out"));
	mb.put("people",rs.getString("people"));
	

	
	
	
	
	
	
	//배열 한 칸에 MemberBean 데이터 저장
	arr.add(mb);
}




%>
<%=arr %>













