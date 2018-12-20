package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;

public class QnaboardDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("update QnA  execute()");
		ActionForward forward = new ActionForward();
		
		request.setCharacterEncoding("UTF-8");
		int qna_num = Integer.parseInt(request.getParameter("num"));
		String member_email = request.getParameter("member_email");
		
		MemberDAO mdao = new MemberDAO();
		mdao.deleteQnA(qna_num, member_email);
		
		forward.setRedirect(true);
		forward.setPath("./MemberQNAlist.me");
		return forward;
	}


}
