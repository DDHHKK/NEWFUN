package net.wishlist.db;

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



public class WishlistDAO {

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
	public void addWishList(WishlistBean wb) //수정필요
	{
		Connection con=null;
		PreparedStatement psm=null;
		ResultSet rs=null;
		String sql="";
		int wishlist_num=0;
		String list_photo = null;
		try {
			//1,2 디비연결
			con=getConnection();
			// num 구하기  max(num)+1
			sql="select max(wishlist_num) from wishlist";
			psm=con.prepareStatement(sql);
			rs=psm.executeQuery();
			
			if(rs.next())
			{
				wishlist_num = rs.getInt("max(wishlist_num)")+1;
			}
			
			sql="select home_photo from wish where wish_num=(select min(m.wish_num) "
					+ "as wish_num from wishlist w, wish m where w.member_email="
					+ "? and w.wishlist_num=m.wishlist_num and m.wishlist_num=?)";
					
			psm=con.prepareStatement(sql);
			psm.setInt(2, wishlist_num);
			psm.setString(1, wb.getMember_email());
			rs=psm.executeQuery();
			
			if(rs.next())
			{
				list_photo = rs.getString("home_photo");
			}
			
			//3 sql insert  now()
			sql="insert into wishlist (wishlist_num,list_name,member_email,list_photo) values(?,?,?,?)";
			psm=con.prepareStatement(sql);
			psm.setInt(1, wishlist_num);
			psm.setString(2, wb.getList_name());
			psm.setString(3, wb.getMember_email());
			if(rs.next())
			{
				psm.setString(4, rs.getString("home_photo"));
			}
			else
			{
				psm.setString(4, "./myinfo/No_Image_Available.gif");
			}
			
			//4 실행
			psm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(psm!=null)try{psm.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
	}//리스트 생성
	
	public List getWishList(String member_email)
	{
		Connection con=null;
		PreparedStatement psm=null;
		ResultSet rs=null;
		List WishList=new ArrayList();
		try
		{
			con = getConnection();
			String sql="select * from wishlist where member_email=? ";
			 psm = con.prepareStatement(sql);
			 psm.setString(1,member_email );
			rs=psm.executeQuery();
			while(rs.next()){
				WishlistBean wb=new WishlistBean();
				wb.setMember_email(member_email);
				wb.setWishlist_num(rs.getInt("wishlist_num"));
				wb.setList_photo(rs.getString("list_photo"));
				wb.setList_name(rs.getString("list_name"));
				WishList.add(wb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(psm!=null)try{psm.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return WishList;
	}
	
	public int CountWishlist(String member_email)
	{
		Connection con=null;
		PreparedStatement psm=null;
		ResultSet rs=null;
		int count=0;
		try
		{
			con = getConnection();
			String sql = "select count(*) from wishlist where member_email=?";
			 psm = con.prepareStatement(sql);
			 psm.setString(1,member_email );
			rs=psm.executeQuery();
			
			if(rs.next())
			{
			count =rs.getInt("count(*)");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(psm!=null)try{psm.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return count;
	}
	
		public void DeleteWishlist ( int wishlist_num, String member_email)
		{
			Connection con = null;
			PreparedStatement psm = null;
			try
			{
				con = getConnection();
				String sql = "delete from wishlist where wishlist_num=? and member_email=?";
				psm = con.prepareStatement(sql);
				psm.setInt(1, wishlist_num);
				psm.setString(2, member_email);
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
		
		public void updateWishlist(){}
}
