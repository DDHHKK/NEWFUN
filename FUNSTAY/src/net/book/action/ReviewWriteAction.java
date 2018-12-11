package net.book.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.controller.Action;
import net.book.controller.ActionForward;
import net.book.db.ReviewBean;
import net.book.db.BookDAO;

public class ReviewWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewWriteAction execute()");
		//request 한글처리
		request.setCharacterEncoding("utf-8");
		
		//ReviewBean bb객체생성
		ReviewBean bb=new ReviewBean();
		
	    bb.setPayment_num(request.getParameter("payment_num"));
		bb.setContent(request.getParameter("content"));
		bb.setSatisfaction(Integer.parseInt(request.getParameter("satisfaction")));
		bb.setClean(Integer.parseInt(request.getParameter("clean")));
		bb.setAccess(Integer.parseInt(request.getParameter("access")));
		bb.setMember_email(request.getParameter("member_email"));
		bb.setHome_num(Integer.parseInt(request.getParameter("home_num")));
		
		
		//BookDAO bdao객체생성
		BookDAO bdao=new BookDAO();
		//메서드호출 insertReview(폼파라미터 저장된 자바빈 주소)
		bdao.insertReview(bb);
		//이동  ./ReviewList.bo
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./room_info/subpage.jsp");
		return forward;
	}
	

}
















