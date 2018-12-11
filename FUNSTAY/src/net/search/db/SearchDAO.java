package net.search.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.FAQ.db.FAQBean;
import net.member.db.MemberBean;
import net.search.Action.SearchListAction;



public class SearchDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = null; 

private Connection getConnection() throws Exception{
		
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		con = ds.getConnection();

		return con;
	}
	
	
	//getBoardCount()
		public int getSearchCount(){
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int count=0;
			try {
				//1,2�뵒鍮꾩뿰寃� 硫붿꽌�뱶 �샇異�
				con=getConnection();
		//3 寃뚯떆�뙋 湲�媛쒖닔 援ы븯湲� count(*)
				String sql="select count(*) from home";
				pstmt=con.prepareStatement(sql);
				//4 ���옣 <= 寃곌낵 �떎�뻾
				rs=pstmt.executeQuery();
				//5 泥ロ뻾�뿉 �뜲�씠�꽣 �엳�쑝硫� 
				if(rs.next()){
					count=rs.getInt(1);   
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				if(rs!=null)try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
				if(con!=null)try{con.close();}catch(SQLException ex){}
			}
			return count;
		} 
		
		
	
		public List<SearchBean> getSearchList(int startRow, int pageSize){
			ResultSet rs = null;
			List<SearchBean> SearchList = new ArrayList<SearchBean>();
			try{
				
				//1,2�뵒鍮꾩뿰寃� 硫붿꽌�뱶�샇異�
				con = getConnection();
				//num 寃뚯떆�뙋 湲�踰덊샇 援ы븯湲�
				//sql �븿�닔 理쒕�媛� 援ы븯湲� max()
				sql = "select * from home order by home_num desc limit ?,? ";
				pstmt = con.prepareStatement(sql); 
				pstmt.setInt(1, startRow-1);
				pstmt.setInt(2, pageSize);
				rs = pstmt.executeQuery();
				while(rs.next()){
					SearchBean sc=new SearchBean();
					sc.setHome_num(rs.getInt("home_num"));
					sc.setHost_email(rs.getString("host_email"));
					sc.setAddress(rs.getString("address"));
					sc.setRoom_type(rs.getString("room_type"));
					sc.setPhoto(rs.getString("photo"));
					sc.setRoom_subject(rs.getString("room_subject"));
					sc.setRoom_content(rs.getString("room_content"));
					sc.setRestroom(rs.getInt("restroom"));
					sc.setIn_time(rs.getString("in_time"));
					sc.setOut_time(rs.getString("out_time"));
					sc.setPrice(rs.getInt("price"));	
					sc.setStart_date(rs.getDate("start_date"));
					sc.setEnd_date(rs.getDate("end_date"));
					sc.setApply_date(rs.getDate("apply_date"));

					
					SearchList.add(sc);
					
				}

			}catch (Exception e){
				e.printStackTrace();
			}finally{
				if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
				if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
				if (con != null) {try {con.close();} catch (SQLException ex) {	}}
			}
			return SearchList;
		} 
	
		public void updateReadcount(int home_num){
			ResultSet rs = null;
			try{			
				con = getConnection();
				sql = "update home set readcount=readcount+1 where home_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, home_num);
				pstmt.executeUpdate();			
			}catch (Exception e){
				e.printStackTrace();
			}finally{
				if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
				if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
				if (con != null) {try {con.close();} catch (SQLException ex) {	}}
			}
		}// updateReadcount() end
		
		public SearchBean getSearchboard(int home_num){
			ResultSet rs = null;
			SearchBean sc = new SearchBean();
			try{			
				//1,2�뵒鍮꾩뿰寃� 硫붿꽌�뱶�샇異�
				con = getConnection();
				//num 寃뚯떆�뙋 湲�踰덊샇 援ы븯湲�
				//sql �븿�닔 理쒕�媛� 援ы븯湲� max()
				sql = "select * from home where home_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, home_num);
				rs = pstmt.executeQuery();
				while(rs.next()){				
					sc.setHome_num(rs.getInt(1));
					sc.setHost_email(rs.getString(2));
					sc.setAddress(rs.getString(3));
					sc.setRoom_type(rs.getString(4));
					sc.setPhoto(rs.getString(5));
					sc.setRoom_subject(rs.getString(6));
					sc.setRoom_content(rs.getString(7));
					sc.setRestroom(rs.getInt(8));
					sc.setIn_time(rs.getString(9));
					sc.setOut_time(rs.getString(10));
					sc.setApply_date(rs.getDate(11));
					sc.setPrice(rs.getInt(12));
					sc.setStart_date(rs.getDate(13));
					sc.setEnd_date(rs.getDate(14));
		}
			}catch (Exception e){
				e.printStackTrace();
			}finally{
				if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
				if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
				if (con != null) {try {con.close();} catch (SQLException ex) {	}}
			}
			return sc;		
		}


}//�겢�옒�뒪



