package net.wishlist.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.host.db.HostBean;
import net.member.db.MemberBean;

public class MyWishDAO {
	private Connection getConnection() throws Exception{
		Connection con=null;
//		String url="jdbc:mysql://localhost:3306/jspdb";
//		String dbuser="jspid";
//		String dbpass="jsppass";
		//1단계 드라이버로더
//		Class.forName("com.mysql.jdbc.Driver");
		//2단계 디비연결
//		con=DriverManager.getConnection(url,dbuser,dbpass);
		
		//커넥션풀 : 데이터베이스와 연결된 Connection 객체를 미리 생성하여
		//풀속에 저장해 두고 필요할때마다 이 풀에 접근하여 Connection객체 사용
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		con=ds.getConnection();
		return con;
	}
	
	public List getMyWishlist(int wishlist_num)
	{
		Connection con=null;
		PreparedStatement psm=null;
		ResultSet rs=null;
		List MyWishList=new ArrayList();
		try
		{
			con = getConnection();
			String sql="select * from wish where wishlist_num=? ";
			 psm = con.prepareStatement(sql);
			 psm.setInt(1,wishlist_num );
			rs=psm.executeQuery();
			while(rs.next()){
				MyWishBean mwb=new MyWishBean();
				mwb.setWish_num(rs.getInt("wish_num"));
				mwb.setHome_photo(rs.getString("home_photo"));
				mwb.setHeart(rs.getInt("heart"));
				mwb.setWishlist_num(rs.getInt("wishlist_num"));
				mwb.setHome_num(rs.getInt("home_num"));
				mwb.setRoom_subject(rs.getString("room_subject"));
				mwb.setPrice(rs.getInt("price"));
				mwb.setHeart_count(rs.getInt("heart_count"));
				mwb.setHome_satisfaction(rs.getInt("home_satisfaction"));
				MyWishList.add(mwb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(psm!=null)try{psm.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return MyWishList;
	}
	
	
	public int insertMyWish(HostBean hb, int wishlist_num){
		Connection con=null;
		PreparedStatement psm=null;
		ResultSet rs=null;
		String sql="";
		int wish_num=0;
		int heart_count=0;
		try {
			//1,2 디비연결
			con=getConnection();
			// num 구하기  max(num)+1
			sql="select max(wish_num) from wish";
			psm=con.prepareStatement(sql);
			rs=psm.executeQuery();
			
			if(rs.next())
			{
				wish_num = rs.getInt("max(wish_num)")+1;
			}
			
			sql="select count(*) from wish where heart=1";
			psm=con.prepareStatement(sql);
			rs=psm.executeQuery();
			if(rs.next())
			{
				heart_count =rs.getInt("count(*)");
			}
			
			
			sql = "insert into wish values(?,?,?,?,?,?,?)";
			psm=con.prepareStatement(sql);
			psm.setInt(1,wish_num);
			psm.setString(2,hb.getPhoto());
			psm.setInt(3,1);
			psm.setInt(4,wishlist_num);
			psm.setInt(5,hb.getHome_num());
			psm.setString(6,hb.getRoom_subject());
			psm.setInt(7,hb.getPrice());
			psm.setString(8,hb.getRoom_subject());
			psm.setInt(9,heart_count);
			psm.setInt(10,0);
			
			psm.executeUpdate();
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			if(psm!=null)try{psm.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
		}
		return 1;
	}//insert함수
	
	public void DeleteMyWish (int wish_num)
	{
		Connection con = null;
		PreparedStatement psm = null;
		
		try
		{
			con = getConnection();
			String sql = "delete from wish where wish_num=? ";
			psm = con.prepareStatement(sql);
			psm.setInt(1, wish_num);
		
			psm.executeUpdate();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(psm!=null)		
				try	{	psm.close();	}	catch(SQLException ex)	{}
			if(con!=null)		
				try	{	con.close();	}	catch(SQLException ex)	{}
		}	
}
}
