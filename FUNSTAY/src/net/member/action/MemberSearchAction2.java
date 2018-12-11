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

public class MemberSearchAction2 implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		MemberBean mb = new MemberBean();
		mb.setSearch_info(request.getParameter("search_info"));
		System.out.println(mb.getSearch_info());
		
		MemberDAO mdd= new MemberDAO();
	

	
		Vector vector2 = mdd.getsearchList3(mb);
	 
		 List rest=(List)vector2.get(0);
		
		HttpSession session = request.getSession();

		session.setAttribute("rest", rest);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./search.me");
	
		
		return forward;
	}
	
}
