package net.book.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.booking.db.BookingBean;
import net.booking.db.PaymentBean;
import net.host.db.HostBean;
import net.search.db.SearchBean;





public class BookDAO {
	
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
	
	
	//리뷰 작성 메서드(sql-insert문)
	public void insertReview(ReviewBean bb){
		
		Connection con=null;
	    PreparedStatement pstmt=null;
	    ResultSet rs=null;
	    
	    
	    
		 try{
			    //1,2단계 디비연결하는 메서드 호출
				con=getConnection();
				 //3단계 sql 구문
				String sql="insert into review values(?,?,now(),?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				//System.out.println(bb.getPayment_num());
				pstmt.setString(1,bb.getPayment_num()); //payment_num 			
				pstmt.setString(2,bb.getContent());//content
			    pstmt.setString(3,bb.getSatisfaction());//satisfaction
				pstmt.setString(4,bb.getClean());//clean
				pstmt.setString(5,bb.getAccess());//access
				pstmt.setString(6,bb.getMember_email());//member_email
				pstmt.setInt(7,bb.getHome_num());//home_num
				pstmt.setString(8,bb.getStar());//star

                //4단계 실행
				pstmt.executeUpdate(); 
				
				
		 }catch(Exception e){
			 e.printStackTrace();
		 }finally{
			 //try안에서 예외 발생여부 상관없이 마무리 작업함.
			 //객체 생성해서 사용한 기억공간 없애줌 .close()
			 if(rs!=null) try{rs.close();}catch(SQLException ex){}
			 if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			 if(con!=null) try{con.close();}catch(SQLException ex){}
			 
		 }
		 

	}//리뷰작성 메서드 끝



	

	//완료된 숙소 가져오는 메서드(sql-select문)

    public Vector<?> GetBeforeTrip(String member_email){
		/*List bookingList=new ArrayList<>();
		List paymentList=new ArrayList<>();
		List hostList=new ArrayList<>();*/
		List beforeList=new ArrayList<>();
		
		
    	Vector vector=new Vector<>();
		
		Connection con=null;
	    PreparedStatement pstmt=null;	
	    ResultSet rs=null;
	    
		try{
			//1,2단계 메서드 호출
			con=getConnection();
                
                   String sql2="select * from home h, payment p , booking b "
                   		+ "where p.member_email=? and b.payment_num=p.payment_num and b.home_num=h.home_num and b.check_in<now()";
                   
                   pstmt=con.prepareStatement(sql2);//객체생성
   		           pstmt.setString(1,member_email);
   		          
   		           rs=pstmt.executeQuery();
   		           
   		       while(rs.next()){ 
					//첫 행 이동 열접근해서
   		        	/*HostBean hb=new HostBean();
   		        	PaymentBean pb=new PaymentBean();
   		        	BookingBean bb=new BookingBean();*/
   		        	BeforeBean BeforB=new BeforeBean();
   		      
   		        	
   		   
   		        	/*
   		        	
   		        	
   		        	bb.setCheck_in(rs.getDate("check_in"));
   		        	bb.setCheck_out(rs.getDate("check_out"));
   		        	hb.setRoom_subject(rs.getString("room_subject"));
   		        	pb.setSum_price(rs.getInt("sum_price"));
   		        	hb.setPhoto("photo");*/
   		        	
   		        	
   		        	BeforB.setRoom_type(rs.getString("room_type"));
   		        	BeforB.setPhoto(rs.getString("photo"));
   		        	BeforB.setRoom_subject(rs.getString("room_subject"));
   		        	BeforB.setMember_email(rs.getString("member_email"));
   		        	BeforB.setSum_price(rs.getInt("sum_price"));
   		        	BeforB.setCheck_in(rs.getDate("check_in"));
   		        	BeforB.setCheck_out(rs.getDate("check_out"));
   		        	BeforB.setPeople(rs.getInt("people"));
   		        	
   		        	
   		        	
   		        	
   		        	/*
   		        	bookingList.add(bb);
   		        	paymentList.add(pb);
   		        	hostList.add(hb);*/
   		            beforeList.add(BeforB);
   		        	
				}
   		       /* vector.add(bookingList);
   		        vector.add(paymentList);
   		        vector.add(hostList);*/
   		        vector.add(beforeList);
   		        
   		        
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					 if(rs!=null) try{rs.close();}catch(SQLException ex){}
					 if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
					 if(con!=null) try{con.close();}catch(SQLException ex){}
				}
				
		return vector;
		
	}//완료된 숙소 가져오는 메서드 끝

    
    
  //예정된 숙소 가져오는 메서드(sql-select문)

    public Vector<?> GetAfterTrip(String member_email){
		List bookingList=new ArrayList<>();
		List paymentList=new ArrayList<>();
		List hostList=new ArrayList<>();
		List afterList=new ArrayList<>();
		
    	Vector vector=new Vector<>();
		
		Connection con=null;
	    PreparedStatement pstmt=null;	
	    ResultSet rs=null;
	    
		try{
			//1,2단계 메서드 호출
			con=getConnection();
                
                   String sql2="select * from home h, payment p , booking b "
                   		+ "where p.member_email=? and b.payment_num=p.payment_num and b.home_num=h.home_num and b.check_in>now() and p.payment_status=?";
                   
                   pstmt=con.prepareStatement(sql2);//객체생성
   		           pstmt.setString(1,member_email);
   		           pstmt.setString(2, "결제완료");
   		          
   		           rs=pstmt.executeQuery();
   		           
   		       while(rs.next()){ 
					//첫 행 이동 열접근해서
   		        	HostBean hb=new HostBean();
   		        	PaymentBean pb=new PaymentBean();
   		        	BookingBean bb=new BookingBean();
   		        	BeforeBean BeforB=new BeforeBean();
   		        	
   		        	/*bb.setCheck_in(rs.getDate("check_in"));
   		        	bb.setCheck_out(rs.getDate("check_out"));
   		        	hb.setRoom_subject(rs.getString("room_subject"));
   		        	pb.setSum_price(rs.getInt("sum_price"));*/
   		        	
   		        	bb.setBooking_num(rs.getInt("booking_num"));
   		        	BeforB.setRoom_type(rs.getString("room_type"));
   		        	BeforB.setPhoto(rs.getString("photo"));
   		        	BeforB.setRoom_subject(rs.getString("room_subject"));
   		        	BeforB.setMember_email(rs.getString("member_email"));
   		        	BeforB.setSum_price(rs.getInt("sum_price"));
   		        	BeforB.setCheck_in(rs.getDate("check_in"));
   		        	BeforB.setCheck_out(rs.getDate("check_out"));
   		        	BeforB.setPeople(rs.getInt("people"));
   		        	
   		        	
   		        	
   		        	bookingList.add(bb);
   		        	paymentList.add(pb);
   		        	hostList.add(hb);
   		        	afterList.add(BeforB);
   		        
				}
   		        vector.add(bookingList);
   		        vector.add(paymentList);
   		        vector.add(hostList);
   		        vector.add(afterList);
   		        
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					 if(rs!=null) try{rs.close();}catch(SQLException ex){}
					 if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
					 if(con!=null) try{con.close();}catch(SQLException ex){}
				}
				
		return vector;
		
	}//예정된 숙소 가져오는 메서드 끝
    
    
    
    
  //예약취소하는 메서드(sql-update문)
  	public void BillCancel(BookingBean bb,int booking_num){
  		
  		Connection con=null;
  	    PreparedStatement pstmt=null;
  	    ResultSet rs=null;
  	    
  	    
  	    
  		 try{
  			    //1,2단계 디비연결하는 메서드 호출
  				con=getConnection();
  			    //3단계
  				String sql="delete from booking where booking_num=?";
  				pstmt=con.prepareStatement(sql);
  				
  				pstmt.setInt(1, 0);
  				pstmt.setInt(2, bb.getBooking_num()); 
  				
  			    //4단계 실행
  				pstmt.executeUpdate(); 
  				
  			/*	
  			    //3단계
  				sql="update payment set payment_status=? where payment_num=?";
  				pstmt=con.prepareStatement(sql);
  				
  				pstmt.setString(1, "결제취소");
  				pstmt.setString(2, pb.getPayment_num());
  				
  			    //4단계 실행
  				pstmt.executeUpdate(); 
  				*/
  				
  				
  				
  				
  				
  		 }catch(Exception e){
  			 e.printStackTrace();
  		 }finally{
  			
  			 if(rs!=null) try{rs.close();}catch(SQLException ex){}
  			 if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
  			 if(con!=null) try{con.close();}catch(SQLException ex){}
  			 
  		 }
  		 
  		
  		 
  	}//예약취소 메서드 끝

  	

    //취소된 숙소 가져오는 메서드(sql-select문)

      public Vector<?> GetCancelTrip(String member_email){
  		/*List bookingList=new ArrayList<>();
  		List paymentList=new ArrayList<>();
  		List hostList=new ArrayList<>();*/
  		List afterList=new ArrayList<>();
  		
      	Vector vector=new Vector<>();
  		
  		Connection con=null;
  	    PreparedStatement pstmt=null;	
  	    ResultSet rs=null;
  	    
  		try{
  			//1,2단계 메서드 호출
  			con=getConnection();
                  
  		    //3단계 (취소된 숙소 가져오기)
				String sql="select * from booking where booking_status=?";
                     
                       pstmt=con.prepareStatement(sql);//객체생성
     		           pstmt.setInt(1,0);
     		          
     		           rs=pstmt.executeQuery();
     		           
     		       while(rs.next()){ 
  					//첫 행 이동 열접근해서
     		        	/*HostBean hb=new HostBean();
     		        	PaymentBean pb=new PaymentBean();
     		        	BookingBean bb=new BookingBean();*/
     		        	BeforeBean BeforB=new BeforeBean();
     		        	
     		        	/*bb.setCheck_in(rs.getDate("check_in"));
     		        	bb.setCheck_out(rs.getDate("check_out"));
     		        	hb.setRoom_subject(rs.getString("room_subject"));
     		        	pb.setSum_price(rs.getInt("sum_price"));*/
     		        	
     		        	BeforB.setRoom_type(rs.getString("room_type"));
     		        	BeforB.setPhoto(rs.getString("photo"));
     		        	BeforB.setRoom_subject(rs.getString("room_subject"));
     		        	BeforB.setMember_email(rs.getString("member_email"));
     		        	BeforB.setSum_price(rs.getInt("sum_price"));
     		        	BeforB.setCheck_in(rs.getDate("check_in"));
     		        	BeforB.setCheck_out(rs.getDate("check_out"));
     		        	BeforB.setPeople(rs.getInt("people"));
     		        	
     		        	
     		        	
     		        	/*bookingList.add(bb);
     		        	paymentList.add(pb);
     		        	hostList.add(hb);*/
     		        	afterList.add(BeforB);
     		        
  				}
     		        /*vector.add(bookingList);
     		        vector.add(paymentList);
     		        vector.add(hostList);*/
     		        vector.add(afterList);
     		        
  				}catch(Exception e){
  					e.printStackTrace();
  				}finally{
  					 if(rs!=null) try{rs.close();}catch(SQLException ex){}
  					 if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
  					 if(con!=null) try{con.close();}catch(SQLException ex){}
  				}
  				
  		return vector;
  		
  	}//취소된 숙소 가져오는 메서드 끝
      
  	
  	

	
  	
  	
  	
  	
}//BookDAO 끝















































