package net.search.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.QnaBean;
import net.search.controller.Action;
import net.search.controller.ActionForward;
import net.search.db.SearchDAO;




public class Qna_boardreWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Qna_boardreWriteAction execute()");

		
		request.setCharacterEncoding("utf-8");
		
		QnaBean qb = new QnaBean();
		
		qb.setSubject(request.getParameter("subject"));
		qb.setContent(request.getParameter("content"));	
		qb.setMember_email(request.getParameter("member_email"));
		qb.setHome_num(Integer.parseInt(request.getParameter("home_num")));	
		qb.setQnA_num(Integer.parseInt(request.getParameter("QnA_num")));
		
		qb.setRe_ref(Integer.parseInt(request.getParameter("re_ref")));
		qb.setRe_lev(Integer.parseInt(request.getParameter("re_lev")));
		qb.setRe_seq(Integer.parseInt(request.getParameter("re_seq")));
		
		System.out.println("홈넘"+qb.getHome_num());
		System.out.println("멤이"+qb.getMember_email());
		System.out.println("cont"+qb.getContent());
		System.out.println("sub"+qb.getSubject());
		System.out.println("ref"+qb.getRe_ref());
		System.out.println("lev"+qb.getRe_lev());
		System.out.println("seq"+qb.getRe_seq());
		 
		SearchDAO bdao = new SearchDAO();
		bdao.reInsertBoard(qb);
   

		ActionForward forward = new ActionForward();
		forward.setPath("./MemberQNAcontent.ho");
		forward.setRedirect(false);

		return forward;
		
	}
}