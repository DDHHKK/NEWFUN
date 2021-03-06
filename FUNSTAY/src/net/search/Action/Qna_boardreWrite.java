package net.search.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.QnaBean;
import net.search.controller.Action;
import net.search.controller.ActionForward;
import net.search.db.SearchDAO;

public class Qna_boardreWrite implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Qna_boardreWrite()");

		// 세션가져오기
		// 없으면 ./MemberLogin.me ActionForward 이용 이동

		
		request.setCharacterEncoding("UTF-8");		
		

		HttpSession session = request.getSession();
		String Member_email = (String)session.getAttribute("email");
		
		int num = Integer.parseInt(request.getParameter("QnA_num"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String home_num = request.getParameter("home_num");
		
		int qna_num = num;
		SearchDAO bdao = new SearchDAO();
		bdao.qna_updateReadcount(qna_num);
		QnaBean qb= bdao.getQnaboard(num);
		
		request.setAttribute("qb", qb);
		request.setAttribute("num", num);
		request.setAttribute("Member_email", Member_email);
		request.setAttribute("subject", subject);
		request.setAttribute("content", content);
		request.setAttribute("home_num", home_num);
		System.out.println("역기여기"+qb.getRe_lev());
		System.out.println("역기여기"+qb.getRe_ref());
		System.out.println("역기여기"+qb.getRe_seq());
		
		ActionForward forward = new ActionForward();
		
		forward = new ActionForward();
		forward.setPath("./Qna_boardreWriteForm.sc");
		forward.setRedirect(false);
 
		return forward;
	}  
}