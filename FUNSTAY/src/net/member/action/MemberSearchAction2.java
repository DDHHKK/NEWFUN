package net.member.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.host.db.HostBean;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberSearchAction2 implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		HostBean hb = new HostBean();
		String address = request.getParameter("search_info");
		hb.setAddress(address);
		String start_date = "0";
		String end_date = "0";
		int num = 0;
		
		hb.setAddress(address);
		int pageSize = 10;
	
		System.out.println(hb.getAddress());
		
		MemberDAO mdd= new MemberDAO();
	

		Vector vector = mdd.getsearchList(hb, start_date, end_date,num);
		Vector vector2 = mdd.getsearchList3(hb);
	    List list=(List)vector.get(0);
		List rest =(List)vector2.get(0);
		HttpSession session = request.getSession();

		
		
		session.setAttribute("list", list);
		session.setAttribute("rest", rest);
		session.setAttribute("address", address);
		request.setAttribute("pageSize", pageSize);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./search.me");
	
		
		return forward;
	}
	
}
