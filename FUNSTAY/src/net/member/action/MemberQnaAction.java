package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberQnaAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Member QnA check execute()");
		ActionForward forward = new ActionForward();
		
		
		
		
		forward.setRedirect(false);
		forward.setPath("./mypage/QnAcheck.jsp");
		return forward;
	}

}
