package net.search.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.member.db.QnaBean;
import net.search.controller.Action;
import net.search.controller.ActionForward;
import net.search.db.SearchDAO;

public class Qna_boardWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Qna_boardWriteAction  execute()");
		//request 한글처리
		request.setCharacterEncoding("utf-8");
		QnaBean qb = new QnaBean();  
		
		
/*		qb.setQnA_num(Integer.parseInt(request.getParameter("qnA_num")));*/
		qb.setSubject(request.getParameter("subject"));
		qb.setContent(request.getParameter("content")); 
		qb.setQnA_pass(request.getParameter("qnA_pass"));
		qb.setMember_email(request.getParameter("member_email"));
		qb.setHome_num(Integer.parseInt(request.getParameter("home_num")));
	/*	qb.setRe_ref(Integer.parseInt(request.getParameter("re_ref")));
		qb.setRe_lev(Integer.parseInt(request.getParameter("re_lev")));
		qb.setRe_seq(Integer.parseInt(request.getParameter("re_seq")));*/

		
	//-----------------------------------------------
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		System.out.println("여기"+num);


		request.setAttribute("num", num);
	
		SearchDAO sdao=new SearchDAO();
		//메서드호출 insertReview(폼파라미터 저장된 자바빈 주소)
		sdao.insertQna_board(qb);
		//이동  ./ReviewList.bo
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./RoomDetail.sc?num="+num+"&pageNum="+pageNum);
		return forward;
	}
	

}



