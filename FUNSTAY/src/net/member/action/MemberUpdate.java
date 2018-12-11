package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberUpdate implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("updateForm execute");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		ActionForward forward = new ActionForward();
		if(email==null){
			
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		MemberDAO mdao = new MemberDAO();
		MemberBean mb = new MemberBean();
		
		mb=mdao.getMember(email);
		request.setAttribute("mb", mb);
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./mypage/update.jsp");
		
		
		return forward;
	}
	
}
