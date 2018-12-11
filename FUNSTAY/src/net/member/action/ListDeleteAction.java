package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class ListDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("deletelist excute");
		request.setCharacterEncoding("UTF-8");
		
		int member_num =(Integer.parseInt(request.getParameter("member_num"))) ;
		
		
		System.out.println(member_num);
		
		MemberDAO mdao = new MemberDAO();
		mdao.deleteList(member_num);
		
		ActionForward forward=new ActionForward();
		forward.setPath("./MemberListAction.me");
		forward.setRedirect(true);
		return forward;
		
		
	
	}
	
}
