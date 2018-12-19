package net.search.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.QnaBean;
import net.search.controller.Action;
import net.search.controller.ActionForward;
import net.search.db.SearchDAO;

public class Qna_boardWrite implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewWrite execute()");

		// 세션가져오기
		// 없으면 ./MemberLogin.me ActionForward 이용 이동

		
		request.setCharacterEncoding("UTF-8");		
		
		int QnA_num = Integer.parseInt(request.getParameter("QnA_num"));
		int re_ref = Integer.parseInt(request.getParameter("re_ref"));
		int re_lev = Integer.parseInt(request.getParameter("re_lev"));
		int re_seq = Integer.parseInt(request.getParameter("re_seq"));
		int home_num = Integer.parseInt(request.getParameter("home_num"));
		String room_subject = request.getParameter("room_subject");
		HttpSession session = request.getSession();
		String Member_email = (String)session.getAttribute("email");
	
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		int qna_num = num;
		SearchDAO bdao = new SearchDAO();
		bdao.qna_updateReadcount(qna_num);
		QnaBean qb= bdao.getQnaboard(num);
		
		request.setAttribute("qb", qb);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num", num);
		request.setAttribute("room_subject", room_subject);
		request.setAttribute("Member_email", Member_email);
		request.setAttribute("QnA_num", QnA_num);
		request.setAttribute("re_ref", re_ref);
		request.setAttribute("re_lev", re_lev);
		request.setAttribute("re_seq", re_seq);
		request.setAttribute("home_num", home_num);
		
		ActionForward forward = new ActionForward();
		
		forward = new ActionForward();
		forward.setPath("./Qna_boardWriteForm.sc");
		forward.setRedirect(false);

		return forward;
	}
}