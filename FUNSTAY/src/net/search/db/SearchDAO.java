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
import net.book.db.ReviewBean;
import net.member.db.MemberBean;
import net.member.db.QnaBean;
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
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

			public Vector getSideSearch(List list,String[] convenience,String []num_conv){
				ResultSet rs = null;
				PreparedStatement pstmt=null;
				List<SearchBean> SearchList = new ArrayList<SearchBean>();
				StringBuffer sql=new StringBuffer();//속도가 빠름
				try{
					
					//1,2�뵒鍮꾩뿰寃� 硫붿꽌�뱶�샇異�
					con = getConnection();
		
					sql.append("select h.address,h.room_subject,h.room_type, h.room_content, h.price, h.photo, h.home_num, sum(min_people) as min_people1, sum(max_people) as max_people1 from home h,  room ro, convenience c, review re, payment p where  h.home_num=ro.home_num and h.home_num=c.home_num and  h.home_num=re.home_num and re.payment_num=p.payment_num and h.address LIKE '부산' and h.start_date < '2018-12-07' and h.end_date > '2018-12-19' and re.satisfaction = 3 and (h.price between 10000 and 50000)");
					
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
		
		// QnA 리스트
		public List<QnaBean> getQnAList(int home_num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<QnaBean> q_list = new ArrayList<>();
			try {
				con = getConnection();
				String sql 
						= "select * "
						+ "from qna_board "
						+ "where home_num=? "
						+ "order by QnA_num desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, home_num);

				rs = pstmt.executeQuery();
				while (rs.next()) {
					QnaBean qb = new QnaBean();
					qb.setQnA_num(rs.getInt("QnA_num"));
					qb.setSubject(rs.getString("subject"));
					qb.setContent(rs.getString("content"));
					qb.setQnA_pass(rs.getString("QnA_pass"));
					qb.setMember_email(rs.getString("member_email"));
					qb.setHome_num(rs.getInt("home_num"));
					qb.setQnA_date(rs.getDate("QnA_date"));
					qb.setRe_ref(rs.getInt("re_ref"));
					qb.setRe_lev(rs.getInt("re_lev"));
					qb.setRe_seq(rs.getInt("re_seq"));

					q_list.add(qb);
				}
			} catch (Exception e) {
			} finally {
				try{
					if(rs!=null){rs.close();}
					if(pstmt!=null){rs.close();}
					if(con!=null){rs.close();}
				}catch(SQLException e){}
			}
			return q_list;
		}
		
		public QnaBean getQnaboard(int home_num){
			ResultSet rs = null;
			QnaBean qb = new QnaBean();
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
					qb.setHome_num(rs.getInt(1));
					qb.setSubject(rs.getString(2));
					qb.setContent(rs.getString(3));
					qb.setQnA_pass(rs.getString(4));
					qb.setMember_email(rs.getString(5));
					qb.setHome_num(rs.getInt(6));
					qb.setQnA_date(rs.getDate(7));
					qb.setRe_ref(rs.getInt(8));
					qb.setRe_lev(rs.getInt(9));
					qb.setRe_seq(rs.getInt(10));
					
					
					
		}
			}catch (Exception e){
				e.printStackTrace();
			}finally{
				if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
				if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
				if (con != null) {try {con.close();} catch (SQLException ex) {	}}
			}
			return qb;		
		}
		

		// QnA content
		public List<QnaBean> getQnAcontent (int re_ref) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<QnaBean> q_list = new ArrayList();
			try{
				con = getConnection();
				String sql  
					    = "select "
							+ "q.QnA_num,q.subject,q.content,q.QnA_pass,q.member_email,q.home_num,q.QnA_date,q.re_ref,q.re_lev,q.re_seq,h.room_subject "
						+ "from qna_board q join home h "
						+ "on q.home_num = h.home_num "
						+ "where q.re_ref=? "
						+ "order by q.re_lev";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, re_ref);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					QnaBean qb = new QnaBean();
					qb.setQnA_num(rs.getInt("q.QnA_num"));
					qb.setContent(rs.getString("q.content"));
					qb.setHome_num(rs.getInt("q.home_num"));
					qb.setMember_email(rs.getString("q.member_email"));
					qb.setQnA_date(rs.getDate("q.QnA_date"));
					qb.setQnA_pass(rs.getString("q.QnA_pass"));
					qb.setRe_lev(rs.getInt("q.re_lev"));
					qb.setRe_ref(rs.getInt("q.re_ref")); 
					qb.setRe_seq(rs.getInt("q.re_seq"));
					qb.setSubject(rs.getString("q.subject"));
					qb.setHome_subject(rs.getString("h.room_subject"));
					
					q_list.add(qb);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					if(rs!=null){rs.close();}
					if(pstmt!=null){rs.close();}
					if(con!=null){rs.close();}
				}catch(SQLException e){}
			}
			return q_list;
		}
		
		//getQnaCount()
				public int getQnaCount(){
					Connection con=null;
					PreparedStatement pstmt=null;
					ResultSet rs=null;
					int count=0;
					try {
						//1,2�뵒鍮꾩뿰寃� 硫붿꽌�뱶 �샇異�
						con=getConnection();
				//3 寃뚯떆�뙋 湲�媛쒖닔 援ы븯湲� count(*)
						String sql="select count(*) from qna_board";
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
				
				
		//QnA insert
			public void insertQna_board(QnaBean qb){
				ResultSet rs = null;
				int num = 0;
				try{
						
					con = getConnection();
					sql = "select max(QnA_num) from qna_board";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					if(rs.next()) num = rs.getInt(1)+1;
					sql = "insert into qna_board values(?,?,?,?,?,?,now(),?,?,?)";
					pstmt=con.prepareStatement(sql);

					pstmt.setInt(1,num); 		
					pstmt.setString(2,qb.getSubject());
					pstmt.setString(3,qb.getContent());
				    pstmt.setString(4,qb.getQnA_pass());
					pstmt.setString(5,qb.getMember_email());
					pstmt.setInt(6,qb.getHome_num());				
					pstmt.setInt(7,num);
					pstmt.setInt(8,qb.getRe_lev());
					pstmt.setInt(9,qb.getRe_seq());
						
						
					pstmt.executeUpdate();
						 
						
				}catch (Exception e){
					e.printStackTrace();
				}finally{
					if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
					if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
					if (con != null) {try {con.close();} catch (SQLException ex) {	}}
				}
					
			}
			
			public void qna_updateReadcount(int qna_num){
				ResultSet rs = null;
				try{			
					con = getConnection();
					sql = "update qna_board set readcount=readcount+1 where qna_num = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, qna_num);
					pstmt.executeUpdate();			
				}catch (Exception e){
					e.printStackTrace();
				}finally{
					if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
					if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
					if (con != null) {try {con.close();} catch (SQLException ex) {	}}
				}
			}// updateReadcount() end

		
			
		// reInsertBoard
			public void reInsertBoard(QnaBean qb){
		        Connection con=null;
		        PreparedStatement pstmt=null;
		        ResultSet rs=null;
		        int num=0; 
		        try {		          
		           con=getConnection();	        
		           String sql="select max(num) from qna_board";
		           pstmt=con.prepareStatement(sql);		      
		           rs=pstmt.executeQuery();
		          
		           if(rs.next()){
		              num=rs.getInt("max(num)")+1;   //rs.getInt(1)
		           }
		      
		           sql="update qna_board set re_seq = re_seq + 1 where re_ref = ? and re_seq > ? ";
		           pstmt=con.prepareStatement(sql);
		              pstmt.setInt(1,qb.getRe_ref());
		              pstmt.setInt(2, qb.getRe_seq());
		              
		          
		           sql="insert into qna_board values(?,?,?,?,?,?,now(),?,?,?)";
		           pstmt=con.prepareStatement(sql);
		           pstmt.setInt(1,num); 		
					pstmt.setString(2,qb.getSubject());
					pstmt.setString(3,qb.getContent());
				    pstmt.setString(4,qb.getQnA_pass());
					pstmt.setString(5,qb.getMember_email());
					pstmt.setInt(6,qb.getHome_num());				
					pstmt.setInt(7,qb.getRe_ref());//re_ref == num 
					pstmt.setInt(8,qb.getRe_lev() + 1);//re_lev + 1
					pstmt.setInt(9,qb.getRe_seq() + 1);//re_seq + 1
						        
		           pstmt.executeUpdate();
		        } catch (Exception e) {
		           e.printStackTrace();
		        }finally{
		           if(rs!=null)try{rs.close();}catch(SQLException ex){}
		           if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		           if(con!=null)try{con.close();}catch(SQLException ex){}
		        }
		     }
		// reInsertBoard end		
			
	
			
		

}



