package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.booking.db.PaymentBean;
import net.host.db.HostBean;
import net.review.db.ReviewBean;
import net.room.db.RoomBean;
import net.wishlist.db.MyWishBean;

public class MemberDAO {
	private Connection getConnection() throws Exception {

		Connection con = null;
		// Context
		Context init = new InitialContext();
		// DateSource =
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		// con = DataSource
		con = ds.getConnection();

		return con;
	}

	// insertMember()start
	public void insertMember(MemberBean mb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int mnum = 0;
		try {
			con = getConnection();
			sql = "select max(member_num) from member;";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				mnum = rs.getInt("max(member_num)") + 1;
			}
			con = getConnection();
			sql = "insert into member(email,pass,name,phone,birth,profile_photo,mileage,member_num) values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getEmail());
			pstmt.setString(2, mb.getPass());
			pstmt.setString(3, mb.getName());
			pstmt.setString(4, mb.getPhone());
			pstmt.setString(5, mb.getBirth());
			pstmt.setString(6, "no_profile.png");
			pstmt.setInt(7, 0);
			pstmt.setInt(8, mnum);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return;
	}// insert end

	// getMember() start
	public MemberBean getMember(String email) {
		MemberBean mb = new MemberBean();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select * from member where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				mb.setEmail(rs.getString("email"));
				mb.setPass(rs.getString("pass"));
				mb.setName(rs.getString("name"));
				mb.setProfile_photo(rs.getString("profile_photo"));
				mb.setPhone(rs.getString("phone"));
				mb.setBirth(rs.getString("birth"));
				mb.setMileage(rs.getInt("mileage"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return mb;
	}// getMember end

	// email check()start
	public int emailCheck(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = -1;
		try {
			con = getConnection();
			String sql = "select email from member where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				check = 1;
			} else {
				check = 0;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
				}
		}
		return check;
	}// email check()end

	// email(id)pass check()start
	public int userCheck(String email, String pass, int delete_member) {
		int check = -1;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			con = getConnection();

			String sql = "select pass from member where email=? and delete_member=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, 1);
			

			rs = pstmt.executeQuery();

			/*
			 * System.out.println(email); System.out.println(pass);
			 */

			if (rs.next()) {
				if (rs.getString("pass").equals(pass)) {
					check = 1;
				} else {
					check = 0;
				}
			} else {
				check = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return check;
	}// eamil(id)pass check()end

	// updateMember()start
	public int updateMember(MemberBean mb) {
		int check = -1;
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;
		try {
			con = getConnection();
	
			String sql = "update member set name=?, profile_photo=?, phone=?, birth=?,pass=? where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getName());
			pstmt.setString(2, mb.getProfile_photo());
			pstmt.setString(3, mb.getPhone());
			pstmt.setString(4, mb.getBirth());
			pstmt.setString(5, mb.getPass());
			pstmt.setString(6, mb.getEmail());
	
			

			pstmt.executeUpdate();
			
			check = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
			}
		}
		return check;
	}// updateMember()end

	// deleteMember()start
	public int deleteMember(MemberBean mb,String email, String host_email) {
		
		int check = 1;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();

			String sql = "update member set delete_member=? where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setString(2, email);
			pstmt.executeUpdate();
			
			
			String sql2 = "update home set home_status=? where host_email=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, 0);
			pstmt.setString(2, host_email);
			
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
			}
		}
		return check;
	}// deleteMember()end

	// getMemberList()start
	public List<MemberBean> getMemberList(int startRow, int pageSize) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MemberBean> list = new ArrayList<>();
		try {
			con = getConnection();
			String sql = "select * from member order by member_num asc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberBean mb = new MemberBean();
				mb.setEmail(rs.getString("email"));
				mb.setPass(rs.getString("pass"));
				mb.setName(rs.getString("name"));
				mb.setProfile_photo(rs.getString("profile_photo"));
				mb.setPhone(rs.getString("phone"));
				mb.setBirth(rs.getString("birth"));
				mb.setMileage(rs.getInt("mileage"));
				mb.setMember_num(rs.getInt("member_num"));
				list.add(mb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return list;
	}// getMemberList()end

	// deleteList()start
	public void deleteList(int member_num) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			String sql = "delete from member where member_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_num);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
			}
		}
		return;
	}// deleteList()end

	// ID find start
	public String findid(MemberBean mb) {
		String email = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// System.out.println("���̵� �� Ȯ�� >>>> "+mb.getName());
		// System.out.println("��ȣ �� Ȯ�� >>>> " + mb.getPhone());
		try {
			con = getConnection();
			String sql = "select email from member where name=? and phone=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getName());
			pstmt.setString(2, mb.getPhone());

			rs = pstmt.executeQuery();
			if (rs.next()) {
				email = rs.getString("email");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return email;
	}// Id find end

	// pass find start
	public String findpw(MemberBean mb) {
		String pass = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// System.out.println("���̵� �� Ȯ�� >>>> "+mb.getEmail());
		// System.out.println("��ȣ �� Ȯ�� >>>> " + mb.getName());
		try {
			con = getConnection();
			String sql = "select pass from member where email=? and name=? and phone=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getEmail());
			pstmt.setString(2, mb.getName());
			pstmt.setString(3, mb.getPhone());

			rs = pstmt.executeQuery();
			//System.out.println(pass);

			if (rs.next()) {
				pass = rs.getString("pass");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return pass;
	}// pass find end
	
	

	// pass change start : 수정자 - 김다현
	public String updatePw(MemberBean mb) {
		String pass = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// System.out.println("���̵� �� Ȯ�� >>>> "+mb.getEmail());
		// System.out.println("��ȣ �� Ȯ�� >>>> " + mb.getName());
		try {
			con = getConnection();
			String sql = "update member set pass=? where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getPass());
			pstmt.setString(2, mb.getEmail());


			pstmt.executeUpdate();
			
			//System.out.println(pass);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return pass;
	}// pass find end
	
	
	
	
// mileage DAO start

	// mileage list select
	public List<PaymentBean> getMileageList(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<PaymentBean> m_list = new ArrayList<>();
		try {
			con = getConnection();
			String sql 
					= "select payment_date, payment_num, storage_m, used_m, payment_status "
					+ "from payment "
					+ "where member_email=? "
					+ "order by payment_date desc;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PaymentBean pb = new PaymentBean();
				pb.setPayment_date(rs.getDate("payment_date"));
				pb.setPayment_num(rs.getString("payment_num"));
				pb.setStorage_m(rs.getInt("storage_m"));
				pb.setUsed_m(rs.getInt("used_m"));
				pb.setPayment_status(rs.getString("payment_status"));

				m_list.add(pb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){rs.close();}
				if(con!=null){rs.close();}
			}catch(SQLException e){}
		}
		return m_list;
	}

	// now mileage select
	public int[] gettotalMileage(String member_email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int[] getmileage = new int[2];
		try {
			con = getConnection();
			String sql 
				= "select sum(storage_m) as total_m, sum(used_m) as use_m "
				+ "from payment where member_email=? && payment_status='결제완료'";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				getmileage[0] = rs.getInt("total_m");
				getmileage[1] = rs.getInt("use_m");
			}
		} catch (Exception e) {e.printStackTrace();
		} finally {
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){rs.close();}
				if(con!=null){rs.close();}
			}catch(SQLException e){}
		}
		return getmileage;
	}

	// MileageList select
	public List<PaymentBean> getSearchMileageList(String email, String start_searchdate, String end_searchdate) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<PaymentBean> m_list = new ArrayList<>();
		try {
			con = getConnection();
			String sql 
					= "select * "
					+ "from payment "
					+ "where payment_date between ? and ? "
						+ "and member_email=? "
					+ "order by payment_date desc;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, start_searchdate);
			pstmt.setString(2, end_searchdate);
			pstmt.setString(3, email);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PaymentBean pb = new PaymentBean();
				pb.setPayment_date(rs.getDate("payment_date"));
				pb.setPayment_num(rs.getString("payment_num"));
				pb.setStorage_m(rs.getInt("storage_m"));
				pb.setUsed_m(rs.getInt("used_m"));
				pb.setPayment_status(rs.getString("payment_status"));

				m_list.add(pb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){rs.close();}
				if(con!=null){rs.close();}
			}catch(SQLException e){}
		}
		return m_list;
	}

	
// QnA start
	
	



	//QnA 관리 페이지
		public List<QnaBean> getQnAList_host(int home_num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<QnaBean> q_list = new ArrayList<>();
			try {
				con = getConnection();
				String sql 
						= "select * "
						+ "from qna_board "
						+ "where home_num=? and re_seq=0 "
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
	
	
	// QnA 리스트
	public List<QnaBean> getQnAList(String member_email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<QnaBean> q_list = new ArrayList<>();
		try {
			con = getConnection();
			String sql 
					= "select * "
					+ "from qna_board "
					+ "where member_email=? and re_seq=0 "
					+ "order by QnA_num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_email);

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
	
	// memberlist(pageing count) start
	public int getmemberCount() {
		Connection con = null;
		PreparedStatement psm = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = getConnection();

			String sql = "select count(*) from member";
			psm = con.prepareStatement(sql);
			rs = psm.executeQuery();

			if (rs.next()) {
				count = rs.getInt("count(*)");
			}

		} catch (Exception e) {
		} finally {
			if (psm != null)
				try {
					psm.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return count;
	}// memberlist(pageing count) end

	// searchlist
	/*public Vector getsearchList4(HostBean hb, String start_date, String end_date) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vector = new Vector();
		List goodsList = new ArrayList();
		try {
			con = getConnection();
			String sql = "select * from home where address LIKE ? and start_date < ? and end_date > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+hb.getAddress()+"%");
			pstmt.setString(2, start_date);
			pstmt.setString(3, end_date);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HostBean hb1 = new HostBean();
				hb1.setAddress(rs.getString("address"));
				hb1.setStart_date(rs.getDate("start_date"));
				hb1.setEnd_date(rs.getDate("end_date"));
				hb1.setRoom_subject(rs.getString("room_subject"));
				hb1.setRoom_type(rs.getString("room_type"));
				hb1.setRoom_content(rs.getString("room_content"));
				hb1.setPrice(rs.getInt("price"));
				hb1.setPhoto(rs.getString("photo"));
				
				System.out.println("getsearchList" + hb1.getAddress());
				System.out.println("getsearchList" + hb1.getStart_date());
				System.out.println("getsearchList" + hb1.getEnd_date());
				System.out.println("getsearchList" + hb1.getPhoto());
				
				
				goodsList.add(hb1);
			}
			vector.add(goodsList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return vector;
	}*/
	
	public Vector getsearchList(HostBean hb, String start_date, String end_date, int num) { //지역과 날짜 인원수 모든조건이 맞으면 검색
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vector = new Vector();
		List goodsList = new ArrayList();
		List Reviewlist = new ArrayList();
		int home_num = 0;
		
		try {
			con = getConnection();
			/*String sql = "select * from (select h.address,h.room_subject,h.room_type, h.room_content, h.price, h.photo, h.home_num, sum(min_people) "
					+ "as min_people1, sum(max_people) as max_people1 from home h join room r "
					+ "on h.home_num=r.home_num where h.address LIKE ? and h.start_date < ? "
					+ "and h.end_date > ? group by h.home_num) sum_list where max_people1>= ?;";*/
			String sql = "select *"
					+ "from (select home_num, sum(min_people) as min_people1, sum(max_people) as max_people1 "
					+ "from room "
					+ "group by home_num) r join (select h.address, h.room_subject, h.room_type, h.room_content, h.price, h.photo, "
					+ "h.home_num "
					+ "from (select b.home_num "
					+ "from home h left join booking b "
					+ "on h.home_num=b.home_num "
					+ "where b.check_in between ? and ? or b.check_out between ? and ?) as t right join home h "
					+ "on h.home_num=t.home_num "
					+ "where t.home_num is null and h.address LIKE ? and h.home_status=1 and h.start_date < ? "
					+ "and h.end_date > ?) s "
					+ "on r.home_num=s.home_num "
					+ "where r.max_people1>=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, start_date);
			pstmt.setString(2, end_date);
			pstmt.setString(3, start_date);
			pstmt.setString(4, end_date);
			pstmt.setString(5, "%"+hb.getAddress()+"%");
			pstmt.setString(6, start_date);
			pstmt.setString(7, end_date);
			pstmt.setInt(8, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HostBean hb1 = new HostBean();
				hb1.setAddress(rs.getString("address"));
				hb1.setRoom_subject(rs.getString("room_subject"));
				hb1.setRoom_type(rs.getString("room_type"));
				hb1.setRoom_content(rs.getString("room_content"));
				hb1.setHome_num(rs.getInt("home_num"));
				 home_num = rs.getInt("home_num");
				 hb1.setPrice(rs.getInt("price"));
					hb1.setPhoto(rs.getString("photo"));
					goodsList.add(hb1);
					vector.add(goodsList);
					
					String sql2 = "select avg(satisfaction) as star from review where home_num=?";
					pstmt = con.prepareStatement(sql2);
					pstmt.setInt(1, home_num);
					rs = pstmt.executeQuery();
					if(rs.next())
					{
						ReviewBean rb = new ReviewBean();
						rb.setSatisfaction(rs.getInt("star"));
						Reviewlist.add(rb);
						vector.add(Reviewlist);
					}
				
			}
		
			System.out.println("첫번째"+goodsList.size());
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return vector;
	}
	
	public Vector getsearchList2(HostBean hb,int num) { //지역과 인원수맞으면 검색
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vector = new Vector();
		List goodsList = new ArrayList();
		List reviewList = new ArrayList();
		int home_num=0;
		if(num==0){
			num=100;
		}
		try {
			con = getConnection();
			/*String sql = "select * from (select h.address,h.room_subject,h.room_type, h.room_content, h.price, h.photo, h.home_num, sum(min_people) "
					+ "as min_people1, sum(max_people) as max_people1 from home h join room r "
					+ "on h.home_num=r.home_num where h.address LIKE ? and h.start_date < ? "
					+ "and h.end_date > ? group by h.home_num) sum_list where max_people1>= ?;";*/
			String sql = "select * "
					+ "from (select home_num, sum(min_people) as min_people1, sum(max_people) as max_people1 "
					+ "from room "
					+ "group by home_num) r join (select address, room_subject, room_type, room_content, price, photo,home_num "
					+ "from home "
					+ "where address LIKE ? and home_status=1) s "
					+ "on r.home_num=s.home_num "
					+ "where r.max_people1>=?";


			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+hb.getAddress()+"%");
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HostBean hb1 = new HostBean();
				hb1.setAddress(rs.getString("address"));
				hb1.setRoom_subject(rs.getString("room_subject"));
				hb1.setRoom_type(rs.getString("room_type"));
				hb1.setRoom_content(rs.getString("room_content"));
				hb1.setHome_num(rs.getInt("home_num"));
				hb1.setPrice(rs.getInt("price"));
				hb1.setPhoto(rs.getString("photo"));
				 home_num = rs.getInt("home_num");
				 hb1.setPrice(rs.getInt("price"));
					hb1.setPhoto(rs.getString("photo"));
					goodsList.add(hb1);
					vector.add(goodsList);
					
					String sql2 = "select avg(satisfaction) as star from review where home_num=?";
					pstmt = con.prepareStatement(sql2);
					pstmt.setInt(1, home_num);
					rs = pstmt.executeQuery();System.out.println("star2");
					if(rs.next())
					{
						ReviewBean rb = new ReviewBean();
						rb.setSatisfaction(rs.getInt("star"));
						
						reviewList.add(rb);
						vector.add(reviewList);
					}
			}
		
			System.out.println("두번째"+goodsList.size());
			
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return vector;
	}
	

	public Vector getsearchList3(HostBean hb) { //지역만 맞으면 검색

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vector = new Vector();
		List goodsList = new ArrayList();
		List reviewList = new ArrayList();
		int home_num=0;
		try {
			con = getConnection();
			String sql = "select * from home where address LIKE ? and home_status=1";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+hb.getAddress()+"%");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				HostBean hb1 = new HostBean();
				hb1.setAddress(rs.getString("address"));
				hb1.setRoom_subject(rs.getString("room_subject"));
				hb1.setRoom_type(rs.getString("room_type"));
				hb1.setRoom_content(rs.getString("room_content"));
				hb1.setHome_num(rs.getInt("home_num"));
				hb1.setPrice(rs.getInt("price"));
				hb1.setPhoto(rs.getString("photo"));
				home_num = rs.getInt("home_num");
				goodsList.add(hb1);
			vector.add(goodsList);
		
			String sql2 = "select avg(satisfaction) as star from review where home_num=?";
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1, home_num);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				ReviewBean rb = new ReviewBean();
				rb.setSatisfaction(rs.getInt("star"));
				reviewList.add(rb);
				vector.add(reviewList);
			}
			}
			System.out.println("세번째"+goodsList.size());
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return vector;
	}
	

	public Vector getheartphoto() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vector = new Vector();
		List goodsList = new ArrayList();
		try {
			con = getConnection();
			String sql = "select sum(a.heart), a.home_photo, substr(b.address,1,2) as address, a.home_num,b.room_subject,b.price "
					+ "from wish a  join home b "
					+ "on a.home_num=b.home_num "
					+ "group by a.home_photo, b.address "
					+ "order by sum(heart) desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				MyWishBean sb1 = new MyWishBean();
				sb1.setHome_photo(rs.getString("home_photo"));
				sb1.setHome_num(rs.getInt("home_num"));
				sb1.setRoom_subject(rs.getString("room_subject"));
				sb1.setPrice(rs.getInt("price"));
				System.out.println(sb1.getHome_photo());
				System.out.println(sb1.getHome_num());
				System.out.println(sb1.getRoom_subject());
				System.out.println(sb1.getPrice());

				goodsList.add(sb1);
			}
			
			vector.add(goodsList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return vector;
	}
	
	public Vector getsatisfactionphoto() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vector = new Vector();
		List goodsList = new ArrayList();
		try {
			con = getConnection();
			String sql = "select sum(a.satisfaction), b.photo, substr(b.address,1,2) as address, a.home_num, b.room_subject, b.price  "
					+ "from review a  join home b "
					+ "on a.home_num=b.home_num "
					+ "group by b.photo, b.address, a.home_num "
					+ "order by sum(satisfaction) desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				MyWishBean sb1 = new MyWishBean();
				sb1.setHome_photo(rs.getString("photo"));
				sb1.setHome_num(rs.getInt("home_num"));
				sb1.setRoom_subject(rs.getString("room_subject"));
				sb1.setPrice(rs.getInt("price"));
			
				goodsList.add(sb1);
			}
			
			vector.add(goodsList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return vector;
	}


}// class end
