package net.host.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.bed.db.BedBean;
import net.booking.db.PaymentBean;
import net.conv.db.ConvBean;
import net.member.db.MemberBean;
import net.room.db.RoomBean;

public class HostDAO {

private Connection getConnection() throws Exception{
		
		Connection con = null;
		// Context 객체 생성
		Context init = new InitialContext();
		// DateSource = 디비연동 이름 불러오기
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		// con = DataSource
		con = ds.getConnection();

		return con;
	}
	
/*host table에 host_num/email 넣어주는 소스*/
	
	public void HostUser(String email) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String sql="";
		
		
		try {
			con = getConnection();
		
			
			sql="insert into host(host_email,cash) values(?,?)";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1,email);
			pstmt.setInt(2,0);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null)	
			try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)	
			try{con.close();}catch(SQLException ex){}
			if(rs!=null)	
			try{rs.close();}catch(SQLException ex){}
		}
		return;
		
	}
	
	
	
	
	

	
	
	@SuppressWarnings("resource")
	public int insertHost(HostBean hb,String email, int end_date2) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		int home_num=0;
		 
		
		try {
			con = getConnection();
			
			 
			
			String sql = "select max(home_num) from home";
			pstmt = con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				home_num=rs.getInt("max(home_num)")+1;
			}
			
			
			  
			sql 
			= "insert into home"
					+ "(home_num,host_email,address,room_type,photo,room_subject,room_content,restroom,in_time,out_time,price,"
					+ "apply_date,home_status,start_date,end_date)"
			+ "values"
				+ "(?,?,?,?,?,?,?,?,?,?,?,now(),?,date_format(now()+ interval 3 day, '%Y-%m-%d'),date_format(now()+ interval ? day, '%Y-%m-%d'))";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, home_num);
			pstmt.setString(2, email);
			pstmt.setString(3, hb.getAddress());
			pstmt.setString(4, hb.getRoom_type());
			pstmt.setString(5, hb.getPhoto());
			pstmt.setString(6, hb.getRoom_subject());
			pstmt.setString(7, hb.getRoom_content());
			pstmt.setInt(8, hb.getRestroom());
			pstmt.setString(9, hb.getIn_time());
			pstmt.setString(10, hb.getOut_time());
			pstmt.setInt(11, hb.getPrice());
			pstmt.setInt(12, 1);
			pstmt.setInt(13, end_date2);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null)	
			try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)	
			try{con.close();}catch(SQLException ex){}
			if(rs!=null)	
			try{rs.close();}catch(SQLException ex){}
		}
		return home_num;
	}
	
	
public void insertConv(ConvBean cb,int home_num) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		

		try {
			con = getConnection();
	
		  
			String sql = "insert into convenience(home_num,essential,disabled,parking,wifi,air_conditioner,"
					+ "animal,party,pickup,elevator,iron,extra_bed,shampoo,heat,smoking,breakfast,laundry,desk,hair_dryer)"
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql); 
		

			pstmt.setInt(1, home_num);
			pstmt.setInt(2, cb.getEssential());
			pstmt.setInt(3, cb.getDisabled());
			pstmt.setInt(4, cb.getParking());
			pstmt.setInt(5, cb.getWifi());
			pstmt.setInt(6, cb.getAir_conditioner());
			pstmt.setInt(7, cb.getAnimal());
			pstmt.setInt(8, cb.getParty());
			pstmt.setInt(9, cb.getPickup());
			pstmt.setInt(10, cb.getElevator());
			pstmt.setInt(11, cb.getIron());
			pstmt.setInt(12, cb.getExtra_bed());
			pstmt.setInt(13, cb.getShampoo());
			pstmt.setInt(14, cb.getHeat());
			pstmt.setInt(15, cb.getSmoking());
			pstmt.setInt(16, cb.getBreakfast());
			pstmt.setInt(17, cb.getLaundry());
			pstmt.setInt(18, cb.getDesk());
			pstmt.setInt(19, cb.getHair_dryer());
	

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null)	
			try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)	
			try{con.close();}catch(SQLException ex){}
			if(rs!=null)	
			try{rs.close();}catch(SQLException ex){}
		}
		return;
	}


	public int insertRoom(RoomBean rb,int home_num) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		int room_num=0;
				 
		
		try {
			con = getConnection();
			
			
			for(int i=1; i<=rb.getRe_room(); i++)		
			{
				String sql = "select max(room_num) from room";
				pstmt = con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){		room_num=rs.getInt("max(room_num)")+1;	}	
				sql = "insert into room values(?,?,?,?,?)";
				System.out.println(i);
				int num = i;
				System.out.println(num);
			pstmt = con.prepareStatement(sql); 
		
			pstmt.setInt(1, room_num);
			pstmt.setInt(2, num);
			pstmt.setInt(3, rb.getMin_people());
			pstmt.setInt(4, rb.getMax_people());
			pstmt.setInt(5, home_num);
			pstmt.executeUpdate();
			}


			

		
			} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null)	
			try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)	
			try{con.close();}catch(SQLException ex){}
			if(rs!=null)	
			try{rs.close();}catch(SQLException ex){}
		}
		return room_num;
	}

	
	
	public void insertBed(BedBean bb,int room_num) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
				 
		
		try {
			con = getConnection();
			
			  
			String sql = "insert into bed_type values(?,?,?,?)";

			pstmt = con.prepareStatement(sql); 
		
			pstmt.setInt(1, room_num);
			pstmt.setInt(2, bb.getSingle_bed());
			pstmt.setInt(3, bb.getDouble_bed());
			pstmt.setInt(4, bb.getBunk_bed());
			pstmt.executeUpdate();
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null)	
			try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)	
			try{con.close();}catch(SQLException ex){}
			if(rs!=null)	
			try{rs.close();}catch(SQLException ex){}
		}
		return;
	}
	

	public HostBean getHost(int home_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		HostBean hb=new HostBean();
		
		try {
			con=getConnection();
			// 3단계 sql 구문 만들고 실행할수 있는 객체생성
			// 세션값에 해당하는 회원정보 가져오기
			String sql = "select * from home where home_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, home_num);
			// 4단계 결과 저장 <= 실행
			rs = pstmt.executeQuery();
			// 5단계 첫행으로이동 열접근 => 출력
			if (rs.next()) {
				hb.setRoom_subject(rs.getString("room_subject"));
				hb.setRoom_content(rs.getString("room_content"));
				hb.setRestroom(rs.getInt("restroom"));
				hb.setPrice(rs.getInt("price"));
				hb.setStart_date(rs.getDate("start_date"));
				hb.setEnd_date(rs.getDate("end_date"));
				hb.setAddress(rs.getString("address"));
				hb.setRoom_type(rs.getString("room_type"));
				hb.setIn_time(rs.getString("in_time"));
				hb.setOut_time(rs.getString("out_time"));
			}
		
	}catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(pstmt!=null)	
		try{pstmt.close();}catch(SQLException ex){}
		if(con!=null)	
		try{con.close();}catch(SQLException ex){}
		if(rs!=null)	
		try{rs.close();}catch(SQLException ex){}


		}
		return hb;
	
	}
	
	

	// 호스트 여부 체크
	public int hostCheck(String host_email){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		try{
			con = getConnection();
			String sql = "select * from host where host_email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, host_email);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				result=1;
			}else{result=0;}
		}catch(Exception e){e.printStackTrace();
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(SQLException e){}
		}
		return result;		
	}
	
/*	// 호스트 여부 체크
	public int home_statusCheck(int home_status){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		try{
			con = getConnection();
			String sql = "select * from host where home_status=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, home_status);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				result=1;
			}else{result=0;}
		}catch(Exception e){e.printStackTrace();
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(SQLException e){}
		}
		return result;		
	}*/
	
	
	
	
	// 호스트 cash 누적적립/인출
	public int[] getCashAmount(String host_email){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int[] cash = new int[2];
		try{
			con = getConnection();
			String sql = "select * from host where host_email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, host_email);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				cash[0] = rs.getInt("cash");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(SQLException e){}
		}
		
		return cash;
	}
	
	// 호스트 cash 내역리스 select
	public List<PaymentBean> getCashList(String host_email){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<PaymentBean> c_list = new ArrayList<>();
		try{
			con=getConnection();
			String sql = "select payment_date, payment_num, payment_status, (sum_price-fees) as cash from payment where host_email=? order by payment_date desc, payment_num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, host_email);
			rs = pstmt.executeQuery();
			while(rs.next()){
				PaymentBean pb = new PaymentBean();
				pb.setPayment_date(rs.getDate("payment_date"));
				pb.setPayment_num(rs.getString("payment_num"));
				pb.setPayment_status(rs.getString("payment_status"));
				pb.setSum_price(rs.getInt("cash"));
				
				c_list.add(pb);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return c_list;
	}
	
	public List<HostBean> getHostHomes(String host_email){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<HostBean> hostHome = new ArrayList<>();
		try{
			con = getConnection();
			String sql = "select room_subject, home_num,photo from home where host_email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, host_email);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				HostBean hb = new HostBean();
				hb.setHome_num(rs.getInt("home_num"));
				hb.setRoom_subject(rs.getString("room_subject"));
				hb.setPhoto(rs.getString("photo"));
				hostHome.add(hb);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(SQLException e){}
		}
		
		return hostHome;
	}
	
	public void hostDelete(HostBean hb,int home_num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = getConnection();
			String sql = "update home set home_status=? where home_num=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, 0);
			pstmt.setInt(2, home_num);
			
			
			pstmt.executeUpdate();
	
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(SQLException e){}
		}
		
		return;
		
		
	}
	
	/*public List getHostRoomList() {
		List HostRoomList=new
	}*/
	
	
	public List<HostBean> getValidHostHomes(String host_email){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<HostBean> hostHome = new ArrayList<>();
		try{
			con = getConnection();
			String sql = "select room_subject,home_num,photo,home_status from home where host_email=? and home_status=1";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, host_email);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				HostBean hb = new HostBean();
				hb.setRoom_subject(rs.getString("room_subject"));
				hb.setHome_num(rs.getInt("home_num"));
				hb.setPhoto(rs.getString("photo"));
				hb.setHome_status(rs.getInt("home_status"));
				hostHome.add(hb);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(SQLException e){}
		}
		
		return hostHome;
		
	}
	
	

}