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
import net.host.db.HostBean;
import net.member.db.MemberBean;
import net.member.db.QnaBean;
import net.room.db.RoomBean;
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
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

			public Vector getSideSearch(HostBean hb,String [] conv,int num,int satis,int from,int to){
				ResultSet rs = null;
				PreparedStatement pstmt=null;
				List SearchList = new ArrayList();
				List Reviewlist = new ArrayList();
				Vector vector = new Vector();
				StringBuffer sql=new StringBuffer();//속도가 빠름
				int home_num=0;
				try{
					
					con = getConnection();
					
					sql.append("select * from home where  price between ? and ? and home_num = any( select distinct re.home_num from review re inner join(select * from (select home_num as hom_num, sum(min_people) as min_people1, sum(max_people) as max_people1 ");
					sql.append("from room group by home_num) r join (select h.address, h.room_subject, h.room_type, h.room_content, h.price, h.photo, h.home_num from (select b.home_num from home h ");
					sql.append("left join booking b on h.home_num=b.home_num where b.check_in between ? and ? or b.check_out between ? and ?"); 
					System.out.println("dddd");
					try{
						
						
						for(int i =0; i<conv.length; i++){
						sql.append("and h.home_num = any(select home_num from convenience where");
					     System.out.print("conv "+conv[i]);
						if(conv[i].equals("essential")){System.out.println("Asdddddf");sql.append(" essential=?");}
						else if(conv[i].equals("disabled")){sql.append(" disabled=?");}
						else if(conv[i].equals("parking")){sql.append("parking=?");}
						else if(conv[i].equals("wifi")){sql.append("wifi=?");}
						else if(conv[i].equals("air_conditioner")){sql.append("air_conditioner=?");}
						else if(conv[i].equals("animal")){sql.append("animal=?");}
						else if(conv[i].equals("party")){sql.append("party=?");}
						else if(conv[i].equals("pickup")){sql.append("pickup=?");}
						else if(conv[i].equals("elevator")){sql.append(" elevator=?");}
						else if(conv[i].equals("iron")){sql.append("iron=?");}
						else if(conv[i].equals("extra_bed")){sql.append(" extra_bed=?");}
						else if(conv[i].equals("shampoo")){sql.append(" shampoo=?");}
						else if(conv[i].equals("heat")){sql.append("heat=?");}
						else if(conv[i].equals("smoking")){sql.append(" smoking=?");}
						else if(conv[i].equals("breakfast")){sql.append(" breakfast=?");}
						else if(conv[i].equals("laundry")){sql.append(" laundry=?");}
						else if(conv[i].equals("desk")){sql.append("desk=?");}
						else if(conv[i].equals("hair_dryer")) {sql.append(" hair_dryer=?");}
						
						if(i == conv.length-1) {System.out.println("fhfhf"); sql.append(" ) "); }
						else {	
							sql.append(" and ");}
						
						}
						int count=0;
						System.out.println("3333333333333333333333");
						sql.append(") as t right join home h on h.home_num=t.home_num where t.home_num is null and h.address LIKE ? and h.home_status=1 and h.start_date <  ? and h.end_date > ?) s on hom_num=s.home_num where r.max_people1>=? ) li on re.home_num=li.home_num where satisfaction>=?)");
					pstmt=con.prepareStatement(sql.toString());	
					pstmt.setInt(1, from);
					pstmt.setInt(2, to);
					pstmt.setDate(3, hb.getStart_date());
					pstmt.setDate(4, hb.getEnd_date());
					pstmt.setDate(5, hb.getStart_date());
					pstmt.setDate(6, hb.getEnd_date());
					for(int i =7; i<(conv.length+7); i++)
					{	
						count=i;
						System.out.println("번호는 ?");
						System.out.println(count);
						pstmt.setInt(count, 1);
					}	
					
					pstmt.setString(++count, "%"+hb.getAddress()+"%");
					pstmt.setDate(++count, hb.getStart_date());
					pstmt.setDate(++count, hb.getEnd_date());
					pstmt.setInt(++count, num);
					pstmt.setInt(++count,satis);
					
					}catch(NullPointerException e){
						System.out.println("2322222222222222222");
						sql.append(")as t right join home h on h.home_num=t.home_num where t.home_num is null and h.address LIKE ? and h.home_status=1 and h.start_date <  ? and h.end_date > ?) s on hom_num=s.home_num where r.max_people1>=? ) li on re.home_num=li.home_num where satisfaction>=?)");
						pstmt=con.prepareStatement(sql.toString());	
						pstmt.setInt(1, from);
						pstmt.setInt(2, to);
						pstmt.setDate(3, hb.getStart_date());
						pstmt.setDate(4, hb.getEnd_date());
						pstmt.setDate(5, hb.getStart_date());
						pstmt.setDate(6, hb.getEnd_date());
						pstmt.setString(7, "%"+hb.getAddress()+"%");
						pstmt.setDate(8, hb.getStart_date());
						pstmt.setDate(9, hb.getEnd_date());
						pstmt.setInt(10, num);
						pstmt.setInt(11,satis);
					}
				
						
				
		
				
							
				
					rs = pstmt.executeQuery();
					
					while(rs.next()){
					HostBean hb1 = new HostBean();
					ReviewBean rb = new ReviewBean();
					hb1.setAddress(rs.getString("address"));
					hb1.setRoom_subject(rs.getString("room_subject"));
					hb1.setRoom_type(rs.getString("room_type"));
					hb1.setRoom_content(rs.getString("room_content"));
					hb1.setHome_num(rs.getInt("home_num"));
					 home_num = rs.getInt("home_num");
					 SearchList.add(hb1);
					String sql2 = "select avg(satisfaction) from review where home_num=?";
					pstmt = con.prepareStatement(sql2);
					pstmt.setInt(1, home_num);
					if(rs.next())
					{
						rb.setSatisfaction(rs.getString("avg(satisfaction)"));
					}
					hb1.setPrice(rs.getInt("price"));
					hb1.setPhoto(rs.getString("photo"));
					
					Reviewlist.add(rb);
				}
				

					vector.add(SearchList);
					vector.add(Reviewlist);
				}catch (Exception e){
					e.printStackTrace();
				}finally{
					if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
					if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
					if (con != null) {try {con.close();} catch (SQLException ex) {	}}
				}
				return vector;	
			
			
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
		
				con = getConnection();
		
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
		           String sql="select max(QnA_num) from qna_board";
		           pstmt=con.prepareStatement(sql);		      
		           rs=pstmt.executeQuery();
		          
		           if(rs.next()){
		              num=rs.getInt("max(QnA_num)")+1;   //rs.getInt(1)
		           }
		      
		           sql="update qna_board set re_lev = 1 where re_ref = ? ";
		           	  pstmt=con.prepareStatement(sql);
		              pstmt.setInt(1,qb.getRe_ref());
		              /*pstmt.setInt(2, qb.getRe_seq());*/
		              pstmt.executeUpdate();
		          
		           sql="insert into qna_board values(?,?,?,?,?,?,now(),?,1,1)";
		           pstmt=con.prepareStatement(sql);
		           pstmt.setInt(1,num); 		
					pstmt.setString(2,qb.getSubject());
					pstmt.setString(3,qb.getContent());
				    pstmt.setString(4,qb.getQnA_pass());
					pstmt.setString(5,qb.getMember_email());
					pstmt.setInt(6,qb.getHome_num());				
					pstmt.setInt(7,qb.getRe_ref());//re_ref == num 
					
				
						        
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
			
			public List<ReviewBean> getRevieweList(int num) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				List<ReviewBean> r_list = new ArrayList<>();
				try {
					con = getConnection();
					String sql 
							= "select * "
							+ "from review "
							+ "where num=? ";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);

					rs = pstmt.executeQuery();
					while (rs.next()) {
						ReviewBean rb = new ReviewBean();
						rb.setContent(rs.getString("content"));
						rb.setReview_date(rs.getDate("review_date"));
						rb.setContent(rs.getString("content"));
						rb.setSatisfaction(rs.getString("satisfaction"));
						rb.setClean(rs.getString("clean"));
						rb.setAccess(rs.getString("access"));
						rb.setMember_email(rs.getString("member_email"));
					

						r_list.add(rb);
					}
				} catch (Exception e) {
				} finally {
					try{
						if(rs!=null){rs.close();}
						if(pstmt!=null){rs.close();}
						if(con!=null){rs.close();}
					}catch(SQLException e){}
				}
				return r_list;
			}
			
		

}



