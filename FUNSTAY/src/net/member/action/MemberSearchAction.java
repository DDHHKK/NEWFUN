package net.member.action;

import java.sql.Date;
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

public class MemberSearchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		HostBean hb = new HostBean();
		
		hb.setAddress(request.getParameter("address"));
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		//mb.setText11(Integer.parseInt(request.getParameter("text11")));
		//mb.setText12(Integer.parseInt(request.getParameter("text12")));

	
		MemberDAO mdd= new MemberDAO();
	

		Vector vector = mdd.getsearchList(hb, start_date, end_date);
		Vector vector2 = mdd.getsearchList2(hb);
	    List list=(List)vector.get(0);
		List rest =(List)vector2.get(0);
		HttpSession session = request.getSession();
		session.setAttribute("list", list);
		session.setAttribute("rest", rest);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./search.me");
	
		
		return forward;
	}
	
}
