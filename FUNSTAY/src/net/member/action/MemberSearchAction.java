package net.member.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberSearchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		MemberBean mb = new MemberBean();
		
		mb.setSearch_info(request.getParameter("search_info"));
		mb.setDate_a(request.getParameter("date_a"));
		mb.setDate_b(request.getParameter("date_b"));
		mb.setText11(Integer.parseInt(request.getParameter("text11")));
		mb.setText12(Integer.parseInt(request.getParameter("text12")));
		mb.setImage(request.getParameter("image"));
	

		
		MemberDAO mdd= new MemberDAO();
	

		Vector vector = mdd.getsearchList(mb);
		Vector vector2 = mdd.getsearchList2(mb);
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
