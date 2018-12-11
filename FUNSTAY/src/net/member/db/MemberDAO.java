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
	public int userCheck(String email, String pass) {
		int check = -1;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			con = getConnection();

			String sql = "select pass from member where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			;

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

			String sql = "update member set name=?, profile_photo=?, phone=?, birth=? where email=? and pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getName());
			pstmt.setString(2, mb.getProfile_photo());
			pstmt.setString(3, mb.getPhone());
			pstmt.setString(4, mb.getBirth());
			pstmt.setString(5, mb.getEmail());
			pstmt.setString(6, mb.getPass());

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
	public int deleteMember(String email, String pass) {
		int check = 1;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberBean mb = new MemberBean();
		try {
			con = getConnection();

			String sql = "delete from member where email = ? and pass = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pass);
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
			String sql = "select pass from member where email=? and name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getEmail());
			pstmt.setString(2, mb.getName());

			rs = pstmt.executeQuery();
			System.out.println(pass);

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
					+ "where member_email=? "
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
	public Vector getsearchList(MemberBean mb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vector = new Vector();
		List goodsList = new ArrayList();
		try {
			con = getConnection();
			String sql = "select * from practice where search_info =? and text11 =? and text12 =? and date_a =? and date_b =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getSearch_info());
			pstmt.setInt(2, mb.getText11());
			pstmt.setInt(3, mb.getText12());
			pstmt.setString(4, mb.getDate_a());
			pstmt.setString(5, mb.getDate_b());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberBean mb1 = new MemberBean();
				mb1.setSearch_info(rs.getString("search_info"));
				mb1.setText11(Integer.parseInt(rs.getString("text11")));
				mb1.setText12(Integer.parseInt(rs.getString("text12")));
				mb1.setDate_a(rs.getString("date_a"));
				mb1.setDate_b(rs.getString("date_b"));
				mb1.setImage(rs.getString("image"));

				goodsList.add(mb1);
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

	public Vector getsearchList2(MemberBean mb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vector = new Vector();
		List goodsList = new ArrayList();
		try {
			con = getConnection();
			String sql = "select * from practice where search_info =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getSearch_info());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberBean mb1 = new MemberBean();
				mb1.setSearch_info(rs.getString("search_info"));
				mb1.setText11(Integer.parseInt(rs.getString("text11")));
				mb1.setText12(Integer.parseInt(rs.getString("text12")));
				mb1.setImage(rs.getString("image"));

				goodsList.add(mb1);

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

	public Vector getsearchList3(MemberBean mb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vector = new Vector();
		List goodsList = new ArrayList();
		try {
			con = getConnection();
			String sql = "select * from practice where search_info =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getSearch_info());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberBean mb1 = new MemberBean();
				mb1.setSearch_info(rs.getString("search_info"));
				mb1.setText11(Integer.parseInt(rs.getString("text11")));
				mb1.setText12(Integer.parseInt(rs.getString("text12")));
				mb1.setImage(rs.getString("image"));

				goodsList.add(mb1);
				System.out.println(mb1.getSearch_info());
				System.out.println(mb1.getText11());
				System.out.println(mb1.getText12());
				System.out.println(mb1.getImage());
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
