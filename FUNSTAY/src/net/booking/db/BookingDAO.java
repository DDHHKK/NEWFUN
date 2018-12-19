package net.booking.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BookingDAO {

	private Connection getConnection() throws Exception{
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		con = ds.getConnection();
		return con;
	}
	
	public PaymentBean insertPayment(PaymentBean pb){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PaymentBean pb2 = null;
		int payment_num2=0; //주문번호
		Calendar cal=Calendar.getInstance();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
		try {
			con=getConnection();
			String sql="select max(pay_num) from payment";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				payment_num2=rs.getInt(1)+1;
			}else{
				payment_num2=1;
			}
			pstmt.close();
			
			sql="insert into payment"
					+ "(payment_num,member_email,request_msg,payment_status,"
					+ "payment_date,host_email,storage_m,used_m,fees,sum_price,pay_num)"
					+ "values(?,?,?,?,now(),?,?,?,?,?,?)";
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, sdf.format(cal.getTime()).toString()+"-"+payment_num2);
			pstmt.setString(2, pb.getMember_email());
			pstmt.setString(3, pb.getRequest_msg());
			pstmt.setString(4, pb.getPayment_status());
			pstmt.setString(5, pb.getHost_email());
			pstmt.setInt(6, pb.getStorage_m());
			pstmt.setInt(7, pb.getUsed_m());
			pstmt.setInt(8, pb.getFees());
			pstmt.setInt(9, pb.getSum_price());
			pstmt.setInt(10, payment_num2);
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "select * from payment where pay_num=?";
			pstmt.getConnection().prepareStatement(sql);
			pstmt.setInt(1, payment_num2);
			pb2 = (PaymentBean) pstmt.executeQuery();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null){try{pstmt.close();}catch(SQLException e){}}
			if(con!=null){try{con.close();}catch(SQLException e){}}			
		}
		return pb2;
	}
	
	public void updatemileage(String member_email){
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = getConnection();
			String sql = "update member set mileage=(select sum(storage_m)-sum(used_m) from payment where member_email=? && payment_status='결제완료') where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_email);
			pstmt.setString(2, member_email);
			
			pstmt.executeUpdate();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
	}
	
	public void updateCash(String host_email){
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = getConnection();
			String sql = "update host set cash=(select sum_price-fees from payment where host_email=? && payment_status='결제완료') where host_email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, host_email);
			pstmt.setString(2, host_email);
			
			pstmt.executeUpdate();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
	}
	
	public void insertBooking(BookingBean bb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con=getConnection();
			String sql="insert into payment"
					+ "(payment_num,member_email,request_msg,payment_status,"
					+ "payment_date,host_email,storage_m,used_m,fees,sum_price,pay_num)"
					+ "values(?,?,?,?,now(),?,?,?,?,?,?)";
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
	}
	
	public Vector getBookingList(int home_num, String member_email){
		List bookingList=new ArrayList();
		List paymentList = new ArrayList();
		Vector vector=new Vector();
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql
			sql="select * from booking b, payment p where b.payment_num=p.payment_num and home_num=? and p.host_email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, home_num);
			pstmt.setString(2, member_email);
			//4 rs 실행 저장
			rs=pstmt.executeQuery();
			//5 rs데이터 있으면 자바빈 객체 생성 gBean
			//  rs => 자바빈 멤버변수 저장 => goodsList 한칸 저장
			while(rs.next()){
				BookingBean bb=new BookingBean();
				PaymentBean pb = new PaymentBean();
				bb.setBooking_num(rs.getInt("booking_num"));
				bb.setPayment_num(rs.getString("payment_num"));
				bb.setCheck_in(rs.getDate("check_in"));
				bb.setCheck_out(rs.getDate("check_out"));
				bb.setPeople(rs.getInt("people"));
				bb.setRoom_price(rs.getInt("room_price"));
				bb.setHome_num(rs.getInt("home_num"));
				bb.setAdd_price(rs.getInt("add_price"));
				bb.setBooking_date(rs.getDate("booking_date"));
				bb.setBooking_status(rs.getInt("booking_status"));
				pb.setPayment_num(rs.getString("payment_num"));
				pb.setMember_email(rs.getString("member_email"));
				pb.setRequest_msg(rs.getString("request_msg"));
				pb.setPayment_date(rs.getDate("payment_date"));
				pb.setPayment_status(rs.getString("payment_status"));
				pb.setHost_email(rs.getString("host_email"));
				pb.setStorage_m(rs.getInt("storage_m"));
				pb.setUsed_m(rs.getInt("used_m"));
				pb.setFees(rs.getInt("fees"));
				pb.setPay_num(rs.getInt("pay_num"));
				pb.setSum_price(rs.getInt("sum_price"));
				
				//자바빈 => 배열 한칸 저장
				bookingList.add(bb);
				paymentList.add(pb);
			}
			vector.add(bookingList);
			vector.add(paymentList);
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return vector;
	}
	
}
