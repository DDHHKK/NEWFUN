package net.search.Action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.QnaBean;
import net.search.controller.Action;
import net.search.controller.ActionForward;
import net.search.db.SearchDAO;



public class Qna_boardWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewWriteAction execute()");
		//request 한글처리
		request.setCharacterEncoding("utf-8");
		
		QnaBean qb = new QnaBean();
		
		qb.setContent(request.getParameter("content"));
		qb.setHome_num(Integer.parseInt(request.getParameter("home_num")));
		qb.setHome_subject(request.getParameter("home_subject"));
		qb.setMember_email(request.getParameter("member_email"));
		qb.setQnA_num(Integer.parseInt(request.getParameter("qnA_num")));
		qb.setQnA_pass(request.getParameter("qnA_pass"));
		qb.setMember_email(request.getParameter("member_email"));
		qb.setSubject(request.getParameter("subject"));

		
		
		SearchDAO sdao=new SearchDAO();
		//메서드호출 insertReview(폼파라미터 저장된 자바빈 주소)
		sdao.insertQna_board(qb);
		//이동  ./ReviewList.bo
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./SearchList.sc");
		return forward;
	}
	

}


