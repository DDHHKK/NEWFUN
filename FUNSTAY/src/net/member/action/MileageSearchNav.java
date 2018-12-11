package net.member.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import net.booking.db.PaymentBean;
import net.member.db.MemberDAO;

public class MileageSearchNav implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MileageSearchNavigation execute()");
		request.setCharacterEncoding("utf-8");
		JSONArray arr = new JSONArray();
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("id");
		//email = "kim@gmail.com";
		
		String start_searchdate = request.getParameter("start_searchdate");
		String end_searchdate = request.getParameter("end_searchdate");
		
		//MemberDAO mdao = new MemberDAO();
		//List<PaymentBean> m_list = mdao.getSearchMileageList(email, start_searchdate, end_searchdate);
		
		//request.setAttribute("m_list", m_list);
		//int [] getmileage = mdao.gettotalMileage(email);

		Class.forName("com.mysql.jdbc.Driver");
		String dbUrl="jdbc:mysql://192.168.2.27:3306/funstay";
		String dbUser="root";
		String dbPass="1234";
		Connection con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
		String sql = "select * from payment where payment_date between ? and ? and member_email=? order by payment_date desc";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, start_searchdate);
		pstmt.setString(2, end_searchdate);
		pstmt.setString(3, email);
		ResultSet rs = pstmt.executeQuery();

		while(rs.next()){
			
			JSONObject pb=new JSONObject();
			pb.put("payment_date", rs.getString("payment_date"));
			pb.put("payment_num", rs.getString("payment_num"));
			pb.put("storage_m", rs.getInt("storage_m"));
			pb.put("used_m", rs.getInt("used_m"));
			pb.put("payment_status", rs.getString("payment_status"));
			
			arr.add(pb);
		}

		
		return null;
	}

}