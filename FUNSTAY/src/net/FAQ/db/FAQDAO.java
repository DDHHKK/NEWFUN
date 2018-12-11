package net.FAQ.db;

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


public class FAQDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = null; 

private Connection getConnection() throws Exception{
		
		Connection con = null;
		// Context ��ü ����
		Context init = new InitialContext();
		// DateSource = ��񿬵� �̸� �ҷ�����
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		// con = DataSource
		con = ds.getConnection();

		return con;
	}
	public void FAQ_boardInsert(FAQBean fb){
		ResultSet rs = null;
		int num = 0;
		try{
			
			//1,2디비연결 메서드호출
			con = getConnection();
			//num 게시판 글번호 구하기
			//sql 함수 최대값 구하기 max()
			sql = "select max(FAQ_num) from FAQ_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) num = rs.getInt(1)+1;
			//3. sql insert  
			sql = "insert into FAQ_board(FAQ_num,FAQ_subject,FAQ_content) values(?,?,?)";
			pstmt=con.prepareStatement(sql); 
			pstmt.setInt(1, num); //num
			pstmt.setString(2, fb.getFAQ_subject());
			pstmt.setString(3, fb.getFAQ_content());
			//4. 실행
			pstmt.executeUpdate();
			 
			
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
			if (con != null) {try {con.close();} catch (SQLException ex) {	}}
		}
		
	}// insertBoard() end

	//getBoardCount()
		public int getFAQ_boardCount(){
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int count=0;
			try {
				//1,2디비연결 메서드 호출
				con=getConnection();
		//3 게시판 글개수 구하기 count(*)
				String sql="select count(*) from FAQ_board";
				pstmt=con.prepareStatement(sql);
				//4 저장 <= 결과 실행
				rs=pstmt.executeQuery();
				//5 첫행에 데이터 있으면 
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
		
		
	
		public List<FAQBean> getFAQ_boardList(int startRow, int pageSize){
			ResultSet rs = null;
			List<FAQBean> boardList = new ArrayList<FAQBean>();
			try{
				
				//1,2디비연결 메서드호출
				con = getConnection();
				//num 게시판 글번호 구하기
				//sql 함수 최대값 구하기 max()
				sql = "select * from FAQ_board order by FAQ_num desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow-1);
				pstmt.setInt(2, pageSize);
				rs = pstmt.executeQuery();
				while(rs.next()){
					FAQBean fb=new FAQBean();
					fb.setFAQ_num(rs.getInt("FAQ_num"));
					fb.setFAQ_subject(rs.getString("FAQ_subject"));
					fb.setFAQ_content(rs.getString("FAQ_content"));
					
					
					boardList.add(fb);
					
				}

			}catch (Exception e){
				e.printStackTrace();
			}finally{
				if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
				if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
				if (con != null) {try {con.close();} catch (SQLException ex) {	}}
			}
			return boardList;
		} //getBoardList() end 
	
		
	public FAQBean getFAQ_board(int FAQ_num){
			ResultSet rs = null;
			FAQBean fb = new FAQBean();
			try{			
				//1,2디비연결 메서드호출
				con = getConnection();
				//num 게시판 글번호 구하기
				//sql 함수 최대값 구하기 max()
				sql = "select * from FAQ_board where FAQ_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, FAQ_num);
				rs = pstmt.executeQuery();
				while(rs.next()){				
					fb.setFAQ_num(rs.getInt(1));
					fb.setFAQ_subject(rs.getString(2));
					fb.setFAQ_content(rs.getString(3));
					
				}
			}catch (Exception e){
				e.printStackTrace();
			}finally{
				if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
				if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
				if (con != null) {try {con.close();} catch (SQLException ex) {	}}
			}
			return fb;		
		}// getFAQ_board() end

	public void updateReadcount(int FAQ_num){
			ResultSet rs = null;
			try{			
				con = getConnection();
				sql = "update board set readcount=readcount+1 where FAQ_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, FAQ_num);
				pstmt.executeUpdate();			
			}catch (Exception e){
				e.printStackTrace();
			}finally{
				if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
				if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
				if (con != null) {try {con.close();} catch (SQLException ex) {	}}
			}
		}// updateReadcount() end
	
	public int FAQ_boardUpdate(FAQBean fb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = getConnection();
			String sql ="update FAQ_board set FAQ_subject=?, FAQ_content=? where FAQ_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,fb.getFAQ_subject());
			pstmt.setString(2,fb.getFAQ_content());
			pstmt.setInt(3,fb.getFAQ_num());
			
			pstmt.executeUpdate();
			
			return 1;
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return -1;
	}

	public void FAQ_boardDelete(int FAQ_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = getConnection();
			String sql = "delete from FAQ_board where FAQ_num=? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, FAQ_num);
			
			pstmt.executeUpdate();
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return;
	}
	
/*public void FAQ_boardDelete(FAQBean fb) {
	Connection con = null;
	PreparedStatement pstmt = null;
	try{
		con = getConnection();
		String sql = "delete from FAQ_board where FAQ_num=? ";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1,fb.getFAQ_num());
		
		pstmt.executeUpdate();
	}catch (Exception e){
		e.printStackTrace();
	}finally{
		if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		if(con!=null)try{con.close();}catch(SQLException ex){}
	}
	return;
}*/
	


}//클래스



