package net.review.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.FAQ.db.FAQBean;





public class ReviewDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = null; 
	//디비연결 메서드
	private Connection getConnection() throws Exception{
		
		//p443
		//커넥션 풀 (Connection Pool)
		//프로그램 설치 Java Naming DI API
		//DBCP API
		
		//tomcat-dbcp.jar 설치
		//1. WebContent/META-INF/context.xml
		//2. WebContent/WEB-INF/web.xml
		
		Connection con=null;
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		con=ds.getConnection();
		return con;
		
	}
	
	//getReviewCount()
	public int getReviewCount(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			//1,2디비연결 메서드 호출
			con=getConnection();
	//3 게시판 글개수 구하기 count(*)
			String sql="select count(*) from review";
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
	
	

	public List<ReviewBean> getReviewList(int startRow, int pageSize, int home_num){
		ResultSet rs = null;
		List<ReviewBean> reviewList = new ArrayList<ReviewBean>();
		try{
			
			//1,2디비연결 메서드호출
			con = getConnection();
			//num 게시판 글번호 구하기
			//sql 함수 최대값 구하기 max()
			sql = "select * from Review where home_num = ? order by payment_num desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, home_num);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ReviewBean re=new ReviewBean();
				re.setPayment_num(rs.getString("payment_num"));
				re.setContent(rs.getString("content"));
				re.setReview_date(rs.getDate("review_date"));
				re.setAccess(rs.getInt("access"));
				re.setClean(rs.getInt("clean"));
				re.setSatisfaction(rs.getInt("satisfaction"));
				re.setMember_email(rs.getString("member_email"));
				re.setHome_num(rs.getInt("satisfaction"));
				
				reviewList.add(re);
				
			}

		}catch (Exception e){
			e.printStackTrace();
		}finally{
			if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
			if (con != null) {try {con.close();} catch (SQLException ex) {	}}
		}
		return reviewList;
	} //getBoardList() end 

}












































